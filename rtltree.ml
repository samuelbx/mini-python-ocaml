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
  | Emquadop of mquadop * int * register * register * int * label
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
