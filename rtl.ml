open Ast
open Rtltree
open Format

exception Error of string

let graph = ref Label.M.empty
let function_table = Hashtbl.create 16

let var_reg ctx v =
  if Hashtbl.mem ctx v.v_name then Hashtbl.find ctx v.v_name
  else
    let new_reg = Register.fresh () in
    Hashtbl.add ctx v.v_name new_reg;
    new_reg

let add_to_cfg i =
  let l = Label.fresh () in
  graph := Label.M.add l i !graph;
  l

let my_malloc size addr_reg l_next =
  let size_reg = Register.fresh () in
  let alloc_lb = add_to_cfg (Ecall (addr_reg, "malloc", [size_reg], l_next)) in
  let load_size_lb = add_to_cfg (Econst (Cint (Int64.of_int (8*(size))), size_reg, alloc_lb)) in
  load_size_lb

let my_lea r_addr r_base m r_idx l =
  let r_m = Register.fresh() in
  let m_intermediate_addr = Register.fresh () in
  let l_mov = add_to_cfg (Embinop (Ops.Mmov, m_intermediate_addr, r_addr, l)) in
  let l_add = add_to_cfg (Embinop (Ops.Madd, r_base, m_intermediate_addr, l_mov)) in
  let l_mul = add_to_cfg (Embinop (Ops.Mmul, r_m, m_intermediate_addr, l_add)) in
  let l_load = add_to_cfg (Embinop (Ops.Mmov, r_idx, m_intermediate_addr, l_mul)) in
  add_to_cfg (Econst (Cint m, r_m, l_load))

let my_eloadr r_out r_base m r_idx l =
  let r_addr = Register.fresh() in
  let l_load = add_to_cfg (Eload (r_addr, 0, r_out, l)) in
  my_lea r_addr r_base m r_idx l_load

let my_estorer r_in r_base m r_idx l =
  let r_addr = Register.fresh() in
  let l_load = add_to_cfg (Estore (r_in, r_addr, 0, l)) in
  my_lea r_addr r_base m r_idx l_load

let rec rtl_if e if_stmt else_stmt ctx ld rd l_exit =
  let test_reg = Register.fresh () in
  let if_lb = rtl_stmt if_stmt ctx ld rd l_exit in
  let else_lb = rtl_stmt else_stmt ctx ld rd l_exit in
  let test_lb = add_to_cfg (Emubranch (Ops.Mjnz, test_reg, if_lb, else_lb)) in
  rtl_expr_val e ctx test_lb test_reg

and rtl_for e stmt ctx ld rd l_exit =
  (* TODO *)
  let test_reg = Register.fresh () in
  let test_lb = Label.fresh () in
  let eval_lb = rtl_expr_addr e ctx test_lb test_reg in
  let block_lb = rtl_stmt stmt ctx eval_lb rd l_exit in
  let test_instr = Emubranch (Ops.Mjnz, test_reg, block_lb, ld) in
  graph := Label.M.add test_lb test_instr !graph;
  eval_lb

