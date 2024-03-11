open Format
open Ops
open Pp

type register = Register.t
type label = Label.t

type rtlinstr =
  | Econst of Ast.constant * register * label
  | Eload of register * int * register * label
  | Estore of register * register * int * label
  | Emunop of munop * register * label
  | Embinop of mbinop * register * register * label
  | Emubranch of mubranch * register * label * label
  | Embbranch of mbbranch * register * register * label * label
  | Ecall of register * string * register list * label
  | Egoto of label

type cfg = rtlinstr Label.map

type rtldef = {
  fun_name : string;
  fun_formals : register list;
  fun_result : register;
  fun_ctx : Register.set;
  fun_entry : label;
  fun_exit : label;
  fun_body : cfg;
}

type rtlfile = { funs : rtldef list }

let print_rtlinstr fmt = function
  | Econst (Cint n, r, l) -> fprintf fmt "mov $%Ld %a;  goto %a" n Register.print r Label.print l
  | Econst (Cstring s, r, l) -> fprintf fmt "mov some_string %a;  goto %a" Register.print r Label.print l
  | Econst (Cnone, r, l) -> fprintf fmt "mov none %a;  goto %a" Register.print r Label.print l
  | Econst (Cbool b, r, l) -> fprintf fmt "mov %b %a;  goto %a" b Register.print r Label.print l
  | Eload (r1, n, r2, l) -> fprintf fmt "mov %d(%a) %a;  goto %a" n Register.print r1 Register.print r2 Label.print l
  | Estore (r1, r2, n, l) -> fprintf fmt "mov %a %d(%a);  goto %a" Register.print r1 n Register.print r2 Label.print l
  | Emunop (op, r1, l) -> fprintf fmt "%a %a;  goto %a" print_munop op Register.print r1 Label.print l
  | Embinop (Mmov, r1, r2, l) -> fprintf fmt "mov %a %a;  goto %a" Register.print r1 Register.print r2 Label.print l
  | Embinop (op, r1, r2, l) ->
      fprintf fmt "%a %a %a;  goto %a" print_mbinop op Register.print r1 Register.print r2 Label.print l
  | Emubranch (op, r, l1, l2) ->
      fprintf fmt "%a %a;  goto %a, %a" print_mubranch op Register.print r Label.print l1 Label.print l2
  | Embbranch (op, r1, r2, l1, l2) ->
      fprintf fmt "%a %a %a;  goto %a, %a" print_mbbranch op Register.print r1 Register.print r2 Label.print l1
        Label.print l2
  | Ecall (r, x, rl, l) ->
      fprintf fmt "%a <- call %s(@[%a@]);  goto %a" Register.print r x (print_list comma Register.print) rl Label.print
        l

let print_cfg fmt (g : cfg) (entry : label) (exit : label) =
  let visited = Hashtbl.create 97 in
  let rec visit l =
    if (not (Hashtbl.mem visited l)) && l <> exit then (
      Hashtbl.add visited l ();
      let i = Label.M.find l g in
      fprintf fmt "%a: %a@\n" Label.print l print_rtlinstr i;
      match i with
      | Econst (_, _, l)
      | Eload (_, _, _, l)
      | Estore (_, _, _, l)
      | Emunop (_, _, l)
      | Embinop (_, _, _, l)
      | Ecall (_, _, _, l) ->
          visit l
      | Emubranch (_, _, l1, l2) | Embbranch (_, _, _, l1, l2) ->
          visit l1;
          visit l2)
  in
  visit entry

let print_rtldef fmt f =
  fprintf fmt "%a %s(@[%a@])@\n" Register.print f.fun_result f.fun_name (print_list comma Register.print) f.fun_formals;
  fprintf fmt "  @[";
  fprintf fmt "entry : %a@\n" Label.print f.fun_entry;
  fprintf fmt "exit  : %a@\n" Label.print f.fun_exit;
  fprintf fmt "locals: @[%a@]@\n" Register.print_set f.fun_ctx;
  print_cfg fmt f.fun_body f.fun_entry f.fun_exit;
  fprintf fmt "@]@."

let print_rtlfile fmt p = List.iter (print_rtldef fmt) p.funs
