
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

type instr =
  (** same as ERTL *)
  | Eload of register * int * register * label
  | Estore of register * register * int * label
  | Egoto of label
  | Ereturn
  (** same as ERTL, but with operand instead of register *)
  | Econst of Ast.constant * operand * label
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
