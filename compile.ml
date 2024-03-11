
open Format
open X86_64
open Ast

let debug = ref false

(* Register all constants in .data section *)
let rec findconst = function
  | TEcst (Cstring s) -> [s]
  | TEbinop (op, e1, e2) -> findconst e1 @ findconst e2
  | TEunop (op, e) -> findconst e
  | TEcall (fn, args) -> List.concat (List.map findconst args)
  | TElist elist -> List.concat (List.map findconst elist)
  | TEget (e1, e2) -> findconst e1 @ findconst e2
  | x -> []

and findconst_in_stmt = function
  | TSif (e, s1, s2) -> findconst e @ findconst_in_stmt s1 @ findconst_in_stmt s2
  | TSreturn e -> findconst e
  | TSassign (id, e) -> findconst e
  | TSprint e -> findconst e
  | TSblock stmts ->  List.concat (List.map findconst_in_stmt stmts)
  | TSfor (id, e, s) -> findconst e @ findconst_in_stmt s
  | TSeval e -> findconst e
  | TSset (e1, e2, e3) -> findconst e1 @ findconst e2 @ findconst e3

let find_all_consts p =
  let find_const_in_tdef (tdef : Ast.tdef) =
      let (fn, stmt) = tdef in
      findconst_in_stmt stmt
    in
    List.concat (List.map find_const_in_tdef p)

(* glibc printf *)
let printf_str ctable str =
  let idx = Hashtbl.find ctable str in
  let lbl = (Printf.sprintf "OFFSET FLAT:%s" idx) in
     (pushq (reg rbp))
  ++ (movq (reg rbp) (reg rsp)) 
  ++ (movl (reg edi) (lab lbl)) 
  ++ (movl (reg eax) (imm 0));
  ++ (call "printf")
  ++ (movl (reg eax) (imm 0))
  ++ (popq rbp)
  ++ ret;

and printf_int ctable i =
  let idx = Hashtbl.find ctable "%d" in
  let lbl = (Printf.sprintf "OFFSET FLAT:%s" idx) in
     (pushq (reg rbp))
  ++ (movq (reg rbp) (reg rsp)) 
  ++ (movl (reg esi) (imm i))
  ++ (movl (reg edi) (lab lbl)) 
  ++ (movl (reg eax) (imm 0));
  ++ (call "printf")
  ++ (movl (reg eax) (imm 0))
  ++ (popq rbp)
  ++ ret;

(* Code generation *)
let rec gen_stmt ctable = function
  | TSif (e, s1, s2) -> nop
  | TSreturn e -> ret
  | TSassign (id, e) -> nop
  | TSprint (TEcst(Cstring s)) -> nop
  | TSprint (TEcst(Cint i)) -> nop
  | TSprint (_) -> nop
  | TSblock stmts -> nop
  | TSfor (id, e, s) -> nop
  | TSeval e -> nop
  | TSset (e1, e2, e3) -> nop

let rec gen_def ctable p =
  match p with
  | [] -> nop
  | stmt::tail -> gen_stmt ctable stmt ++ gen_def ctable tail

and file ?debug:(b=false) (p: Ast.tfile) : X86_64.program =
  debug := b;
  let const_table = Hashtbl.create 10 in
  Hashtbl.add const_table "%d" "LCd";
  let consts = find_all_consts p in
  
  let rec process_consts consts =
    let rec populate_const_table idx = function
      | [] -> ()
      | const :: rest ->
          let lbl = (Printf.sprintf "LC%d" idx) in
          Hashtbl.add const_table const lbl;
          populate_const_table (idx + 1) rest
    in
    let rec generate_data_section idx = function
      | [] -> nop
      | const :: rest -> 
        let lbl = (Printf.sprintf "LC%d" idx) in
        (label lbl ++ string const) ++ (generate_data_section (idx + 1) rest)
    in
    populate_const_table 0 consts;
    generate_data_section 0 consts
  in

  let consts = find_all_consts p in
  let data_section = process_consts consts in

  { text = globl "main" ++ label "main" ++ ret;
    data = data_section }
