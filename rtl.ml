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

let my_malloc_reg size_reg addr_reg l_next =
  add_to_cfg (Ecall (addr_reg, "malloc", [size_reg], l_next))

let my_malloc size addr_reg l_next =
  let size_reg = Register.fresh () in
  let alloc_lb = my_malloc_reg size_reg addr_reg l_next in
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

and rtl_for e v stmt ctx ld rd l_exit =
        let r_cmp = Register.fresh () in
        let r_idx = Register.fresh () in
        let r_counter = Register.fresh () in
        let r_range = Register.fresh () in
        let r_size= Register.fresh() in
        let r_value = var_reg ctx v in
        let l_incr_counter = Label.fresh () in
        let l_stmt = rtl_stmt stmt ctx l_incr_counter rd ld in
        let l_value = my_eloadr r_value r_range 8L r_idx l_stmt in
        let l_cmp = add_to_cfg (Embbranch (Ops.Mjl, r_size, r_counter, l_value, ld)) in
        let l_idx_add = add_to_cfg (Emunop (Ops.Maddi 2L, r_idx, l_cmp)) in
        let l_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_idx_add)) in
        let l_loadcmp = add_to_cfg (Embinop (Ops.Mmov, r_range, r_cmp, l_idx)) in
        let l_size = rtl_expr_val e ctx l_loadcmp r_size in 
        let l_range = rtl_expr_addr e ctx l_size r_range in
        let l_counter = add_to_cfg (Econst (Cint 0L, r_counter, l_range)) in    
        graph := Label.M.add l_incr_counter (Emunop (Maddi 1L, r_counter, l_range)) !graph;
        l_counter

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

and alloc_number type_i pre_val_reg rd ld =
  let val_reg = Register.fresh () in
  let type_reg = Register.fresh () in
  let addr_reg = Register.fresh () in
  let l_move = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in
  let store_lb_2 = add_to_cfg (Estore (pre_val_reg, addr_reg, 8, l_move)) in
  let store_lb = add_to_cfg (Estore (type_reg, addr_reg, 0, store_lb_2)) in
  let type_lb = add_to_cfg (Econst (Cint type_i, type_reg, store_lb)) in
  let alloc_lb = my_malloc 2 addr_reg type_lb in
  alloc_lb

and alloc_int pre_val_reg rd ld =
  alloc_number 2L pre_val_reg rd ld

and alloc_bool pre_val_reg rd ld =
  alloc_number 1L pre_val_reg rd ld

and is_leq_branch reg i l_true l_next =
  add_to_cfg (Emubranch (Ops.Mjlei (i), reg, l_true, l_next))

and compare_type_macro r_type l_none l_bool l_int l_string l_list ld =
  let l_cmp4 = is_leq_branch r_type 4L l_list ld in
  let l_cmp3 = is_leq_branch r_type 3L l_string l_cmp4 in
  let l_cmp2 = is_leq_branch r_type 2L l_int l_cmp3 in
  let l_cmp1 = is_leq_branch r_type 1L l_bool l_cmp2 in
  let l_cmp0 = is_leq_branch r_type 0L l_none l_cmp1 in
  l_cmp0

and instr_translate = function
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

and add_ints b r_v1 r_v2 ctx ld rd =
  let instr = instr_translate b in
  let l_cpy_result = alloc_int r_v1 rd ld in
  let l_do_op = add_to_cfg (Embinop (instr, r_v2, r_v1, l_cpy_result)) in
  l_do_op

