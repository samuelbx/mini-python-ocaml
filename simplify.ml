
open Ast
open Format

let debug = ref false

let is_false v =
  match v with
  | Cnone -> false
  | Cbool v -> not v
  | Cint v -> Int64.equal v Int64.zero
  | Cstring v -> v = ""

let is_true v = not (is_false v)

let rec simplify_texpr = function
  | TEcst c -> TEcst c
  | TEvar v -> TEvar v
  | TEbinop (op, e1, e2) ->
    let se1 = simplify_texpr e1 in
    let se2 = simplify_texpr e2 in
    (match op, se1, se2 with

    | Badd, TEcst(Cstring s1), TEcst(Cstring s2) -> TEcst(Cstring (s1 ^ s2))
    | Badd, TElist l1, TElist l2 -> TElist(l1 @ l2)

    | Badd, TEcst(Cint n1), TEcst(Cint n2) -> TEcst(Cint (Int64.add n1 n2))
    | Bsub, TEcst(Cint n1), TEcst(Cint n2) -> TEcst(Cint (Int64.sub n1 n2))
    | Bmul, TEcst(Cint n1), TEcst(Cint n2) when Int64.equal n2 Int64.zero -> TEcst(Cint (Int64.div n1 n2))
    | Bdiv, TEcst(Cint n1), TEcst(Cint n2) when Int64.equal n2 Int64.zero -> TEcst(Cint (Int64.rem n1 n2))

    | Beq, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 = b2))
    | Bneq, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 <> b2))
    | Blt, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 < b2))
    | Ble, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 <= b2))
    | Bgt, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 > b2))
    | Bge, TEcst b1, TEcst b2 -> TEcst(Cbool (b1 >= b2))

    | Bor, TEcst b1, _ when is_true b1 -> TEcst(Cbool true)
    | Bor, _, TEcst b2 when is_true b2 -> TEcst(Cbool true)
    | Band, TEcst b1, _ when is_false b1 -> TEcst(Cbool false)
    | Band, _, TEcst b2 when is_false b2 -> TEcst(Cbool false)

    | Bor, TElist b1, _ when List.length b1 <> 0 -> TEcst(Cbool true)
    | Bor, _, TElist b2 when List.length b2 <> 0 -> TEcst(Cbool true)
    | Band, TElist b1, _ when List.length b1 = 0 -> TEcst(Cbool false)
    | Band, _, TElist b2 when List.length b2 = 0 -> TEcst(Cbool false)

    | Badd, TEbinop(Badd, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.add n1 n2)), x) (* (n1 + x) + n2 *)
    | Badd, TEbinop(Badd, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.add n1 n2)), x) (* (x + n1) + n2 *)
    | Badd, TEcst(Cint n2), TEbinop(Badd, TEcst(Cint n1), x) -> TEbinop(Badd, TEcst(Cint(Int64.add n1 n2)), x) (* n2 + (n1 + x) *)
    | Badd, TEcst(Cint n2), TEbinop(Badd, x, TEcst(Cint n1)) -> TEbinop(Badd, TEcst(Cint(Int64.add n1 n2)), x) (* n2 + (x + n1) *)

    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bsub, TEcst(Cint n1), x) -> TEbinop(op, x, TEcst(Cint(Int64.sub n1 n2))) (* n2 op (n1 - x) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Badd, TEcst(Cint n1), x) -> TEbinop(op, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 op (n1 + x) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bsub, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(op, TEcst(Cint(Int64.sub n1 n2)), x) (* (n1 - x) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Badd, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.sub n2 n1))) (* (n1 + x) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bsub, x, TEcst(Cint n1)) -> TEbinop(op, TEcst(Cint(Int64.add n1 n2)), x) (* n2 op (x - n1) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Badd, x, TEcst(Cint n1)) -> TEbinop(op, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 op (x + n1) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bsub, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.add n1 n2))) (* (x - n1) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Badd, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.sub n2 n1))) (* (x + n1) op n2 *)

    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bdiv, TEcst(Cint n1), x) -> TEbinop(op, x, TEcst(Cint(Int64.div n1 n2))) (* n2 op (n1 / x) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bmul, TEcst(Cint n1), x) -> TEbinop(op, TEcst(Cint(Int64.div n2 n1)), x) (* n2 op (n1 * x) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bdiv, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(op, TEcst(Cint(Int64.div n1 n2)), x) (* (n1 / x) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bmul, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.div n2 n1))) (* (n1 * x) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bdiv, x, TEcst(Cint n1)) -> TEbinop(op, TEcst(Cint(Int64.mul n1 n2)), x) (* n2 op (x / n1) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEcst(Cint n2), TEbinop(Bmul, x, TEcst(Cint n1)) -> TEbinop(op, TEcst(Cint(Int64.div n2 n1)), x) (* n2 op (x * n1) *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bdiv, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.mul n1 n2))) (* (x / n1) op n2 *)
    | (Beq | Bneq | Blt | Ble | Bgt | Bge as op), TEbinop(Bmul, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(op, x, TEcst(Cint(Int64.div n2 n1))) (* (x * n1) op n2 *)

    | Badd, TEbinop(Bsub, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bsub, TEcst(Cint(Int64.add n1 n2)), x) (* (n1 - x) + n2 *)
    | Badd, TEbinop(Bsub, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.sub n2 n1)), x) (* (x - n1) + n2 *)
    | Badd, TEcst(Cint n2), TEbinop(Bsub, TEcst(Cint n1), x) -> TEbinop(Bsub, TEcst(Cint(Int64.add n1 n2)), x) (* n2 + (n1 - x) *)
    | Badd, TEcst(Cint n2), TEbinop(Bsub, x, TEcst(Cint n1)) -> TEbinop(Badd, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 + (x - n1) *)
    
    | Bsub, TEbinop(Badd, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.sub n1 n2)), x) (* (n1 + x) - n2 *)
    | Bsub, TEbinop(Badd, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.sub n1 n2)), x) (* (x + n1) - n2 *)
    | Bsub, TEcst(Cint n2), TEbinop(Badd, TEcst(Cint n1), x) -> TEbinop(Bsub, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 - (n1 + x) *)
    | Bsub, TEcst(Cint n2), TEbinop(Badd, x, TEcst(Cint n1)) -> TEbinop(Bsub, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 - (x + n1) *)
    
    | Bsub, TEbinop(Bsub, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bsub, TEcst(Cint(Int64.sub n1 n2)), x) (* (n1 - x) - n2 *)
    | Bsub, TEbinop(Bsub, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Badd, TEcst(Cint(Int64.sub (Int64.sub Int64.zero n2) n1)), x) (* (x - n1) - n2 *)
    | Bsub, TEcst(Cint n2), TEbinop(Bsub, TEcst(Cint n1), x) -> TEbinop(Badd, TEcst(Cint(Int64.sub n2 n1)), x) (* n2 - (n1 - x) *)
    | Bsub, TEcst(Cint n2), TEbinop(Bsub, x, TEcst(Cint n1)) -> TEbinop(Bsub, TEcst(Cint(Int64.add n1 n2)), x) (* n2 - (x - n1) *)

    | Bmul, TEbinop(Bmul, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.mul n1 n2)), x) (* (n1 * x) * n2 *)
    | Bmul, TEbinop(Bmul, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.mul n1 n2)), x) (* (x * n1) * n2 *)
    | Bmul, TEcst(Cint n2), TEbinop(Bmul, TEcst(Cint n1), x) -> TEbinop(Bmul, TEcst(Cint(Int64.mul n1 n2)), x) (* n2 * (n1 * x) *)
    | Bmul, TEcst(Cint n2), TEbinop(Bmul, x, TEcst(Cint n1)) -> TEbinop(Bmul, TEcst(Cint(Int64.mul n1 n2)), x) (* n2 * (x * n1) *)

    | Bmul, TEbinop(Bdiv, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bdiv, TEcst(Cint(Int64.mul n1 n2)), x) (* (n1 / x) * n2 *)
    | Bmul, TEbinop(Bdiv, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.div n2 n1)), x) (* (x / n1) * n2 *)
    | Bmul, TEcst(Cint n2), TEbinop(Bdiv, TEcst(Cint n1), x) -> TEbinop(Bdiv, TEcst(Cint(Int64.mul n1 n2)), x) (* n2 * (n1 / x) *)
    | Bmul, TEcst(Cint n2), TEbinop(Bdiv, x, TEcst(Cint n1)) -> TEbinop(Bmul, TEcst(Cint(Int64.div n2 n1)), x) (* n2 * (x / n1) *)
    
    | Bdiv, TEbinop(Bmul, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.div n1 n2)), x) (* (n1 * x) / n2 *)
    | Bdiv, TEbinop(Bmul, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.div n1 n2)), x) (* (x * n1) / n2 *)
    | Bdiv, TEcst(Cint n2), TEbinop(Bmul, TEcst(Cint n1), x) -> TEbinop(Bdiv, TEcst(Cint(Int64.div n2 n1)), x) (* n2 / (n1 * x) *)
    | Bdiv, TEcst(Cint n2), TEbinop(Bmul, x, TEcst(Cint n1)) -> TEbinop(Bdiv, TEcst(Cint(Int64.div n2 n1)), x) (* n2 / (x * n1) *)
    
    | Bdiv, TEbinop(Bdiv, TEcst(Cint n1), x), TEcst(Cint n2) -> TEbinop(Bdiv, TEcst(Cint(Int64.div n1 n2)), x) (* (n1 / x) / n2 *)
    | Bdiv, TEbinop(Bdiv, x, TEcst(Cint n1)), TEcst(Cint n2) -> TEbinop(Bmul, TEcst(Cint(Int64.div (Int64.div Int64.one n2) n1)), x) (* (x / n1) / n2 *)
    | Bdiv, TEcst(Cint n2), TEbinop(Bdiv, TEcst(Cint n1), x) -> TEbinop(Bmul, TEcst(Cint(Int64.div n2 n1)), x) (* n2 / (n1 / x) *)
    | Bdiv, TEcst(Cint n2), TEbinop(Bdiv, x, TEcst(Cint n1)) -> TEbinop(Bdiv, TEcst(Cint(Int64.mul n1 n2)), x) (* n2 / (x / n1) *)

    | _, _, _ -> TEbinop (op, se1, se2))
  | TEunop (op, e) ->
    let te = simplify_texpr e in
    (match op, te with
    | Uneg, TEcst (Cint i) -> TEcst(Cint (Int64.sub Int64.zero i))
    | Unot, TEcst c -> TEcst(Cbool (is_false c))
    | Unot, TElist l -> TEcst(Cbool (List.length l = 0))
    | Uneg, TEbinop(Bsub, x, y) -> TEbinop(Bsub, y, x) (* -(x - y) *)
    | Uneg, TEunop(Uneg, x) -> x (* -(-x) *)
    | Unot, TEunop(Unot, x) -> x (* not not x *)
    | Unot, TEbinop(Beq, x, y) -> TEbinop(Bneq, x, y)
    | Unot, TEbinop(Bneq, x, y) -> TEbinop(Beq, x, y)
    | Unot, TEbinop(Blt, x, y) -> TEbinop(Bge, x, y)
    | Unot, TEbinop(Ble, x, y) -> TEbinop(Bgt, x, y)
    | Unot, TEbinop(Bgt, x, y) -> TEbinop(Ble, x, y)
    | Unot, TEbinop(Bge, x, y) -> TEbinop(Blt, x, y)
    | _, _ -> TEunop (op, te))
  | TEcall (fn, args) -> 
    let sargs = List.map (fun arg -> simplify_texpr arg) args in
    if fn.fn_name = "len" then
      match args with
      | [TElist l] -> TEcst (Cint (Int64.of_int (List.length l)))
      | [TEcst(Cstring s)] -> TEcst (Cint (Int64.of_int (String.length s)))
      | _ -> TEcall (fn, sargs)
    else
      TEcall (fn, sargs)
  | TElist elist -> TElist (List.map simplify_texpr elist)
  | TErange e -> TErange(simplify_texpr e)
  | TEget (e1, e2) -> TEget(simplify_texpr e1, simplify_texpr e2)

