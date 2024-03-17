open Ops

type ident = string
type register = Register.t
type label = Label.t

type ertlinstr =
  | Econst of Ast.constant * register * label
  | Eload of register * int * register * label
  | Estore of register * register * int * label
  | Emunop of munop * register * label
  | Embinop of mbinop * register * register * label
  | Emubranch of mubranch * register * label * label
  | Embbranch of mbbranch * register * register * label * label
  | Ecall of ident * int * label
  | Egoto of label
  | Ealloc_frame of label
  | Edelete_frame of label
  | Eget_param of int * register * label  (** [r <- ofs(rbp)] *)
  | Epush_param of register * label
  | Ereturn

type cfg = ertlinstr Label.map
type ertldef = { fun_name : ident; fun_formals : int; fun_ctx : Register.set; fun_entry : label; fun_body : cfg }

type live_info = {
  instr : ertlinstr;
  succ : Label.t list;
  mutable pred : Label.set;
  defs : Register.set;
  uses : Register.set;
  mutable ins : Register.set;
  mutable outs : Register.set;
}

type ertlfile = { funs : ertldef list; liveness : live_info Label.map }

let rec prefix i = function _ when i = 0 -> [] | [] -> assert false | x :: r -> x :: prefix (i - 1) r

let def_use = function
  | Econst (_, r, _) | Eget_param (_, r, _) -> ([ r ], [])
  | Emubranch (_, r, _, _) | Epush_param (r, _) -> ([], [ r ])
  | Emunop (_, rd, _) -> ([ rd ], [ rd ])
  | Embinop (Ops.Mmov, rs, rd, _) | Eload (rs, _, rd, _) -> ([ rd ], [ rs ])
  | Embinop (Ops.Mdiv, rs, rd, _) ->
      assert (rd = Register.rax);
      ([ Register.rax; Register.rdx ], [ Register.rax; Register.rdx; rs ])
  | Embinop (_, rs, rd, _) -> ([ rd ], [ rs; rd ])
  | Estore (r1, r2, _, _) | Embbranch (_, r1, r2, _, _) -> ([], [ r1; r2 ])
  | Ecall (_, n, _) -> (Register.caller_saved, prefix n Register.parameters)
  | Egoto _ | Ealloc_frame _ | Edelete_frame _ -> ([], [])
  | Ereturn -> ([], Register.rax :: Register.callee_saved)
