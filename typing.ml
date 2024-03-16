open Ast

let debug = ref false
let dummy_loc = (Lexing.dummy_pos, Lexing.dummy_pos)

exception Error of Ast.location * string

let error ?(loc = dummy_loc) f = Format.kasprintf (fun s -> raise (Error (loc, s))) ("@[" ^^ f ^^ "@]")
let function_table = Hashtbl.create 10

let binop_to_string (op : binop) : string =
  List.assoc op
    [
      (Badd, "+");
      (Bsub, "-");
      (Bmul, "*");
      (Bdiv, "/");
      (Bmod, "%");
      (Beq, "==");
      (Bneq, "!=");
      (Blt, "<");
      (Ble, "<=");
      (Bgt, ">=");
      (Bge, ">");
      (Band, "and");
      (Bor, "or");
    ]

let ctype_to_string (e : constant) : string =
  match e with Cnone -> "NoneType" | Cbool _ -> "bool" | Cstring _ -> "str" | Cint _ -> "int"

let rec type_expr ctx = function
  | Ecst c -> TEcst c
  | Eident id ->
      if Hashtbl.mem ctx id.id then TEvar { v_name = id.id; v_ofs = 0 }
      else error ~loc:id.loc "(typing) variable '%s' not defined" id.id
  | Ebinop (op, e1, e2) -> (
      let te1 = type_expr ctx e1 in
      let te2 = type_expr ctx e2 in
      match (te1, te2) with
      | TEcst cst1, TEcst cst2 -> (
          match (cst1, cst2, op) with
          | Cint i, Cint j, (Bsub | Bmul | Bdiv | Bmod | Badd | Blt | Ble | Bgt | Bge) -> TEbinop (op, te1, te2)
          | Cstring s, Cstring t, (Badd | Blt | Ble | Bgt | Bge) -> TEbinop (op, te1, te2)
          | Cbool b, Cbool b2, (Band | Bor | Blt | Ble | Bgt | Bge) -> TEbinop (op, te1, te2)
          | _, _, (Beq | Bneq) -> TEbinop (op, te1, te2)
          | _, _, _ ->
              error "(typing) '%s' not supported between instances of '%s' and '%s'" (binop_to_string op)
                (ctype_to_string cst1) (ctype_to_string cst2))
      | TElist l1, TElist l2 -> (
          match op with
          | Badd | Blt | Ble | Bgt | Bge | Beq | Bneq -> TEbinop (op, te1, te2)
          | _ -> error "(typing) '%s' not supported between instances of 'list' and 'list'" (binop_to_string op))
      | TEcst c, TElist l ->
          error "(typing) '%s' not supported between instances of 'list' and '%s'" (binop_to_string op)
            (ctype_to_string c)
      | TElist l, TEcst c ->
          error "(typing) '%s' not supported between instances of '%s' and 'list'" (binop_to_string op)
            (ctype_to_string c)
      | _, _ -> TEbinop (op, te1, te2))
  | Eunop (op, e) -> (
      let te = type_expr ctx e in
      match (op, te) with
      | Uneg, TEcst (Cint i) -> TEunop (op, te)
      | Uneg, TEcst c -> error "(typing) bad operand type for unary -: '%s'" (ctype_to_string c)
      | Uneg, TElist l -> error "(typing) bad operand type for unary -: 'list'"
      | Uneg, _ -> TEunop (op, te)
      | Unot, _ -> TEunop (op, te))
  | Ecall (fn, args) -> (
      match fn.id with
      | "list" -> (
          match args with
          | [ Ecall (fn2, args2) ] when fn2.id = "range" -> (
              match args2 with
              | [ Ecst e ] -> (
                  match e with
                  | Cint n ->
                    let rec gen_list i =
                      match i with
                      | -1L -> []
                      | _ -> gen_list (Int64.sub i 1L) @ [TEcst(Cint i)] in
                    TElist(gen_list (Int64.sub n 1L))
                  | _ -> error ~loc:fn2.loc "(typing) range takes 'int' argument")
              | [ e ] when List.length args2 = 1 -> TErange (type_expr ctx e)
              | _ -> error ~loc:fn2.loc "(typing) range expected exactly 1 argument(s), got %i" (List.length args2))
          | _ -> error ~loc:fn.loc "(typing) list must be called on range()")
      | "range" -> error ~loc:fn.loc "(typing) range cannot be used outside of list()"
      | "len" -> (
          let new_fn = { fn_name = "len"; fn_params = [ { v_name = "x"; v_ofs = 0 } ] } in
          match args with
          | [ c ] -> TEcall (new_fn, [ type_expr ctx c ])
          | _ -> error ~loc:fn.loc "(typing) len expected exactly 1 argument(s), got %i" (List.length args))
      | _ ->
          if Hashtbl.mem function_table fn.id then (
            let callable = Hashtbl.find function_table fn.id in
            List.iter
              (fun param -> Hashtbl.add ctx param.v_name { v_name = param.v_name; v_ofs = 0 })
              callable.fn_params;
            if List.length callable.fn_params = List.length args then TEcall (callable, List.map (type_expr ctx) args)
            else
              error ~loc:fn.loc "(typing) function '%s' expected exactly %i argument(s), got %i" fn.id
                (List.length callable.fn_params) (List.length args))
          else error ~loc:fn.loc "(typing) name '%s' is not defined" fn.id)
  | Elist elist -> TElist (List.map (type_expr ctx) elist)
  | Eget (e1, e2) -> TEget (type_expr ctx e1, type_expr ctx e2)

