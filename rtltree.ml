(** {2 Register Transfer Language} *)

open Ops

type register = Register.t
type label = Label.t

type rtlinstr =
  | Econst of Ast.constant * register * label
  | Eload of register * int * register * label
  | Estore of register * register * int * label
  | Emunop of munop * register * label
  | Embinop of mbinop * register * register * label
    (** attention au sens : [op r1 r2] représente [r2 <- r2 op r1] *)
  | Emubranch of mubranch * register * label * label
  | Embbranch of mbbranch * register * register * label * label
    (** attention au sens : [br r1 r2] représente [r2 br r1] *)
  | Ecall of register * string * register list * label
  | Egoto of label

type cfg = rtlinstr Label.map (* control flow graph *)

type rtldef = {
  fun_name   : string;
  fun_formals: register list;
  fun_result : register;
  fun_locals : Register.set; (* function local vars *)
  fun_entry  : label;
  fun_exit   : label;
  fun_body   : cfg;
}

(** Un programme RTL. *)
type rtlfile = {
  funs : rtldef list;
}