and rtl_unop u e ctx ld rd =
  match u with
  | Uneg ->
      let r_result = Register.fresh () in
      let l_sub = add_to_cfg (Embinop (Ops.Msub, r_result, rd, ld)) in
      let l_load_zero = add_to_cfg (Econst (Cint 0L, rd, l_sub)) in
      rtl_expr_val e ctx l_load_zero r_result
  | Unot ->
      let r_result = add_to_cfg (Emunop (Ops.Msetei 0L, rd, ld)) in
      rtl_expr_val e ctx r_result rd

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
    | _ -> raise (Error("(rtl) rtl_binop received bad type"))
  in
  match b with
  | Badd | Bdiv | Bmul | Bsub | Beq | Bneq | Bge | Bgt | Ble | Blt ->
      let instr = instr_translate b in
      let r_e1 = Register.fresh () in
      let r_e2 = Register.fresh () in
      let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e1, rd, ld)) in
      let l_do_op = add_to_cfg (Embinop (instr, r_e2, r_e1, l_cpy_result)) in
      let l_e2 = rtl_expr_val e2 ctx l_do_op r_e2 in
      rtl_expr_val e1 ctx l_e2 r_e1
  | Band ->
      let r_e1 = Register.fresh () in
      let r_e2 = Register.fresh () in
      let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e2, rd, ld)) in
      let l_test_e2 = add_to_cfg (Emunop (Ops.Msetnei 0L, r_e2, l_cpy_result)) in
      let l_calc_e2 = rtl_expr_val e2 ctx l_test_e2 r_e2 in
      let l_ret_false = add_to_cfg (Econst (Cint 0L, rd, ld)) in
      let l_test_e1 = add_to_cfg (Emubranch (Ops.Mjnz, r_e1, l_calc_e2, l_ret_false)) in
      let l_calc_e1 = rtl_expr_val e1 ctx l_test_e1 r_e1 in
      l_calc_e1
  | Bor ->
      let r_e1 = Register.fresh () in
      let r_e2 = Register.fresh () in
      let l_cpy_result = add_to_cfg (Embinop (Ops.Mmov, r_e2, rd, ld)) in
      let l_test_e2 = add_to_cfg (Emunop (Ops.Msetnei 0L, r_e2, l_cpy_result)) in
      let l_calc_e2 = rtl_expr_val e2 ctx l_test_e2 r_e2 in
      let l_ret_false = add_to_cfg (Econst (Cint 1L, rd, ld)) in
      let l_test_e1 = add_to_cfg (Emubranch (Ops.Mjz, r_e1, l_calc_e2, l_ret_false)) in
      let l_calc_e1 = rtl_expr_val e1 ctx l_test_e1 r_e1 in
      l_calc_e1

and rtl_call fn params ctx ld rd =
  let rec gen_registers n = if n == 0 then [] else Register.fresh () :: gen_registers (n - 1) in
  let rec rtl_params params regs_args ld =
    match (params, regs_args) with
    | e :: etail, f :: ftail -> rtl_expr_addr e ctx (rtl_params etail ftail ld) f
    | [], [] -> ld
    | _, _ -> raise (Error "(rtl) bad arity in function call")
  in
  let regs_args = gen_registers (List.length params) in
  let l_call = add_to_cfg (Ecall (rd, fn.fn_name, regs_args, ld)) in
  let l_start = rtl_params params regs_args l_call in
  l_start
  
