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
  (* New ERTL instructions *)
  | Ealloc_frame of label
  | Edelete_frame of label
  | Eget_param of int * register * label (** [r <- ofs(rbp)] *)
  | Epush_param of register * label
  | Ereturn

type cfg = ertlinstr Label.map

type ertldef = {
  fun_name : ident;
  fun_formals : int;
  fun_ctx : Register.set;
  fun_entry : label;
  fun_body : cfg;
}

type live_info = {
         instr: ertlinstr;
          succ: Label.t list;    (* successeurs *)
  mutable pred: Label.set;       (* prédécesseurs *)
          defs: Register.set;    (* définitions *)
          uses: Register.set;    (* utilisations *)
  mutable  ins: Register.set;    (* variables vivantes en entrée *)
  mutable outs: Register.set;    (* variables vivantes en sortie *)
}

type ertlfile = {
  funs : ertldef list;
  liveness : live_info Label.map;
}

(** {2 Calcul des définitions et utilisations de chaque instruction} *)

let rec prefix i = function
  | _ when i = 0 -> []
  | [] -> assert false
  | x :: r -> x :: prefix (i-1) r

let def_use = function
  | Econst (_,r,_)
  | Eget_param (_,r,_) ->
      [r], []
  | Emubranch (_,r,_,_)
  | Epush_param (r,_) ->
      [], [r]
  | Emunop (_,rd,_) ->
      [rd], [rd]
  | Embinop (Ops.Mmov,rs,rd,_)
  | Eload (rs,_,rd,_) ->
      [rd], [rs]
  | Embinop (Ops.Mdiv,rs,rd,_) ->
      assert (rd = Register.rax);
      [Register.rax; Register.rdx], [Register.rax; Register.rdx; rs]
  | Embinop (_,rs,rd,_) ->
      [rd], [rs; rd]
  | Estore (r1,r2,_,_)
  | Embbranch (_,r1,r2,_,_) ->
      [], [r1; r2]
  | Ecall (_,n,_) ->
      Register.caller_saved, prefix n Register.parameters
  | Egoto _
  | Ealloc_frame _
  | Edelete_frame _ ->
      [], []
  | Ereturn ->
      [], Register.rax :: Register.callee_saved

(** {2 Fonctions d'impression, pour debugger} *)

open Format
open Pp

let print_instr fmt = function
  | Econst (Cint n, r, l) ->
      fprintf fmt "mov $%Ld %a;  goto %a" n Register.print r Label.print l
  | Eload (r1, n, r2, l) ->
      fprintf fmt "mov %d(%a) %a;  goto %a"
        n Register.print r1 Register.print r2 Label.print l
  | Estore (r1, r2, n, l) ->
      fprintf fmt "mov %a %d(%a);  goto %a"
        Register.print r1 n Register.print r2 Label.print l
  | Emunop (op, r1, l) ->
      fprintf fmt "%a %a;  goto %a"
        print_munop op Register.print r1 Label.print l
  | Embinop (Mmov, r1, r2, l) ->
      fprintf fmt "mov %a %a;  goto %a"
        Register.print r1 Register.print r2 Label.print l
  | Embinop (op, r1, r2, l) ->
      fprintf fmt "%a %a %a;  goto %a"
	print_mbinop op Register.print r1 Register.print r2 Label.print l
  | Emubranch (op, r, l1, l2) ->
      fprintf fmt "%a %a;  goto %a, %a"
	print_mubranch op Register.print r Label.print l1 Label.print l2
  | Embbranch (op, r1, r2, l1, l2) ->
      fprintf fmt "%a %a %a;  goto %a, %a"
	print_mbbranch op Register.print r1 Register.print r2
        Label.print l1 Label.print l2
  | Ecall (x, n, l) ->
      fprintf fmt "call %s(%d);  goto %a" x n Label.print l
  | Egoto l ->
      fprintf fmt "goto %a" Label.print l
  | Ealloc_frame l ->
      fprintf fmt "alloc_frame;  goto %a" Label.print l
  | Edelete_frame l ->
      fprintf fmt "delete_frame;  goto %a" Label.print l
  | Eget_param (n, r, l) ->
      fprintf fmt "mov stackp(%d) %a --> %a" n Register.print r Label.print l
  | Epush_param (r, l) ->
      fprintf fmt "push %a;  goto %a" Register.print r Label.print l
  | Ereturn ->
      fprintf fmt "return"

let succ = function
  | Econst (_,_,l)
  | Eload (_,_,_,l)
  | Estore (_,_,_,l)
  | Emunop (_,_,l)
  | Embinop (_,_,_,l)
  | Ecall (_,_,l)
  | Egoto l
  | Ealloc_frame l
  | Edelete_frame l
  | Eget_param (_,_,l)
  | Epush_param (_,l) ->
      [l]
  | Emubranch (_,_,l1,l2)
  | Embbranch (_,_,_,l1,l2) ->
      [l1; l2]
  | Ereturn ->
      []

let visit f g entry liveness =
  let visited = Hashtbl.create 97 in
  let rec visit l =
    if not (Hashtbl.mem visited l) then begin
      Hashtbl.add visited l ();
      let i = Label.M.find l g in
      let liveinfo = Label.M.find l liveness in
      f l i liveinfo;
      List.iter visit (succ i)
    end
  in
  visit entry

  let print_set = Register.print_set

  let print_live_info fmt li =
    fprintf fmt "d={%a}@ u={%a}@ i={%a}@ o={%a}"
      print_set li.defs print_set li.uses print_set li.ins print_set li.outs

let print_graph fmt =
  visit (fun l i liveinfo -> fprintf fmt "%a: %a @\n" Label.print l print_instr i)
  (* visit (fun li -> print_live_info fmt li) *)

let print_ertldef fmt liveness f =
  fprintf fmt "%s(%d)@\n" f.fun_name f.fun_formals;
  fprintf fmt "  @[";
  fprintf fmt "entry : %a@\n" Label.print f.fun_entry;
  fprintf fmt "locals: @[%a@]@\n" Register.print_set f.fun_ctx;
  print_graph fmt f.fun_body f.fun_entry liveness;
  fprintf fmt "@]@."

let print_ertlfile fmt p =
  List.iter (print_ertldef fmt p.liveness) p.funs 