and simplify_tstmt = function
  | TSif (e, s1, s2) ->
    let ts1 = simplify_tstmt s1 in
    let ts2 = simplify_tstmt s2 in
    let te = simplify_texpr e in
    (match te with 
    | TEcst c when is_true c -> TSblock([ts1])
    | TEcst c when is_false c -> TSblock([ts2])
    | TElist l when List.length l <> 0 -> TSblock([ts1])
    | TElist l when List.length l = 0 -> TSblock([ts2])
    | _-> TSif(te, ts1, ts2))
  | TSreturn e -> TSreturn (simplify_texpr e)
  | TSassign (v, e) -> TSassign (v, simplify_texpr e)
  | TSprint e -> TSprint (simplify_texpr e)
  | TSblock stmts -> TSblock (List.map simplify_tstmt stmts)
  | TSfor (v, e, s) -> TSfor (v, simplify_texpr e, simplify_tstmt s)
  | TSeval e -> TSeval (simplify_texpr e)
  | TSset (e1, e2, e3) -> TSset (simplify_texpr e1, simplify_texpr e2, simplify_texpr e3)

let file ?debug:(b=false) (p: Ast.tfile) : Ast.tfile =
  debug := b;
  let simplify_tdef (tdef : Ast.tdef) : Ast.tdef =
    let (fn, stmt) = tdef in
    (fn, simplify_tstmt stmt)
  in
  List.map simplify_tdef p