and rtl_expr_addr e ctx ld rd =
  match e with
  | TEcst (Cnone) -> 
    let val_type_reg = Register.fresh () in
    let addr_reg = Register.fresh () in
    let l_move = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in
    let store_lb_2 = add_to_cfg (Estore (val_type_reg, addr_reg, 8, l_move)) in
    let store_lb = add_to_cfg (Estore (val_type_reg, addr_reg, 0, store_lb_2)) in
    let val_type_lb = add_to_cfg (Econst (Cint 0L, val_type_reg, store_lb)) in
    let alloc_lb = my_malloc 2 addr_reg val_type_lb in
    alloc_lb
  | TEcst (Cint i) ->
    let val_reg = Register.fresh () in
    let type_reg = Register.fresh () in
    let addr_reg = Register.fresh () in
    let l_move = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in
    let store_lb_2 = add_to_cfg (Estore (val_reg, addr_reg, 8, l_move)) in
    let store_lb = add_to_cfg (Estore (type_reg, addr_reg, 0, store_lb_2)) in
    let val_lb = add_to_cfg (Econst (Cint i, val_reg, store_lb)) in
    let type_lb = add_to_cfg (Econst (Cint 2L, type_reg, val_lb)) in
    let alloc_lb = my_malloc 2 addr_reg type_lb in
    alloc_lb
  | TEcst (Cbool b) ->
    let val_reg = Register.fresh () in
    let type_reg = Register.fresh () in
    let addr_reg = Register.fresh () in
    let l_move = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in
    let store_lb_2 = add_to_cfg (Estore (val_reg, addr_reg, 8, l_move)) in
    let store_lb = add_to_cfg (Estore (type_reg, addr_reg, 0, store_lb_2)) in
    let bool_of_i = if b then Cint 1L else Cint 0L in
    let val_lb = add_to_cfg (Econst (bool_of_i, val_reg, store_lb)) in
    let type_lb = add_to_cfg (Econst (Cint 1L, type_reg, val_lb)) in
    let alloc_lb = my_malloc 2 addr_reg type_lb in
    alloc_lb
  | TEcst (Cstring s) ->
    let addr_reg = Register.fresh () in
    let l_move = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in
    
    let explode t = List.init (String.length t) (String.get t) in
    let rec set_string i = function
      | [] -> l_move
      | head :: tail ->
          let value_reg = Register.fresh () in
          let alloc_lb = add_to_cfg (Estore (value_reg, addr_reg, i*8, set_string (i+1) tail)) in
          let value_lb = add_to_cfg (Econst(Cint(Int64.of_int (Char.code head)), value_reg, alloc_lb)) in
          value_lb
      in
      let len_list = String.length s in
      let type_reg = Register.fresh () in
      let len_reg = Register.fresh () in
      let list_label = set_string 2 (explode s) in
      let store_lb_2 = add_to_cfg (Estore (len_reg, addr_reg, 8, list_label)) in
      let store_lb = add_to_cfg (Estore (type_reg, addr_reg, 0, store_lb_2)) in
      let val_lb = add_to_cfg (Econst (Cint(Int64.of_int (len_list)), len_reg, store_lb)) in
      let type_lb = add_to_cfg (Econst (Cint 3L, type_reg, val_lb)) in
      let alloc_lb = my_malloc ((len_list+2)) addr_reg type_lb in
      alloc_lb
  | TEvar v ->
    print_endline "eror 2";
    add_to_cfg (Embinop (Ops.Mmov, var_reg ctx v, rd, ld))
  | TEbinop (binop, e1, e2) -> rtl_binop binop e1 e2 ctx ld rd
  | TEunop (unop, expr) -> rtl_unop unop expr ctx ld rd
  | TEcall (fn, expr_list) -> rtl_call fn expr_list ctx ld rd
  | TElist expr_list ->
    let rec set_list i = function
      | [] -> ld
      | expr :: tail ->
          let value_reg = Register.fresh () in
          let alloc_lb = add_to_cfg (Estore (value_reg, rd ,i*8, set_list (i+1) tail)) in
          let value_lb = rtl_expr_addr expr ctx alloc_lb value_reg in
          value_lb
    in
    let len_list = List.length expr_list in
    let type_reg = Register.fresh () in
    let len_reg = Register.fresh () in
    let list_label = set_list 2 expr_list in
    let store_lb_2 = add_to_cfg (Estore (len_reg, rd, 8, list_label)) in
    let store_lb = add_to_cfg (Estore (type_reg, rd, 0, store_lb_2)) in
    let val_lb = add_to_cfg (Econst (Cint(Int64.of_int (len_list)), len_reg, store_lb)) in
    let type_lb = add_to_cfg (Econst (Cint 4L, type_reg, val_lb)) in
    let alloc_lb = my_malloc (len_list+2) rd type_lb in
    alloc_lb
  | TErange e -> raise (Error "(rtl) not implemented")
  | TEget (e1, e2) ->
      let r_addr_e1 = Register.fresh () in
      let r_val_e2 = Register.fresh () in
      let r_two = Register.fresh () in
      let l_load = my_eloadr rd r_addr_e1 8L r_val_e2 ld in
      let l_addr_e1 = rtl_expr_addr e1 ctx l_load r_addr_e1 in
      let l_add = add_to_cfg (Embinop (Ops.Madd, r_two, r_val_e2, l_addr_e1)) in
      let l_load_two = add_to_cfg (Econst (Cint 2L, r_two, l_add)) in
      rtl_expr_val e2 ctx l_load_two r_val_e2

