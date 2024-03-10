
(** {2 Abstract Syntax of Mini-Python} *)

(** {3 Parsed trees}

   This is the output of the parser and the input of the type checker. *)

type location = Lexing.position * Lexing.position

type ident = { loc: location; id: string; }

type unop =
  | Uneg (** -e *)
  | Unot (** not e *)

type binop =
  | Badd | Bsub | Bmul | Bdiv | Bmod    (** + - * // % *)
  | Beq | Bneq | Blt | Ble | Bgt | Bge  (** == != < <= > >= *)
  | Band | Bor                          (** and or *)

type constant =
  | Cnone
  | Cbool of bool
  | Cstring of string
  | Cint of int64

type expr =
  | Ecst of constant
  | Eident of ident
  | Ebinop of binop * expr * expr
  | Eunop of unop * expr
  | Ecall of ident * expr list
  | Elist of expr list (** {[ [e1,e2,...] ]} *)
  | Eget of expr * expr (** {[ e1[e2] ]} *)

and stmt =
  | Sif of expr * stmt * stmt
  | Sreturn of expr
  | Sassign of ident * expr
  | Sprint of expr
  | Sblock of stmt list
  | Sfor of ident * expr * stmt
  | Seval of expr
  | Sset of expr * expr * expr (** {[ e1[e2] = e3 ]} *)

and def = ident * ident list * stmt

and file = def list * stmt

(** {3 Typed trees}

   This is the output of the type checker and the input of the code
   generation. *)

(** In the typed trees, all the occurrences of the same variable
   point to a single record of the following type. *)
type var = {
  v_name: string;
  mutable v_ofs: int; (** position wrt %rbp *)
}

(** Similarly, all the occurrences of a given function all point
   to a single record of the following type. *)
type fn = {
  fn_name: string;
  fn_params: var list;
}

type texpr =
  | TEcst of constant
  | TEvar of var
  | TEbinop of binop * texpr * texpr
  | TEunop of unop * texpr
  | TEcall of fn * texpr list
  | TElist of texpr list
  | TErange of texpr (** list(range(e1)) *)
  | TEget of texpr * texpr (** {[ e1[e2] ]} *)

type tstmt =
  | TSif of texpr * tstmt * tstmt
  | TSreturn of texpr
  | TSassign of var * texpr
  | TSprint of texpr
  | TSblock of tstmt list
  | TSfor of var * texpr * tstmt
  | TSeval of texpr
  | TSset of texpr * texpr * texpr (** {[ e1[e2] = e3 ]} *)

and tdef = fn * tstmt

and tfile = tdef list
  (** the block of global statements is now a `main` function *)


(* (temporary) Debug files *)
let rec string_of_constant = function
  | Cnone -> "None"
  | Cbool b -> string_of_bool b
  | Cstring s -> "\"" ^ s ^ "\""
  | Cint i -> Int64.to_string i

let rec string_of_binop = function
  | Badd -> "+"
  | Bsub -> "-"
  | Bmul -> "*"
  | Bdiv -> "/"
  | Bmod -> "%"
  | Beq -> "=="
  | Bneq -> "!="
  | Blt -> "<"
  | Ble -> "<="
  | Bgt -> ">"
  | Bge -> ">="
  | Band -> "and"
  | Bor -> "or"

let rec string_of_unop = function
  | Uneg -> "-"
  | Unot -> "not"

let rec string_of_ident id = id.id

let rec string_of_expr = function
  | TEcst c -> string_of_constant c
  | TEvar v -> v.v_name
  | TEbinop (op, e1, e2) ->
      "(" ^ (string_of_expr e1 ^ " " ^ string_of_binop op ^ " " ^ string_of_expr e2) ^ ")"
  | TEunop (op, e) -> string_of_unop op ^ " " ^ string_of_expr e
  | TEcall (fn, args) ->
      fn.fn_name ^ "(" ^ String.concat ", " (List.map string_of_expr args) ^ ")"
  | TElist lst -> "[" ^ String.concat ", " (List.map string_of_expr lst) ^ "]"
  | TErange e -> "range(" ^ string_of_expr e ^ ")"
  | TEget (e1, e2) -> string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ "]"

let rec string_of_stmt = function
  | TSif (cond, s1, s2) ->
      "[if " ^ string_of_expr cond ^ ":\n" ^ string_of_stmt s1 ^ "\nelse:\n" ^ string_of_stmt s2 ^ "]"
  | TSreturn e -> "return " ^ string_of_expr e
  | TSassign (var, e) -> var.v_name ^ " = " ^ string_of_expr e
  | TSprint e -> "print(" ^ string_of_expr e ^ ")"
  | TSblock stmts -> "{" ^ String.concat "\n" (List.map string_of_stmt stmts) ^ "}"
  | TSfor (var, e, body) ->
      "for " ^ var.v_name ^ " in " ^ string_of_expr e ^ ":\n" ^ string_of_stmt body
  | TSeval e -> "eval " ^ string_of_expr e
  | TSset (e1, e2, e3) -> string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ "] = " ^ string_of_expr e3

let rec string_of_tdef (fn, body) =
  fn.fn_name ^ "(" ^ String.concat ", " (List.map (fun v -> v.v_name) fn.fn_params) ^ "):\n"
  ^ string_of_stmt body

let string_of_tfile tfile = String.concat "\n\n" (List.map string_of_tdef tfile)
