open Ast
open Rtltree
open Format
exception Error of string

let graph = ref Label.M.empty
let function_table = Hashtbl.create 16

let add_to_cfg i =
  let l = Label.fresh() in
  graph := Label.M.add l i !graph;
  l

let rec rtl_if e if_stmt else_stmt ctx ld rd l_exit =
  let test_reg = Register.fresh() in
  let if_lb   = rtl_stmt if_stmt   ctx ld rd l_exit in
  let else_lb = rtl_stmt else_stmt ctx ld rd l_exit in
  let test_lb = add_to_cfg (Emubranch (Ops.Mjnz, test_reg, if_lb, else_lb)) in
  rtl_expr e ctx test_lb test_reg

and rtl_for e stmt ctx ld rd l_exit = (* TODO *)
  let test_reg = Register.fresh() in
  let test_lb = Label.fresh() in
  let eval_lb = rtl_expr e ctx test_lb test_reg in
  let block_lb = rtl_stmt stmt ctx eval_lb rd l_exit in
  let test_instr = Emubranch (Ops.Mjnz, test_reg, block_lb, ld) in
  graph := Label.M.add test_lb test_instr !graph;
  eval_lb

and rtl_unop u e ctx ld rd =
  match u with
  | Uneg ->
    let r_result = Register.fresh() in
    let l_sub = add_to_cfg (Embinop (Ops.Msub, r_result, rd, ld)) in
    let l_load_zero = add_to_cfg(Econst (Cint(0L), rd, l_sub)) in
    rtl_expr e ctx l_load_zero r_result
  | Unot ->
    let r_result = add_to_cfg (Emunop ((Ops.Msetei 0L), rd, ld)) in
    rtl_expr e ctx r_result rd

and rtl_binop b e1 e2 ctx ld rd =
  let instr_translate = function
    | Badd -> Ops.Madd
    | Bsub -> Ops.Msub
    | Bmul -> Ops.Mmul
    | Bdiv -> Ops.Mdiv
    | Bge -> Ops.Msetge
    | Bgt -> Ops.Msetg
    | Ble -> Ops.Msetle
    | Blt -> Ops.Msetl
    | Beq -> Ops.Msete
    | Bneq -> Ops.Msetne
  in
  match b with
  | Badd | Bdiv | Bmul | Bsub | Beq | Bneq | Bge | Bgt | Ble | Blt ->
    let instr = instr_translate b in
    let r_e1 = Register.fresh() in
    let r_e2 = Register.fresh() in
    let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e1, rd, ld)) in
    let l_do_op = add_to_cfg (Embinop (instr, r_e2, r_e1, l_cpy_result)) in
    let l_e2 = rtl_expr e2 ctx l_do_op r_e2 in
    rtl_expr e1 ctx l_e2 r_e1
  | Band ->
    let r_e1 = Register.fresh() in
    let r_e2 = Register.fresh() in
    let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e2, rd, ld)) in
    let l_test_e2 = add_to_cfg (Emunop (Ops.Msetnei (0L), r_e2, l_cpy_result)) in
    let l_calc_e2 = rtl_expr e2 ctx l_test_e2 r_e2 in
    let l_ret_false = add_to_cfg (Econst (Cint(0L), rd, ld)) in
    let l_test_e1 = add_to_cfg (Emubranch (Ops.Mjnz, r_e1, l_calc_e2, l_ret_false)) in
    let l_calc_e1 = rtl_expr e1 ctx l_test_e1 r_e1 in
    l_calc_e1;
  | Bor ->
    let r_e1 = Register.fresh() in
    let r_e2 = Register.fresh() in
    let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e2, rd, ld)) in
    let l_test_e2 = add_to_cfg (Emunop (Ops.Msetnei (0L), r_e2, l_cpy_result)) in
    let l_calc_e2 = rtl_expr e2 ctx l_test_e2 r_e2 in
    let l_ret_false = add_to_cfg (Econst (Cint(1L), rd, ld)) in
    let l_test_e1 = add_to_cfg (Emubranch (Ops.Mjz, r_e1, l_calc_e2, l_ret_false)) in
    let l_calc_e1 = rtl_expr e1 ctx l_test_e1 r_e1 in
    l_calc_e1;

and rtl_call fn params ctx ld rd = 
  let rec gen_registers n = 
    if n == 0 then []
    else Register.fresh() :: gen_registers (n - 1)
  in
  let rec rtl_params params regs_args ld = match params, regs_args with
    | e::etail, f::ftail -> 
      rtl_expr e ctx (rtl_params etail ftail ld) f
    | [],[] -> ld
    | _, _ -> raise (Error "(rtl) bad arity in function call")
  in
  let regs_args = gen_registers (List.length params) in
  let l_call = add_to_cfg (Ecall (rd, fn.fn_name, regs_args, ld)) in
  let l_start = rtl_params params regs_args l_call in
  l_start