and val_type_of_addr addr_reg ld type_reg val_reg =
  (* fills type_reg and val_reg with type (between 0 and 4) and value (or len for string/list) *)
  let val_lb = add_to_cfg (Eload (addr_reg, 8, val_reg, ld)) in
  let type_lb = add_to_cfg (Eload (addr_reg, 0, type_reg, val_lb)) in
  type_lb

and val_of_addr addr_reg ld val_reg =
  (* fills type_reg and val_reg with type (between 0 and 4) and value (or len for string/list) *)
  add_to_cfg (Eload (addr_reg, 8, val_reg, ld))
  
and rtl_expr_val_type_addr e ctx ld val_reg type_reg addr_reg =
  let load_val_lb = val_type_of_addr addr_reg ld type_reg val_reg in
  rtl_expr_addr e ctx load_val_lb addr_reg

and rtl_expr_val e ctx ld val_reg =
  let addr_reg = Register.fresh () in
  let load_val_lb = val_of_addr addr_reg ld val_reg in
  rtl_expr_addr e ctx load_val_lb addr_reg

and my_print_macro e ctx ld rd =
  let r_ret_useless = Register.fresh () in
      let r_type = Register.fresh () in
      let r_val = Register.fresh () in
      let r_addr = Register.fresh () in
      let r_antislashn = Register.fresh () in

      let l_antislashn = add_to_cfg (Ecall (r_ret_useless, "putchar", [r_antislashn], ld)) in
      let load_antislashn = add_to_cfg (Econst(Cint 10L, r_antislashn, l_antislashn)) in

      let is_leq_branch reg i l_true l_next =
        add_to_cfg (Emubranch (Ops.Mjlei (i), reg, l_true, l_next))
      in

      (* NoneType *)
      let lbl_0 = 
        let r_none = Register.fresh () in
        let lbl_printnone = add_to_cfg (Ecall (r_ret_useless, "printf", [r_none], load_antislashn)) in
        add_to_cfg(Econst(Cstring "None", r_none, lbl_printnone))
      in

      (* Bool *)
      let lbl_1 = 
        let r_txt = Register.fresh () in
        let lbl_print = add_to_cfg (Ecall (r_ret_useless, "printf", [r_txt], load_antislashn)) in
        let lbl_false = add_to_cfg(Econst(Cstring "False", r_txt, lbl_print)) in
        let lbl_true = add_to_cfg(Econst(Cstring "True", r_txt, lbl_print)) in
        is_leq_branch r_val 0L lbl_false lbl_true
      in
      
      (* Int *)
      let lbl_2 = 
        let r_fmt = Register.fresh () in
        let lbl_print_int = add_to_cfg (Ecall (r_ret_useless, "printf", [r_fmt; r_val], load_antislashn)) in
        add_to_cfg(Econst(Cstring "%d", r_fmt, lbl_print_int))
      in
      
    (* String *)
    let lbl_3 =
      let r_char = Register.fresh () in
      let r_counter = Register.fresh () in
      let r_idx = Register.fresh () in
      let r_one = Register.fresh () in
      let r_two = Register.fresh () in
      let r_val_2 = Register.fresh () in

      (* goto cmp < increment counter < putchar < load char *)
      let l_incr_counter = Label.fresh () in
      let l_putchar = add_to_cfg (Ecall (r_ret_useless, "putchar", [r_char], l_incr_counter)) in
      let load_char = my_eloadr r_char r_addr 8L r_idx l_putchar in
      let l_set_idx_2 = add_to_cfg (Embinop (Ops.Madd, r_two, r_idx, load_char)) in
      let l_set_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_set_idx_2)) in
      let l_cmp = add_to_cfg (Emubranch (Ops.Mjnz, r_val_2, l_set_idx, load_antislashn)) in
      let l_sub = add_to_cfg (Embinop (Ops.Msub, r_counter, r_val_2, l_cmp)) in
      let l_loadtwo = add_to_cfg (Econst (Cint 2L, r_two, l_sub)) in
      let l_loadone = add_to_cfg (Econst (Cint 1L, r_one, l_loadtwo)) in
      let lbl_addr = add_to_cfg (Eload (r_addr, 8, r_val_2, l_loadone)) in
      graph := Label.M.add l_incr_counter (Embinop (Ops.Madd, r_one, r_counter, lbl_addr)) !graph;
      add_to_cfg (Econst(Cint 0L, r_counter, lbl_addr));
    in

    (* List / only prints lists of ints *)
    let lbl_4 =
      let r_item_addr = Register.fresh () in
      let r_item_val = Register.fresh () in
      let r_counter = Register.fresh () in
      let r_idx = Register.fresh () in
      let r_one = Register.fresh () in
      let r_two = Register.fresh () in
      let r_fmt = Register.fresh () in
      let r_val_2 = Register.fresh () in

      (* goto cmp < increment counter < printf value < load value *)
      let l_incr_counter = Label.fresh () in
      let l_putchar = add_to_cfg (Ecall (r_ret_useless, "printf", [r_fmt; r_item_val], l_incr_counter)) in
      let load_item_val = add_to_cfg (Eload (r_item_addr, 8, r_item_val, l_putchar)) in
      let load_item_addr = my_eloadr r_item_addr r_addr 8L r_idx load_item_val in
      let l_set_idx_2 = add_to_cfg (Embinop (Ops.Madd, r_two, r_idx, load_item_addr)) in
      let l_set_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_set_idx_2)) in
      let l_cmp = add_to_cfg (Emubranch (Ops.Mjnz, r_val_2, l_set_idx, load_antislashn)) in
      let l_sub = add_to_cfg (Embinop (Ops.Msub, r_counter, r_val_2, l_cmp)) in
      let l_loadtwo = add_to_cfg (Econst (Cint 2L, r_two, l_sub)) in
      let l_loadone = add_to_cfg (Econst (Cint 1L, r_one, l_loadtwo)) in
      let lbl_addr = add_to_cfg (Eload (r_addr, 8, r_val_2, l_loadone)) in
      let l_load_fmt = add_to_cfg (Econst (Cstring "%d", r_fmt, lbl_addr)) in
      graph := Label.M.add l_incr_counter (Embinop (Ops.Madd, r_one, r_counter, lbl_addr)) !graph;
      add_to_cfg (Econst(Cint 0L, r_counter, l_load_fmt));
    in

      let l_cmp4 = is_leq_branch r_type 4L lbl_4 ld in
      let l_cmp3 = is_leq_branch r_type 3L lbl_3 l_cmp4 in
      let l_cmp2 = is_leq_branch r_type 2L lbl_2 l_cmp3 in
      let l_cmp1 = is_leq_branch r_type 1L lbl_1 l_cmp2 in
      let l_cmp0 = is_leq_branch r_type 0L lbl_0 l_cmp1 in
      (*let return_zero = add_to_cfg (Econst(Cint 0L, rd, l_cmp0)) in*)
      let val_lb = add_to_cfg (Eload (r_addr, 8, r_val, l_cmp0)) in
      let type_lb = add_to_cfg (Eload (r_addr, 0, r_type, val_lb)) in
      rtl_expr_addr e ctx type_lb r_addr