and rtl_binop b e1 e2 ctx ld rd =
  match b with
  | Beq | Bneq | Bge | Bgt | Ble | Blt ->
    let instr = instr_translate b in
    let r_v1 = Register.fresh () in
    let r_v2 = Register.fresh () in
    let l_cpy_result = alloc_bool r_v1 rd ld in
    let l_do_op = add_to_cfg (Embinop (instr, r_v2, r_v1, l_cpy_result)) in
    let l_load_v2 = rtl_expr_val e2 ctx l_do_op r_v2 in
    let l_load_v1 = rtl_expr_val e1 ctx l_load_v2 r_v1 in
    l_load_v1

  | Bsub | Bdiv | Bmul | Bmod ->
    let r_v1 = Register.fresh () in
    let r_v2 = Register.fresh () in
    let l_do_op = add_ints b r_v1 r_v2 ctx ld rd in
    let l_load_v2 = rtl_expr_val e2 ctx l_do_op r_v2 in
    let l_load_v1 = rtl_expr_val e1 ctx l_load_v2 r_v1 in
    l_load_v1
    
  | Badd ->
    let r_addr1 = Register.fresh () in
    let r_addr2 = Register.fresh () in
    let l_call = add_to_cfg (Ecall (rd, "__add__", [r_addr1; r_addr2], ld)) in
    let l_load_2 = rtl_expr_addr e2 ctx l_call r_addr2 in
    let l_load_1 = rtl_expr_addr e1 ctx l_call r_addr2 in
    l_load_1
  
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
    let val_reg_pre = Register.fresh () in
    let l_alloc = alloc_int val_reg_pre rd ld in
    add_to_cfg (Econst (Cint i, val_reg_pre, l_alloc))
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
      | TErange e -> 
        let addr_reg = Register.fresh () in
        let r_int = Register.fresh () in
        let r_sub = Register.fresh () in
        let r_type = Register.fresh () in
        let r_len_shifted = Register.fresh () in
        let r_size = Register.fresh () in
        let r_idx = Register.fresh () in
        let r_counter = Register.fresh () in
        let r_len = Register.fresh() in
        let l_incr_counter = Label.fresh () in
        let l_final = add_to_cfg (Embinop (Ops.Mmov, addr_reg, rd, ld)) in 
        let l_value = my_estorer r_int addr_reg 8L r_idx l_incr_counter in
        let l_int_allocate = alloc_int r_counter r_int l_value in
        let l_cmp = add_to_cfg (Emubranch (Ops.Mjnz, r_sub, l_int_allocate, l_final)) in
        let l_sub = add_to_cfg (Embinop (Ops.Msub, r_len_shifted, r_sub, l_cmp)) in 
        let l_load_sub = add_to_cfg (Embinop (Ops.Mmov, r_idx, r_sub, l_sub)) in 
        let l_idx_add = add_to_cfg (Emunop (Ops.Maddi 2L, r_idx, l_load_sub)) in
        let l_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_idx_add)) in 
        graph := Label.M.add l_incr_counter (Emunop (Maddi 1L, r_counter, l_idx)) !graph;
        let l_counter = add_to_cfg (Econst (Cint 0L, r_counter, l_idx)) in    
        let store_len = add_to_cfg (Estore (r_len, addr_reg, 8, l_counter)) in
        let store_type = add_to_cfg (Estore (r_type, addr_reg, 0, store_len)) in
        let type_lb = add_to_cfg (Econst (Cint 4L, r_type, store_type)) in
        let alloc_lb = add_to_cfg (Ecall (addr_reg, "malloc", [r_size], type_lb)) in
        let size_lb = add_to_cfg (Embinop (Ops.Mmul, r_len_shifted, r_size,  alloc_lb)) in
        let load_size = add_to_cfg (Econst (Cint 8L, r_size, size_lb)) in
        let l_len_shifted = add_to_cfg (Emunop (Ops.Maddi 2L, r_len_shifted, load_size)) in
        let l_len_bis = add_to_cfg (Embinop (Ops.Mmov, r_len, r_len_shifted, l_len_shifted)) in
        let l_len = rtl_expr_val e ctx l_len_bis r_len in 
        l_len
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
  
and type_of_addr addr_reg ld val_reg =
  (* fills type_reg and val_reg with type (between 0 and 4) and value (or len for string/list) *)
  add_to_cfg (Eload (addr_reg, 0, val_reg, ld))

and rtl_expr_val_type_addr e ctx ld val_reg type_reg addr_reg =
  let load_val_lb = val_type_of_addr addr_reg ld type_reg val_reg in
  rtl_expr_addr e ctx load_val_lb addr_reg

and rtl_expr_val e ctx ld val_reg =
  let addr_reg = Register.fresh () in
  let load_val_lb = val_of_addr addr_reg ld val_reg in
  rtl_expr_addr e ctx load_val_lb addr_reg

