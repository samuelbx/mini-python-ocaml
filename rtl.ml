(** Typing to RTL translator *)

(**
   instruction are on x86-64 operation,source,destination format
   with dest = dest (operation) source
*)
open Rtltree
open Format
exception Error of string

let graph = ref Label.M.empty
let function_table = Hashtbl.create 16

let generate i =
  let l = Label.fresh() in
  graph := Label.M.add l i !graph;
  l

(* RTL translation for if-else branches *)
let rec rtl_if expr if_stmt else_stmt locals dest_lb dest_reg exit_lb =
  let test_reg = Register.fresh() in
  let if_lb   = rtl_stmt if_stmt   locals dest_lb dest_reg exit_lb in
  let else_lb = rtl_stmt else_stmt locals dest_lb dest_reg exit_lb in
  let test_lb = generate (Emubranch (Ops.Mjnz, test_reg, if_lb, else_lb)) in
  rtl_expr expr locals test_lb test_reg


(* TODO: for loops RTL translation *)
and rtl_while expr stmt locals dest_lb dest_reg exit_lb =
  let test_reg = Register.fresh() in
  let test_lb = Label.fresh() in
  let eval_lb = rtl_expr expr locals test_lb test_reg in
  let block_lb = rtl_stmt stmt locals eval_lb dest_reg exit_lb in
  let test_instr = Emubranch (Ops.Mjnz, test_reg, block_lb, dest_lb) in
  graph := Label.M.add test_lb test_instr !graph;
  eval_lb


(* RTL translation for unary operators *)
and rtl_unop unop expr locals destl dest_register =
  match unop with
  | Ast.Uneg -> let expr_reg = Register.fresh() in (* dest = zero - dest *)
    let sub_lb = generate (Embinop (Ops.Msub, expr_reg, dest_register, destl)) in (* zero = 0 *)
    let loadZero_lb = generate(Econst (Cint(Int64.zero), dest_register, sub_lb)) in (* dest = compute(expr) *)
    rtl_expr expr locals loadZero_lb expr_reg
  | Ast.Unot ->
    let not_lb = generate (Emunop ((Ops.Msetei Int64.zero), dest_register, destl)) in
    rtl_expr expr locals not_lb dest_register

(* RTL translation for binary operators *)
and rtl_binop binop e1 e2 locals destl dest_register =
  let translate_simple_binop binop = match binop with
    | Ast.Badd -> Ops.Madd
    | Ast.Bdiv -> Ops.Mdiv
    | Ast.Bsub -> Ops.Msub
    | Ast.Bmul -> Ops.Mmul
    | Ast.Bge -> Ops.Msetge
    | Ast.Bgt -> Ops.Msetg
    | Ast.Ble -> Ops.Msetle
    | Ast.Blt -> Ops.Msetl
    | Ast.Beq -> Ops.Msete
    | Ast.Bneq -> Ops.Msetne
    | _ -> raise (Error ("(rtl) non-simple binop given to translate_simple_binop"))
  in
  match binop, e1, e2 with 
  | Ast.Badd, Ast.TEcst(Cint i), _ -> 
    let reg_e2 = Register.fresh() in
    let addi = if binop == Ast.Badd then Ops.Maddi(i) else Ops.Maddi(Int64.neg i) in
    let copy_lb = generate (Embinop (Ops.Mmov, reg_e2, dest_register, destl)) in
    let next_instr = generate (Emunop (addi, reg_e2, copy_lb)) in
    rtl_expr e2 locals next_instr reg_e2
  | (Ast.Badd | Ast.Bsub), _, Ast.TEcst(Cint i) -> 
    let reg_e1 = Register.fresh() in
    let addi = if binop == Ast.Badd then Ops.Maddi(i) else Ops.Maddi(Int64.neg i) in
    let copy_lb = generate (Embinop (Ops.Mmov, reg_e1, dest_register, destl)) in
    let next_instr = generate (Emunop (addi, reg_e1, copy_lb)) in
    rtl_expr e1 locals next_instr reg_e1
  | _, _, _ -> 
  

  match binop with
  | (Ast.Badd| Ast.Bdiv | Ast.Bmul | Ast.Bsub)
  | (Ast.Beq | Ast.Bneq | Ast.Bge | Ast.Bgt | Ast.Ble | Ast.Blt) ->
    let conv_binop = translate_simple_binop binop in
    let reg_e1 = Register.fresh() in
    let reg_e2 = Register.fresh() in
    let copy_lb = generate (Embinop (Ops.Mmov, reg_e1, dest_register, destl)) in
    let next_instr = generate (Embinop (conv_binop, reg_e2, reg_e1, copy_lb)) in
    let lb_e2 = rtl_expr e2 locals next_instr reg_e2 in
    rtl_expr e1 locals lb_e2 reg_e1

  | (Ast.Band) ->
    let reg_e1 = Register.fresh() in
    let reg_e2 = Register.fresh() in (* return e2 *)
    let copy_e2_lb = generate (Embinop (Ops.Mmov, reg_e2, dest_register, destl)) in (* e2 = (e2 != 0) *)
    let test_e2_lb = generate (Emunop (Ops.Msetnei (Int64.zero), reg_e2, copy_e2_lb)) in (* if e1 true, compute e2 *)
    let calc_e2_lb = rtl_expr e2 locals test_e2_lb reg_e2 in (* if e1 false, return 0 *)
    let retFalse_lb = generate (Econst (Cint(Int64.zero), dest_register, destl)) in (* test (e1!=0) and jump *)
    let test_e1_lb = generate (Emubranch (Ops.Mjnz, reg_e1, calc_e2_lb, retFalse_lb)) in (* compute e1 *)
    rtl_expr e1 locals test_e1_lb reg_e1

  | (Ast.Bor) ->
    let reg_e1 = Register.fresh() in
    let reg_e2 = Register.fresh() in (* return e2 *)
    let copy_e2_lb = generate (Embinop (Ops.Mmov, reg_e2, dest_register, destl)) in (* e2 = (e2 != 0) *)
    let test_e2_lb = generate (Emunop (Ops.Msetnei (Int64.zero), reg_e2, copy_e2_lb)) in (* if e1 false, compute e2 *)
    let calc_e2_lb = rtl_expr e2 locals test_e2_lb reg_e2 in (* if e1 true, return 1 *)
    let retFalse_lb = generate (Econst (Cint(Int64.one), dest_register, destl)) in (* test (e1 == 0) and jump *)
    let test_e1_lb = generate (Emubranch (Ops.Mjz, reg_e1, calc_e2_lb, retFalse_lb)) in (* compute e1 *)
    rtl_expr e1 locals test_e1_lb reg_e1