and rtl_stmt stmt ctx ld r_ret l_exit =
  match stmt with
  | TSreturn expr ->
      let result_reg = Register.fresh () in
      let ret_lb = add_to_cfg (Embinop (Ops.Mmov, result_reg, r_ret, l_exit)) in
      rtl_expr_val expr ctx ret_lb result_reg
  | TSif (expr, if_stmt, else_stmt) -> rtl_if expr if_stmt else_stmt ctx ld r_ret l_exit
  | TSblock block -> rtl_block block ctx ld r_ret l_exit
  | TSfor (v, expr, stmt) ->
    raise (Error "(rtl) not implemented")
    
  | TSset (e1, e2, e3) -> 
          (match e2 with 
   | TEvar v -> 
    print_endline "eror 3";
        let var_reg =
            if Hashtbl.mem ctx v.v_name then Hashtbl.find ctx v.v_name
            else raise (Error "Variable not found in context")
        in
        let index_reg = Register.fresh () in
        let list_reg = Register.fresh () in
        let value_reg = Register.fresh () in
        let store_lb = my_estorer value_reg list_reg 8L index_reg ld in
        let list_lb = rtl_expr_val e1 ctx store_lb list_reg in
        let index_lb = rtl_expr_val e2 ctx list_lb index_reg in
        let value_lb = rtl_expr_val e3 ctx index_lb value_reg in
        value_lb

    | TEcst (Cint i) -> 
        let offset = Int64.to_int i * 8 in
        let list_reg = Register.fresh () in
        let value_reg = Register.fresh () in
        let store_lb = add_to_cfg (Estore (value_reg, r_ret, offset, ld)) in
        let list_lb = rtl_expr_val e1 ctx store_lb list_reg in
        let value_lb = rtl_expr_val e3 ctx list_lb value_reg in
        store_lb
    | _ -> raise (Error "Invalid expression in set"))

  | TSeval e ->
      let result_reg = Register.fresh () in
      rtl_expr_val e ctx ld result_reg
  | TSprint e ->
      print_endline "testok";
      my_print_macro e ctx ld r_ret
  | TSassign (v, e) ->
      let calc_reg = Register.fresh () in
      let assign_lb = add_to_cfg (Embinop (Ops.Mmov, calc_reg, var_reg ctx v, ld)) in
      rtl_expr_addr e ctx assign_lb calc_reg