and rtl_expr_type e ctx ld type_reg =
  let addr_reg = Register.fresh () in
  let load_val_lb = type_of_addr addr_reg ld type_reg in
  rtl_expr_addr e ctx load_val_lb addr_reg

and my_len_macro_ r_addr ctx ld rd =
  let val_reg = Register.fresh () in
  let l_alloc = alloc_int val_reg rd ld in
  val_of_addr r_addr l_alloc val_reg

and cpy_block r_addr_src r_addr_dest ofs r_size ld =
  let r_counter = Register.fresh () in
  let r_char = Register.fresh () in

  let l_incr_counter = Label.fresh () in
  let store_char = my_estorer r_char r_addr_dest 8L r_counter l_incr_counter in
  let load_char = my_eloadr r_char r_addr_src 8L r_counter store_char in
  let l_cmp = add_to_cfg (Embbranch (Ops.Mjle, r_counter, r_size, load_char, ld)) in
  graph := Label.M.add l_incr_counter (Emunop (Ops.Maddi 1L, r_counter, l_cmp)) !graph;

  let add_ofs_dest = add_to_cfg (Emunop (Ops.Maddi ofs, r_addr_dest, l_cmp)) in
  let add_ofs_src = add_to_cfg (Emunop (Ops.Maddi ofs, r_addr_src, add_ofs_dest)) in

  add_to_cfg (Econst (Cint 0L, r_counter, add_ofs_src))

and my_add_macro_ r_e1 r_e2 ctx ld rd =
  let add_strings_or_lists r_v1 r_v2 =
    let final_addr_reg = Register.fresh () in
    let cpy_string_2 = cpy_block r_e2 final_addr_reg 2L r_v2 ld in
    let add_size = add_to_cfg (Embinop (Ops.Madd, r_v1, final_addr_reg, cpy_string_2)) in
    let cpy_string_1 = cpy_block r_e1 final_addr_reg 2L r_v1 cpy_string_2 in
    let l_alloc = my_malloc_reg r_v2 final_addr_reg cpy_string_1 in
    add_to_cfg (Embinop (Ops.Madd, r_v1, r_v2, l_alloc))
  in

  let type_reg = Register.fresh () in
  let r_v1 = Register.fresh () in
  let r_v2 = Register.fresh () in
  let l_int = add_ints Badd r_v1 r_v2 ctx ld rd in
  let l_string_list = add_strings_or_lists r_v1 r_v2 in
  let l_cmp = compare_type_macro type_reg ld ld l_int l_string_list l_string_list ld in
  let l_load_v2 = val_of_addr r_e2 l_cmp r_v2 in
  let l_load_v1 = val_of_addr r_e1 l_load_v2 r_v1 in
  type_of_addr r_e1 l_load_v1 type_reg

and add_putchar char ld =
  let r_ret_useless = Register.fresh () in
  let r_char = Register.fresh () in
  let l_call = add_to_cfg (Ecall (r_ret_useless, "putchar", [r_char], ld)) in
  add_to_cfg (Econst(Cint (Int64.of_int (Char.code char)), r_char, l_call))