and rtl_funcall fun_ident expr_arglist locals destl dest_register = 
  (* Compute and store each argument into the appropriate register *)
  let rec create_reglist n = 
    if n==0 then []
    else Register.fresh() :: create_reglist (n-1)
  in
  let rec parse_formals expr_list formal_reglist finalDest_lb = match expr_list, formal_reglist with
    | expr::expRemain, form::formRemain -> 
      let next_lb = parse_formals expRemain formRemain finalDest_lb in
      rtl_expr expr locals next_lb form
    | [],[] -> finalDest_lb
    | _,_ -> raise (Error "(rtl) bad arity in function call")
  in
  let get_fun_infos fun_ident = match fun_ident with
    | "print" -> ("print", 1) (* TODO: implement *)
    | "len" -> ("len", 1) (* TODO: implement // generate (Econst ((Int64.of_int structure.Ttree.str_totalSize), dest_register, destl)) *)
    | name when Hashtbl.mem function_table name -> 
      let fun_descr = Hashtbl.find function_table name in
      (name, List.length fun_descr.fun_formals)
    | _ -> raise (Error ("(rtl) undefined function " ^ fun_ident))
  in
  let (f_name, f_argLength) = get_fun_infos fun_ident in
  let arg_reglist = create_reglist f_argLength in
  let fun_lb = generate (Ecall (dest_register, fun_ident, arg_reglist, destl)) in
  let start_lb = parse_formals expr_arglist arg_reglist fun_lb in
  start_lb


(* RTL translation of a generic expression *)
and rtl_expr expr locals destl dest_register =
  match expr with
  | TEcst i -> generate (Econst (i, dest_register, destl))
  | TEvar v ->
    let var_reg = Hashtbl.find locals v.v_name in
    generate (Embinop (Ops.Mmov, var_reg, dest_register, destl))
  | TEbinop (binop, e1, e2) ->  rtl_binop binop e1 e2 locals destl dest_register
  | TEunop (unop, expr) ->  rtl_unop unop expr locals destl dest_register
  | TEcall (fn, expr_list) -> rtl_funcall fn.fn_name expr_list locals destl dest_register
  | TElist expr_list -> raise (Error "(rtl) not implemented")
  | TErange e -> raise (Error "(rtl) not implemented")
  | TEget (e1, e2) -> raise (Error "(rtl) not implemented") (* like access_field *)
  (* | Ast.TEaccess_field (structExpr, field) -> 
    let offset = field.Ttree.field_pos in
    let calc_reg = Register.fresh() in
    let access_lb = generate (Eload (calc_reg, 8*offset, dest_register, destl)) in
    let calc_lb = rtl_expr structExpr locals access_lb calc_reg in
    calc_lb *)


(* stmt translation *)
and rtl_stmt stmt locals dest_lb return_reg exit_lb =
  match stmt with
  (* decided to explicitly force a move *)
  (* | Ast.TSreturn expr -> rtl_expr expr locals exit_lb return_reg *)
  | Ast.TSreturn expr -> 
    let result_reg = Register.fresh() in
    let ret_lb = generate (Embinop (Ops.Mmov, result_reg, return_reg, exit_lb)) in
    rtl_expr expr locals ret_lb result_reg
  (* TODO: (???) | Ast.TSexpr expr -> let result_reg = Register.fresh() in rtl_expr expr locals dest_lb result_reg *)
  | Ast.TSif (expr, if_stmt, else_stmt) -> rtl_if expr if_stmt else_stmt locals dest_lb return_reg exit_lb
  | Ast.TSblock block ->  rtl_block block locals dest_lb return_reg exit_lb
  | Ast.TSfor (v, expr, stmt) -> raise (Error "(rtl) not implemented")
    (* like rtl_while expr stmt locals dest_lb return_reg exit_lb *)
  | Ast.TSset (e1, e2, e3) -> raise (Error "(rtl) not implemented")
   (* | Ast.TEassign_field (structExpr, field, assignExpr) ->
    let offset = field.Ttree.field_pos in
    let struct_reg = Register.fresh() in
    let assign_reg = Register.fresh() in
    (* copy assigned value as return value *)
    let return_lb = generate (Embinop (Ops.Mmov, assign_reg, dest_register, destl)) in
    (* assign value to field  - offset is (index of field) * (size of a field = 8 bytes) *)
    let access_lb = generate (Estore (assign_reg, struct_reg, 8*offset, return_lb)) in
    (* compute struct pointer *)
    let calcStruct_lb = rtl_expr structExpr locals access_lb struct_reg in
    (* compute assigned expression *)
    let calcAssign_lb = rtl_expr assignExpr locals calcStruct_lb assign_reg in
    calcAssign_lb *)
  | Ast.TSeval e -> raise (Error "(rtl) not implemented")
  | Ast.TSprint e -> raise (Error "(rtl) print not implemented")
  | Ast.TSassign (v, e) -> raise (Error "(rtl) not implemented")
  (* 
  | Ast.TEassign_local (var_ident, myexpr) -> 
    begin try
        let var_reg = Hashtbl.find locals var_ident in
        let calc_reg = Register.fresh() in
        let sideAssign_lb = generate (Embinop (Ops.Mmov, calc_reg, dest_register, destl)) in
        let assign_lb = generate (Embinop (Ops.Mmov, calc_reg, var_reg, sideAssign_lb)) in
        rtl_expr myexpr locals assign_lb calc_reg
      with 
      |Not_found -> raise (Error ("Variable not found " ^ var_ident))
    end *)


(* Statement list translation *)
and rtl_stmt_list stmtlist locals destl (result:Register.t) exit_lb =
  match stmtlist with
  | stmt::[] -> let stmtlabel = rtl_stmt stmt locals destl result exit_lb in stmtlabel
  | stmt::remain -> let stmtlabel = rtl_stmt stmt locals destl result exit_lb in rtl_stmt_list remain locals stmtlabel result exit_lb
  | [] -> raise (Error "(rtl) empty body")

(* TODO: Block translation *)
and rtl_block stmtlist locals dest_lb (result:Register.t) exit_lb =
  let reversed_stmtlist = List.rev stmtlist in
  let body_lb = rtl_stmt_list reversed_stmtlist locals dest_lb result exit_lb in
  body_lb

(* TODO: Function translation *)
let rtl_fun ((fn, stmt):Ast.tdef) =
  let extract_values table =
    Hashtbl.fold (fun key value val_list -> val_list@[value]) table []
  in
  let add_formal locals v = 
    let reg = Register.fresh() in
    Hashtbl.add locals v.Ast.v_name reg;
    reg
  in
  let exit = Label.fresh() in
  let result = Register.fresh() in
  let locals = Hashtbl.create 16 in
  let formals_reg = List.map (add_formal locals) fn.Ast.fn_params in
  (* create partial entry to allow recursive calls *)
  let partial_fun_descr = 
    {fun_name = fn.Ast.fn_name;
     fun_formals = formals_reg;
     fun_result = result;
     fun_locals = Register.set_of_list ([]);
     fun_entry = Label.fresh();
     fun_exit = exit;
     fun_body = !graph ;} in
  Hashtbl.add function_table partial_fun_descr.fun_name partial_fun_descr;

  (* translate body *)
  let entry = rtl_stmt stmt locals exit result exit in

  (* final entry *)
  let fun_descr = 
    {fun_name = fn.fn_name;
     fun_formals = formals_reg;
     fun_result = result;
     fun_locals = Register.set_of_list (extract_values locals);
     fun_entry = entry;
     fun_exit = exit;
     fun_body = !graph ;}
  in 
  Hashtbl.replace function_table fun_descr.fun_name fun_descr;
  fun_descr

let rec rtl_funlist def_list = 
  List.map (rtl_fun) def_list

let file (p : Ast.tfile) : rtlfile =
  {funs = rtl_funlist p}