and type_stmt ctx = function
  | Sif (e, s1, s2) -> TSif (type_expr ctx e, type_stmt ctx s1, type_stmt ctx s2)
  | Sreturn e -> TSreturn (type_expr ctx e)
  | Sassign (id, e) ->
      let new_var = { v_name = id.id; v_ofs = 0 } in
      Hashtbl.add ctx id.id new_var;
      TSassign (new_var, type_expr ctx e)
  | Sprint e -> TSprint (type_expr ctx e)
  | Sblock stmts -> TSblock (List.map (type_stmt ctx) stmts)
  | Sfor (id, e, s) ->
      let new_var = { v_name = id.id; v_ofs = 0 } in
      Hashtbl.add ctx id.id new_var;
      TSfor (new_var, type_expr ctx e, type_stmt ctx s)
  | Seval e -> TSeval (type_expr ctx e)
  | Sset (e1, e2, e3) -> TSset (type_expr ctx e1, type_expr ctx e2, type_expr ctx e3)

let type_def global def =
  let name, params, stmt = def in
  if List.mem name.id [ "len"; "range"; "list"; "print" ] || Hashtbl.mem function_table name.id then
    error ~loc:name.loc "(typing) function '%s' already defined" name.id
  else
    let local = Hashtbl.create (Hashtbl.length global) in
    Hashtbl.iter (fun key value -> Hashtbl.add local key value) global;
    List.iter (fun param -> Hashtbl.add local param.id { v_name = param.id; v_ofs = 0 }) params;
    let duplicates = List.find_opt (fun id -> List.length (List.filter (fun p -> p.id = id.id) params) > 1) params in
    match duplicates with
    | Some dup -> error ~loc:dup.loc "(typing) duplicate argument '%s' in function definition" dup.id
    | None ->
        let tparams = List.map (fun param -> { v_name = param.id; v_ofs = 0 }) params in
        let fn = { fn_name = "def_" ^ name.id; fn_params = tparams } in
        Hashtbl.add function_table name.id fn;
        (fn, type_stmt local stmt)

let rec type_defs global defs =
  match defs with
  | [] -> []
  | def :: rest ->
      let tdef = type_def global def in
      tdef :: type_defs global rest

let file ?debug:(b = false) (p : Ast.file) : tfile =
  debug := b;
  let def_list, main_stmt = p in
  let tmain_def = { fn_name = "main"; fn_params = [] } in
  let global = Hashtbl.create 16 in
  (tmain_def, TSblock([type_stmt global main_stmt; TSreturn(TEcst(Cint 0L))])) :: type_defs global def_list
