
open Ops

type ident = string

type register = Register.t
type label = Label.t

type arcs = {mutable prefs: Register.set; mutable intfs: Register.set }
type igraph = arcs Register.map

type interference_graph_m = {mutable map : arcs Register.map;}
type potential_colors_map_m = {mutable reg_map : Register.set Register.map}

type operand =
  | Reg of Register.t
  | Spilled of int

(** Les différentes instructions LTL *)
type instr =
  (** same as ERTL *)
  | Eload of register * int * register * label
  | Estore of register * register * int * label
  | Egoto of label
  | Ereturn
  (** same as ERTL, but with operand instead of register *)
  | Econst of int64 * operand * label
  | Emunop of munop * operand * label
  | Embinop of mbinop * operand * operand * label
  | Emubranch of mubranch * operand * label * label
  | Embbranch of mbbranch * operand * operand * label * label
  | Epush of operand * label
  (** slightly modified *)
  | Ecall of ident * label
  (** new *)
  | Epop of register * label

type cfg = instr Label.map

type ltldef = {
  fun_name : ident;
  fun_entry: label;
  fun_body : cfg;
}

type ltlfile = {
  funs : ltldef list;
}

(** {2 Fonctions d'impression, pour debugger} *)

open Format
open Pp



 (* ======================
    Utilities *)
let operand fmt = function
  | Reg r     -> fprintf fmt "%a" Register.print r
  | Spilled n -> fprintf fmt "%d(%%rbp)" n

let print_instr fmt = function
  | Econst (n, r, l) ->
      fprintf fmt "mov $%Ld %a;  goto %a" n operand r Label.print l
  | Eload (r1, n, r2, l) ->
      fprintf fmt "mov %d(%a) %a;  goto %a"
        n Register.print r1 Register.print r2 Label.print l
  | Estore (r1, r2, n, l) ->
      fprintf fmt "mov %a %d(%a);  goto %a"
        Register.print r1 n Register.print r2 Label.print l
  | Emunop (op, r1, l) ->
      fprintf fmt "%a %a;  goto %a" print_munop op operand r1 Label.print l
  | Embinop (Mmov, r1, r2, l) ->
      fprintf fmt "mov %a %a;  goto %a" operand r1 operand r2 Label.print l
  | Embinop (op, r1, r2, l) ->
      fprintf fmt "%a %a %a;  goto %a"
	print_mbinop op operand r1 operand r2 Label.print l
  | Emubranch (op, r, l1, l2) ->
      fprintf fmt "%a %a;  goto %a, %a"
	print_mubranch op operand r Label.print l1 Label.print l2
  | Embbranch (op, r1, r2, l1, l2) ->
      fprintf fmt "%a %a %a;  goto %a, %a"
	print_mbbranch op operand r1 operand r2
        Label.print l1 Label.print l2
  | Epush (r, l) ->
      fprintf fmt "push %a;  goto %a" operand r Label.print l
  | Epop (r, l) ->
      fprintf fmt "pop %a;  goto %a" Register.print r Label.print l
  | Egoto l ->
      fprintf fmt "goto %a" Label.print l
  | Ecall (x, l) ->
      fprintf fmt "call %s;  goto %a" x Label.print l
  | Ereturn ->
      fprintf fmt "return"

let succ = function
  | Econst (_,_,l)
  | Eload (_,_,_,l)
  | Estore (_,_,_,l)
  | Emunop (_,_,l)
  | Embinop (_,_,_,l)
  | Epush (_,l)
  | Epop (_,l)
  | Ecall (_,l)
  | Egoto l ->
      [l]
  | Emubranch (_,_,l1,l2)
  | Embbranch (_,_,_,l1,l2) ->
      [l1; l2]
  | Ereturn ->
      []

let visit f g entry =
  let visited = Hashtbl.create 97 in
  let rec visit l =
    if not (Hashtbl.mem visited l) then begin
      Hashtbl.add visited l ();
      let i = Label.M.find l g in
      f l i;
      List.iter visit (succ i)
    end
  in
  visit entry

let print_graph fmt =
  visit (fun l i -> fprintf fmt "%a: %a@\n" Label.print l print_instr i)

let print_deffun fmt f =
  fprintf fmt "%s()@\n" f.fun_name;
  fprintf fmt "  @[";
  fprintf fmt "entry : %a@\n" Label.print f.fun_entry;
  print_graph fmt f.fun_body f.fun_entry;
  fprintf fmt "@]@."

let print_ltlfile fmt p =
  List.iter (print_deffun fmt) p.funs