and my_print_macro_noend_ r_addr ctx ld rd =
  let r_ret_useless = Register.fresh () in
      let r_type = Register.fresh () in
      let r_val = Register.fresh () in
      let r_antislashn = Register.fresh () in

      (* NoneType *)
      let lbl_0 = 
        let r_none = Register.fresh () in
        let lbl_printnone = add_to_cfg (Ecall (r_ret_useless, "printf", [r_none], ld)) in
        add_to_cfg(Econst(Cstring "None", r_none, lbl_printnone))
      in

      (* Bool *)
      let lbl_1 = 
        let r_txt = Register.fresh () in
        let lbl_print = add_to_cfg (Ecall (r_ret_useless, "printf", [r_txt], ld)) in
        let lbl_false = add_to_cfg(Econst(Cstring "False", r_txt, lbl_print)) in
        let lbl_true = add_to_cfg(Econst(Cstring "True", r_txt, lbl_print)) in
        is_leq_branch r_val 0L lbl_false lbl_true
      in
      
      (* Int *)
      let lbl_2 = 
        let r_fmt = Register.fresh () in
        let lbl_print_int = add_to_cfg (Ecall (r_ret_useless, "printf", [r_fmt; r_val], ld)) in
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

      let l_incr_counter = Label.fresh () in
      let l_putchar = add_to_cfg (Ecall (r_ret_useless, "putchar", [r_char], l_incr_counter)) in
      let load_char = my_eloadr r_char r_addr 8L r_idx l_putchar in
      let l_set_idx_2 = add_to_cfg (Embinop (Ops.Madd, r_two, r_idx, load_char)) in
      let l_set_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_set_idx_2)) in
      let l_cmp = add_to_cfg (Emubranch (Ops.Mjnz, r_val_2, l_set_idx, ld)) in
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
      let r_counter = Register.fresh () in
      let r_idx = Register.fresh () in
      let r_val_2 = Register.fresh () in

      (* goto cmp < increment counter < printf value < load value *)
      let l_incr_counter = Label.fresh () in
      let lbl_bracket_end = add_putchar ']' ld in
      let l_print_sep_2 = add_putchar ' ' l_incr_counter in
      let l_print_sep = add_putchar ',' l_print_sep_2 in
      let l_cmp_2 = add_to_cfg (Emubranch (Ops.Mjnz, r_val_2, l_print_sep, l_incr_counter)) in

      let l_precmp = add_to_cfg (Emunop (Ops.Maddi (-1L), r_val_2, l_cmp_2)) in
      let l_sub_2 = add_to_cfg (Embinop (Ops.Msub, r_counter, r_val_2, l_precmp)) in
      let lbl_addr_2 = add_to_cfg (Eload (r_addr, 8, r_val_2, l_sub_2)) in

      let l_putchar = add_to_cfg (Ecall (r_ret_useless, "__print_no_endline__", [r_item_addr], lbl_addr_2)) in
      let load_item_addr = my_eloadr r_item_addr r_addr 8L r_idx l_putchar in
      let l_set_idx_2 = add_to_cfg (Emunop (Ops.Maddi 2L, r_idx, load_item_addr)) in
      let l_set_idx = add_to_cfg (Embinop (Ops.Mmov, r_counter, r_idx, l_set_idx_2)) in
      let l_cmp = add_to_cfg (Emubranch (Ops.Mjnz, r_val_2, l_set_idx, lbl_bracket_end)) in
      let l_sub = add_to_cfg (Embinop (Ops.Msub, r_counter, r_val_2, l_cmp)) in
      let lbl_addr = add_to_cfg (Eload (r_addr, 8, r_val_2, l_sub)) in
      graph := Label.M.add l_incr_counter (Emunop (Ops.Maddi 1L, r_counter, lbl_addr)) !graph;
      let lbl_bracket_start = add_putchar '[' lbl_addr in
      add_to_cfg (Econst(Cint 0L, r_counter, lbl_bracket_start));
    in

    let l_cmp = compare_type_macro r_type lbl_0 lbl_1 lbl_2 lbl_3 lbl_4 ld in
    let val_lb = add_to_cfg (Eload (r_addr, 8, r_val, l_cmp)) in
    let type_lb = add_to_cfg (Eload (r_addr, 0, r_type, val_lb)) in
    type_lb

and my_print_macro_ r_addr ctx ld rd =
  let r_ret_useless = Register.fresh () in
      let r_type = Register.fresh () in
      let r_val = Register.fresh () in
      let r_antislashn = Register.fresh () in

      let l_antislashn = add_to_cfg (Ecall (r_ret_useless, "putchar", [r_antislashn], ld)) in
      let load_antislashn = add_to_cfg (Econst(Cint 10L, r_antislashn, l_antislashn)) in
    add_to_cfg (Ecall (r_ret_useless, "__print_no_endline__", [r_addr], load_antislashn))

and my_print_macro e ctx ld rd =
    let r_addr = Register.fresh () in
    let l_print = my_print_macro_ r_addr ctx ld rd in
    rtl_expr_addr e ctx l_print r_addr

