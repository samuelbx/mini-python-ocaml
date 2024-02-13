
open Format
open X86_64
open Ast

let debug = ref false

(* Register all constants in .data section *)
let rec findconst = function
  | TEcst (Cstring s) -> [s]
  | TEcst (Cint i) -> ["%d"]
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

(* Function call *)
let rec push_args args =
  match args with
  | [] -> nop
  | arg :: rest ->
    (pushq (imm arg)) ++ push_args rest

let translate_expr = function
  | TEcst (Cint e) -> imm64 e
  | _ -> imm 0 (* PLACEHOLDER *)

let rec retrieve_function_arg = function
  | 0 -> movl (reg edi) (ind rbp ~ofs:(-4))
  | 1 -> movl (reg esi) (ind rbp ~ofs:(-8))
  | 2 -> movl (reg edx) (ind rbp ~ofs:(-12))
  | 3 -> movl (reg ecx) (ind rbp ~ofs:(-16))
  | 4 -> movl (reg r8d) (ind rbp ~ofs:(-20))
  | 5 -> movl (reg r9d) (ind rbp ~ofs:(-24))
  | _ -> nop

let rec retrieve_function_args idx = function
  | [] -> nop
  | arg::tail -> retrieve_function_arg idx ++ retrieve_function_args (idx+1) tail

let translate_function_call name args =
  let push_arg arg idx =
    match idx with
    | 0 -> movl (translate_expr arg) (reg edi)
    | 1 -> movl (translate_expr arg) (reg esi)
    | 2 -> movl (translate_expr arg) (reg edx)
    | 3 -> movl (translate_expr arg) (reg ecx)
    | 4 -> movl (translate_expr arg) (reg r8d)
    | 5 -> movl (translate_expr arg) (reg r9d)
    | i when i >= 6 -> pushq (translate_expr arg)
    | _ -> nop
  in
  
  let rec push_args args idx =
    match args with
    | [] -> nop
    | arg :: rest -> push_args rest (idx+1) ++ push_arg arg idx 
  in
  let code = (push_args args 0) ++ (call name) in
  let nargs = List.length args in
  if nargs >= 7 then
    code ++ (addq (imm ((nargs-6)*8)) (reg rsp))
  else
    code

(* glibc printf *)
let printf_str ctable str =
  let idx = Hashtbl.find ctable str in
  let lbl = (Printf.sprintf "$%s" idx) in
     (movl (lab lbl) (reg edi)) 
  ++ (movl (imm 0) (reg eax))
  ++ (call "printf")

let printf_int ctable i =
  let idx = Hashtbl.find ctable "%d" in
  let lbl = (Printf.sprintf "$%s" idx) in
     (movl (imm64 i) (reg esi))
  ++ (movl (lab lbl) (reg edi)) 
  ++ (movl (imm 0) (reg eax))
  ++ (call "printf")

(* Code generation *)
let rec gen_stmt ctable = function
  | TSif (e, s1, s2) -> nop
  | TSreturn e -> ret
  | TSassign (id, e) -> nop
  | TSprint (TEcst(Cstring s)) -> printf_str ctable s
  | TSprint (TEcst(Cint i)) -> printf_int ctable i
  | TSprint (_) -> nop
  | TSblock stmt -> List.fold_left (fun acc s -> acc ++ gen_stmt ctable s) nop stmt
  | TSfor (id, e, s) -> nop
  | TSeval (TEcall (fn, args)) -> translate_function_call fn.fn_name args
  | TSeval e -> nop
  | TSset (e1, e2, e3) -> nop

let gen_def ctable (tdef : Ast.tdef) =
  let (fn, stmts) = tdef in
  let retrieved_args = retrieve_function_args 0 fn.fn_params in
  globl fn.fn_name ++ label fn.fn_name 
  ++ (pushq (reg rbp))
  ++ (movq (reg rsp) (reg rbp))
  ++ retrieved_args
  ++ gen_stmt ctable stmts
  ++ (movl (imm 0) (reg eax))
  ++ (popq rbp)
  ++ ret

let rec gen_defs ctable = function
  | [] -> nop
  | def::tail -> gen_def ctable def ++ gen_defs ctable tail

let cons_uniq xs x = if List.mem x xs then xs else x :: xs

let remove_dupes xs = List.fold_left cons_uniq [] xs

let file ?debug:(b=false) (p: Ast.tfile) : X86_64.program =
  debug := b;
  let const_table = Hashtbl.create 10 in
  let consts = remove_dupes(find_all_consts p) in
  
  let rec process_consts consts =
    let rec populate_const_table idx = function
      | [] -> ()
      | const :: rest ->
          let lbl = (Printf.sprintf ".LC%d" idx) in
          Hashtbl.add const_table const lbl;
          populate_const_table (idx + 1) rest
    in
    let rec generate_data_section idx = function
      | [] -> nop
      | const :: rest -> 
        let lbl = (Printf.sprintf ".LC%d" idx) in
        (label lbl ++ string const) ++ (generate_data_section (idx + 1) rest)
    in
    populate_const_table 0 consts;
    generate_data_section 0 consts
  in

  let data_section = process_consts consts in
  let main_section = gen_defs const_table p in

  { text = main_section;
    data = data_section }