and rtl_stmt_list stmtlist ctx ld (result : Register.t) l_exit =
  match stmtlist with
  | stmt :: [] ->
      let stmtlabel = rtl_stmt stmt ctx ld result l_exit in
      stmtlabel
  | stmt :: remain ->
      let stmtlabel = rtl_stmt stmt ctx ld result l_exit in
      rtl_stmt_list remain ctx stmtlabel result l_exit
  | [] -> add_to_cfg (Egoto (ld))

and rtl_block block ctx d (result : Register.t) l_exit =
  let rev_block = List.rev block in
  let l_block = rtl_stmt_list rev_block ctx d result l_exit in
  l_block

let rtl_def ((fn, stmt) : Ast.tdef) =
  let extract_args table = Hashtbl.fold (fun key value val_list -> val_list @ [ value ]) table [] in
  let r_arg ctx v =
    let r = Register.fresh () in
    Hashtbl.add ctx v.Ast.v_name r;
    r
  in
  let l_exit = Label.fresh () in
  let r_result = Register.fresh () in
  let ctx = Hashtbl.create 16 in
  let regs_args = List.map (r_arg ctx) fn.Ast.fn_params in

  (* create partial entry to allow recursive calls *)
  let partial_fun =
    {
      fun_name = fn.fn_name;
      fun_formals = regs_args;
      fun_result = r_result;
      fun_ctx = Register.set_of_list [];
      fun_entry = Label.fresh ();
      fun_exit = l_exit;
      fun_body = !graph;
    }
  in
  Hashtbl.add function_table fn.fn_name partial_fun;

  (* translate body *)
  let entry = rtl_stmt stmt ctx l_exit r_result l_exit in

  (* final entry *)
  let fun_descr =
    {
      fun_name = fn.fn_name;
      fun_formals = regs_args;
      fun_result = r_result;
      fun_ctx = Register.set_of_list (extract_args ctx);
      fun_entry = entry;
      fun_exit = l_exit;
      fun_body = !graph;
    }
  in
  Hashtbl.replace function_table fn.fn_name fun_descr;
  fun_descr

let file (p : tfile) : rtlfile =
  (* TODO: handle global / local context *)
  { funs = List.map rtl_def p }