and rtl_stmt stmt ctx ld r_ret l_exit =
  match stmt with
  | TSreturn expr ->
      let result_reg = Register.fresh () in
      let ret_lb = add_to_cfg (Embinop (Ops.Mmov, result_reg, r_ret, l_exit)) in
      rtl_expr_addr expr ctx ret_lb result_reg
  | TSif (expr, if_stmt, else_stmt) -> rtl_if expr if_stmt else_stmt ctx ld r_ret l_exit
  | TSblock block -> rtl_block block ctx ld r_ret l_exit
  | TSfor (v, expr, stmt) ->
        rtl_for  expr v stmt ctx ld r_ret l_exit
  | TSset (e1, e2, e3) -> 
        let index_reg = Register.fresh () in
        let list_reg = Register.fresh () in
        let value_reg = Register.fresh () in
        let store_lb = my_estorer value_reg list_reg 8L index_reg ld in
        let shifted_idx = add_to_cfg (Emunop (Ops.Maddi 2L, index_reg, store_lb)) in
        let list_lb = rtl_expr_addr e1 ctx shifted_idx list_reg in
        let index_lb = rtl_expr_val e2 ctx list_lb index_reg in
        let value_lb = rtl_expr_addr e3 ctx index_lb value_reg in
        value_lb

  | TSeval e ->
      let result_reg = Register.fresh () in
      rtl_expr_val e ctx ld result_reg
  | TSprint e ->
    let r_addr = Register.fresh () in
    let call_l = add_to_cfg (Ecall (r_ret, "__print__", [r_addr], ld)) in
    rtl_expr_addr e ctx call_l r_addr
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

let rec add_macro name body =
  let r_arg ctx v =
    let r = Register.fresh () in
    Hashtbl.add ctx v.Ast.v_name r;
    r
  in
  let print_register = Register.fresh () in
  let print_var = {
    v_name = name ^ "var";
    v_ofs = 0;
  } in
  let ctx = Hashtbl.create 16 in
  Hashtbl.add ctx print_var.v_name print_register;
  let r_result = Register.fresh () in
  let l_exit = Label.fresh () in
  let entry = body print_register ctx l_exit r_result in
  let print_fun =
    {
      fun_name = name;
      fun_formals = [print_register] ;
      fun_result = r_result;
      fun_ctx = Register.set_of_list [];
      fun_entry = entry;
      fun_exit = l_exit;
      fun_body = !graph;
    }
  in
  Hashtbl.add function_table print_fun.fun_name print_fun;
  print_fun

(* TODO: factor with previous function *)
let rec add_macro_2_vars name body =
  let r_arg ctx v =
    let r = Register.fresh () in
    Hashtbl.add ctx v.Ast.v_name r;
    r
  in
  let reg_1 = Register.fresh () in
  let reg_2 = Register.fresh () in
  let var_1 = {
    v_name = name ^ "var1";
    v_ofs = 0;
  } in
  let var_2 = {
    v_name = name ^ "var2";
    v_ofs = 0;
  } in
  let ctx = Hashtbl.create 16 in
  Hashtbl.add ctx var_1.v_name reg_1;
  Hashtbl.add ctx var_2.v_name reg_2;
  let r_result = Register.fresh () in
  let l_exit = Label.fresh () in
  let entry = body reg_1 reg_2 ctx l_exit r_result in
  let print_fun =
    {
      fun_name = name;
      fun_formals = [reg_1; reg_2] ;
      fun_result = r_result;
      fun_ctx = Register.set_of_list [];
      fun_entry = entry;
      fun_exit = l_exit;
      fun_body = !graph;
    }
  in
  Hashtbl.add function_table print_fun.fun_name print_fun;
  print_fun

let file (p : tfile) : rtlfile =
  (* TODO: handle global / local context *)
  { funs = [add_macro "__print__" my_print_macro_;
            add_macro "__print_no_endline__" my_print_macro_noend_;
            add_macro "__len__" my_len_macro_;
            add_macro_2_vars "__add__" my_add_macro_] @ List.map (rtl_def) p }