and rtl_expr e ctx ld rd =
  match e with
  | TEcst i -> add_to_cfg (Econst (i, rd, ld))
  | TEvar v -> add_to_cfg (Embinop (Ops.Mmov, (Hashtbl.find ctx v.v_name), rd, ld))
  | TEbinop (binop, e1, e2) -> rtl_binop binop e1 e2 ctx ld rd
  | TEunop (unop, expr) -> rtl_unop unop expr ctx ld rd
  | TEcall (fn, expr_list) -> rtl_call fn expr_list ctx ld rd
  | TElist expr_list -> raise (Error "(rtl) not implemented")
  | TErange e -> raise (Error "(rtl) not implemented")
  | TEget (e1, TEvar(e2)) -> (* TODO: debug, I don't understand most of this *)
    let ofs = e2.Ast.v_ofs in
    let r_e2 = Register.fresh() in
    let l_addr = add_to_cfg (Eload (r_e2, 8 * ofs, rd, ld)) in
    rtl_expr e1 ctx l_addr r_e2;
  | TEget (e1, e2) -> raise (Error "(rtl) 'get' not implemented")

and rtl_stmt stmt ctx ld r_ret l_exit =
  match stmt with
  | TSreturn expr -> 
    let result_reg = Register.fresh() in
    let ret_lb = add_to_cfg (Embinop (Ops.Mmov, result_reg, r_ret, l_exit)) in
    rtl_expr expr ctx ret_lb result_reg
  | TSif (expr, if_stmt, else_stmt) -> rtl_if expr if_stmt else_stmt ctx ld r_ret l_exit
  | TSblock block ->  rtl_block block ctx ld r_ret l_exit
  | TSfor (v, expr, stmt) -> raise (Error "(rtl) not implemented")
    (* like rtl_while expr stmt ctx dest_lb return_reg exit_lb *)
  | TSset (e1, e2, e3) -> raise (Error "(rtl) not implemented")
   (* | TEassign_field (structExpr, field, assignExpr) ->
    let offset = field.Ttree.field_pos in
    let struct_reg = Register.fresh() in
    let assign_reg = Register.fresh() in
    (* copy assigned value as return value *)
    let return_lb = generate (Embinop (Ops.Mmov, assign_reg, rd, ld)) in
    (* assign value to field  - offset is (index of field) * (size of a field = 8 bytes) *)
    let access_lb = generate (Estore (assign_reg, struct_reg, 8*offset, return_lb)) in
    (* compute struct pointer *)
    let calcStruct_lb = rtl_expr structExpr ctx access_lb struct_reg in
    (* compute assigned expression *)
    let calcAssign_lb = rtl_expr assignExpr ctx calcStruct_lb assign_reg in
    calcAssign_lb *)
  | TSeval e -> let result_reg = Register.fresh() in rtl_expr e ctx ld result_reg
  | TSprint e -> raise (Error "(rtl) print not implemented")
  | TSassign (v, e) ->
    let var_reg =
      if Hashtbl.mem ctx v.v_name then
        Hashtbl.find ctx v.v_name
      else 
        let new_reg = Register.fresh() in
        Hashtbl.add ctx v.v_name new_reg;
        new_reg
      in
    let calc_reg = Register.fresh() in
    let assign_lb = add_to_cfg (Embinop (Ops.Mmov, calc_reg, var_reg, ld)) in
    rtl_expr e ctx assign_lb calc_reg;


and rtl_stmt_list stmtlist ctx ld (result : Register.t) l_exit =
  match stmtlist with
  | stmt::[] -> let stmtlabel = rtl_stmt stmt ctx ld result l_exit in stmtlabel
  | stmt::remain -> let stmtlabel = rtl_stmt stmt ctx ld result l_exit in rtl_stmt_list remain ctx stmtlabel result l_exit
  | [] -> raise (Error "(rtl) empty body")

and rtl_block block ctx d (result : Register.t) l_exit =
  let rev_block = List.rev block in
  let l_block = rtl_stmt_list rev_block ctx d result l_exit in
  l_block

let rtl_def ((fn, stmt) : Ast.tdef) =
  let extract_args table = Hashtbl.fold (fun key value val_list -> val_list@[value]) table [] in
  let r_arg ctx v = 
    let r = Register.fresh() in
    Hashtbl.add ctx v.Ast.v_name r;
    r
  in
  let l_exit = Label.fresh() in
  let r_result = Register.fresh() in
  let ctx = Hashtbl.create 16 in
  let regs_args = List.map (r_arg ctx) fn.Ast.fn_params in
  
  (* create partial entry to allow recursive calls *)
  let partial_fun = 
    {fun_name = fn.fn_name;
     fun_formals = regs_args;
     fun_result = r_result;
     fun_ctx = Register.set_of_list ([]);
     fun_entry = Label.fresh();
     fun_exit = l_exit;
     fun_body = !graph ;} in
  Hashtbl.add function_table fn.fn_name partial_fun;

  (* translate body *)
  let entry = rtl_stmt stmt ctx l_exit r_result l_exit in

  (* final entry *)
  let fun_descr = 
    {fun_name = fn.fn_name;
     fun_formals = regs_args;
     fun_result = r_result;
     fun_ctx = Register.set_of_list (extract_args ctx);
     fun_entry = entry;
     fun_exit = l_exit;
     fun_body = !graph ;}
  in 
  Hashtbl.replace function_table fn.fn_name fun_descr;
  fun_descr

let file (p : tfile) : rtlfile =
  (* TODO: handle global / local context *)
  {funs = List.map (rtl_def) p}