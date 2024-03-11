open Ertltree
open Ops
open Register
open Format
open Liveness
exception Error of string

let graph = ref Label.M.empty

let add_to_cfg instr =
  let l = Label.fresh () in
  graph := Label.M.add l instr !graph;
  l

let treat_ecall dest_reg fun_name rList lb =  
  let lastLabel = if  List.length rList > 6 then add_to_cfg (Emunop ( Maddi ( Int64.of_int(((List.length rList) - 6) * 8 )) , Register.rsp, lb)) else lb in
  let labelcopy = add_to_cfg (Embinop(Mmov, Register.result, dest_reg, lastLabel)) in
  let usedRegs = if List.length rList <= 6 then List.length rList else 6 in
  let labelCall = add_to_cfg (Ecall (fun_name, usedRegs, labelcopy)) in
  let rec fill_recursif registerList index label=
    if index < 6 then 
      begin match registerList with 
      | reg::remain -> let newLabel = add_to_cfg (Embinop (Mmov, reg, (List.nth Register.parameters index), label)) in fill_recursif remain (index+1) newLabel
      | [] -> label
      end
    else 
      begin match registerList with 
    | reg::remain -> let newLabel = add_to_cfg (Epush_param (reg, label)) in fill_recursif remain (index+1) newLabel
    | [] -> label
      end
  in let secondLabel = fill_recursif rList 0 labelCall in
  let goto = Egoto secondLabel in goto 
    
let treat_div r1 r2 l = 
  let label1 = add_to_cfg (Embinop (Mmov, Register.rax, r2 , l)) in
  let label2 = add_to_cfg (Embinop (Mdiv, r1, Register.rax, label1)) in
  Embinop (Mmov ,r2, Register.rax, label2)

let ertl_instr = function
  | Rtltree.Econst (n, r, l) -> Econst (n, r, l)
  | Rtltree.Eload (r1, n, r2, l) -> Eload (r1, n, r2, l)
  | Rtltree.Estore (r1, r2, n, l) -> Estore (r1, r2, n, l)
  | Rtltree.Emunop  (m, r, l) -> Emunop (m, r, l)
  | Rtltree.Embinop (Mdiv, r1, r2, l) -> treat_div r1 r2 l
  | Rtltree.Embinop (m, r1, r2, l) -> Embinop (m, r1, r2, l)
  | Rtltree.Emubranch (m, r, l1, l2) -> Emubranch (m, r, l1, l2)
  | Rtltree.Embbranch (m, r1, r2, l1, l2) -> Embbranch (m, r1, r2, l1, l2)
  | Rtltree.Ecall (r, s, rlist, l) -> treat_ecall r s rlist l

  let treat_instr_label l i =
  let i = ertl_instr i in 
  graph := Label.M.add l i !graph
  
let ertl_body fun_body = Label.M.iter treat_instr_label fun_body

let ertl_fun fn = 
  ertl_body fn.Rtltree.fun_body;

  (* entrée de la fonction*)
  let rec get_args argList count label =
    if count < 6 then 
    begin match argList with 
    | reg::remain -> let newLabel = add_to_cfg (Embinop (Mmov, (List.nth Register.parameters count), reg , label)) in get_args remain (count+1) newLabel
    | [] -> label
    end
  else 
    begin match argList with 
    | reg::remain -> let newLabel = add_to_cfg (Eget_param ((count - 6) * 8 + 16, reg, label)) in get_args remain (count+1) newLabel
    | [] -> label
    end
  in
  let first_arg_label = get_args fn.Rtltree.fun_formals 0 fn.Rtltree.fun_entry
  in
  let savedRegisterHsh = Hashtbl.create 16 in
  let rec save_register registerList label = 
    match registerList with
    | registre::remain -> let savedRegister = Register.fresh()  
                          in Hashtbl.add savedRegisterHsh registre  savedRegister;
                          let newLabel = add_to_cfg (Embinop (Mmov, registre, savedRegister, label))
                          in save_register remain newLabel
    | [] -> label 
  in
  let first_calle_saved_lb = save_register Register.callee_saved first_arg_label in
  let alloc_lb = add_to_cfg (Ealloc_frame first_calle_saved_lb) 
  in
  (*Fin de l'entrée de la fonction*)

  (*Debut de la sortie de fonction*)
  let return_lb = add_to_cfg(Ereturn)  in
  let delete_frame_lb = add_to_cfg(Edelete_frame return_lb) 
  in 
  let rec restore_register registerList label = 
    match registerList with
    | registre::remain -> let savedRegister = Hashtbl.find savedRegisterHsh registre in let newLabel = add_to_cfg (Embinop (Mmov, savedRegister, registre, label)) in restore_register remain newLabel
    | [] -> label
  in
  let first_restore_register_lb = restore_register Register.callee_saved delete_frame_lb in
  let result_copy = Embinop(Mmov, fn.Rtltree.fun_result, Register.result, first_restore_register_lb) in
  graph := Label.M.add fn.Rtltree.fun_exit result_copy !graph;
  (*Fin de la sortie de fonction*)
  {
  fun_name = fn.Rtltree.fun_name;
  fun_formals = List.length fn.Rtltree.fun_formals;
  fun_ctx = fn.Rtltree.fun_ctx; (*No real use in the following steps, only in the interprets*)
  fun_entry = alloc_lb;
  fun_body = !graph;
  }

(**
  Recursily handle all functions from the Rtltree

  @param fun_list List of all the functions
*)
let rec ertl_funlist = function
| fn::remain -> ertl_fun fn :: ertl_funlist remain
| [] -> []

(**
  Main function of the class

  Calls ertl_funlist to translate the tree
  Then calls liveness on the graph
*)
let file p = 
  let funlist = ertl_funlist p.Rtltree.funs in 
  let livenessMap = liveness !graph in
  {
    funs = funlist;
    liveness = livenessMap;
  }