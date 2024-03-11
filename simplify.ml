open Ast
open Format

let debug = ref false

let is_false v =
  match v with Cnone -> true | Cbool v -> not v | Cint v -> Int64.equal v Int64.zero | Cstring v -> v = ""

let is_true v = not (is_false v)
let inv_op v = match v with Beq -> Bneq | Bneq -> Beq | Ble -> Bgt | Bgt -> Ble | Blt -> Bge | Bge -> Blt | x -> x

let rec simplify_texpr = function
  | TEcst c -> TEcst c
  | TEvar v -> TEvar v
  | TEbinop (op, e1, e2) -> (
      let se1 = simplify_texpr e1 in
      let se2 = simplify_texpr e2 in
      match (op, se1, se2) with
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEunop (Uneg, x), TEunop (Uneg, y) ->
          TEbinop (inv_op op, x, y) (* (x * n1) op n2 *)
      | Badd, TEcst (Cstring s1), TEcst (Cstring s2) -> TEcst (Cstring (s1 ^ s2))
      | Badd, TElist l1, TElist l2 -> TElist (l1 @ l2)
      | Badd, TEcst (Cint n1), TEcst (Cint n2) -> TEcst (Cint (Int64.add n1 n2))
      | Bsub, TEcst (Cint n1), TEcst (Cint n2) -> TEcst (Cint (Int64.sub n1 n2))
      | Bmul, TEcst (Cint n1), TEcst (Cint n2) -> TEcst (Cint (Int64.mul n1 n2))
      | Bdiv, TEcst (Cint n1), TEcst (Cint n2) when not (Int64.equal n2 Int64.zero) -> TEcst (Cint (Int64.div n1 n2))
      | Bmod, TEcst (Cint n1), TEcst (Cint n2) when not (Int64.equal n2 Int64.zero) -> TEcst (Cint (Int64.rem n1 n2))
      | Bmul, TEcst (Cint n), TEunop (Uneg, x) -> TEbinop (Bmul, TEcst (Cint (Int64.sub 0L n)), x)
      | Bmul, TEunop (Uneg, x), TEcst (Cint n) -> TEbinop (Bmul, TEcst (Cint (Int64.sub 0L n)), x)
      | Bdiv, TEcst (Cint n), TEunop (Uneg, x) -> TEbinop (Bdiv, TEcst (Cint (Int64.sub 0L n)), x)
      | Bdiv, TEunop (Uneg, x), TEcst (Cint n) -> TEbinop (Bdiv, TEcst (Cint (Int64.sub 0L n)), x)
      | Beq, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 = b2))
      | Bneq, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 <> b2))
      | Blt, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 < b2))
      | Ble, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 <= b2))
      | Bgt, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 > b2))
      | Bge, TEcst b1, TEcst b2 -> TEcst (Cbool (b1 >= b2))
      | Bor, TEcst b1, _ when is_true b1 -> TEcst (Cbool true)
      | Bor, _, TEcst b2 when is_true b2 -> TEcst (Cbool true)
      | Band, TEcst b1, _ when is_false b1 -> TEcst (Cbool false)
      | Band, _, TEcst b2 when is_false b2 -> TEcst (Cbool false)
      | Bor, TElist b1, _ when List.length b1 <> 0 -> TEcst (Cbool true)
      | Bor, _, TElist b2 when List.length b2 <> 0 -> TEcst (Cbool true)
      | Band, TElist b1, _ when List.length b1 = 0 -> TEcst (Cbool false)
      | Band, _, TElist b2 when List.length b2 = 0 -> TEcst (Cbool false)
      | Badd, TEcst (Cint 0L), x -> x
      | Badd, x, TEcst (Cint 0L) -> x
      | Bsub, TEcst (Cint 0L), x -> TEunop (Uneg, x)
      | Bsub, x, TEcst (Cint 0L) -> x
      | Bmul, TEcst (Cint 1L), x -> x
      | Bmul, x, TEcst (Cint 1L) -> x
      | Bmul, TEcst (Cint 0L), x -> TEcst (Cint Int64.zero)
      | Bmul, x, TEcst (Cint 0L) -> TEcst (Cint Int64.zero)
      | Bdiv, x, TEcst (Cint 1L) -> x
      | Band, x, TEcst y when is_true y -> x
      | Bor, x, TEcst y when is_false y -> x
      | Badd, TEunop (Uneg, x), y -> TEbinop (Bsub, y, x)
      | Badd, y, TEunop (Uneg, x) -> TEbinop (Bsub, y, x)
      | Bsub, y, TEunop (Uneg, x) -> TEbinop (Badd, x, y)
      | Bmul, TEunop (Uneg, x), TEunop (Uneg, y) -> TEbinop (Bmul, x, y)
      | Bdiv, TEunop (Uneg, x), TEunop (Uneg, y) -> TEbinop (Bdiv, x, y)
      | Band, TEunop (Unot, x), TEunop (Unot, y) ->
          TEunop (Unot, TEbinop (Bor, x, y)) (* not(x) & not(y) = not(x || y) *)
      | Bor, TEunop (Unot, x), TEunop (Unot, y) ->
          TEunop (Unot, TEbinop (Band, x, y)) (* not(x) || not(y) = not(x && y) *)
      | Badd, TEbinop (Badd, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.add n1 n2)), x) (* (n1 + x) + n2 *)
      | Badd, TEbinop (Badd, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.add n1 n2)), x) (* (x + n1) + n2 *)
      | Badd, TEcst (Cint n2), TEbinop (Badd, TEcst (Cint n1), x) ->
          TEbinop (Badd, TEcst (Cint (Int64.add n1 n2)), x) (* n2 + (n1 + x) *)
      | Badd, TEcst (Cint n2), TEbinop (Badd, x, TEcst (Cint n1)) ->
          TEbinop (Badd, TEcst (Cint (Int64.add n1 n2)), x) (* n2 + (x + n1) *)
      | ((Beq | Bneq) as op), TEunop (Uneg, x), TEcst (Cint n) ->
          TEbinop (op, x, TEcst (Cint (Int64.sub Int64.zero n))) (* -x rel_equiv cst *)
      | ((Beq | Bneq) as op), TEcst (Cint n), TEunop (Uneg, x) ->
          TEbinop (op, TEcst (Cint (Int64.sub Int64.zero n)), x) (* cst rel_equiv -x *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bsub, TEcst (Cint n1), x) ->
          TEbinop (op, x, TEcst (Cint (Int64.sub n1 n2))) (* n2 op (n1 - x) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Badd, TEcst (Cint n1), x) ->
          TEbinop (op, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 op (n1 + x) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bsub, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (op, TEcst (Cint (Int64.sub n1 n2)), x) (* (n1 - x) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Badd, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.sub n2 n1))) (* (n1 + x) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bsub, x, TEcst (Cint n1)) ->
          TEbinop (op, TEcst (Cint (Int64.add n1 n2)), x) (* n2 op (x - n1) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Badd, x, TEcst (Cint n1)) ->
          TEbinop (op, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 op (x + n1) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bsub, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.add n1 n2))) (* (x - n1) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Badd, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.sub n2 n1))) (* (x + n1) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bdiv, TEcst (Cint n1), x) ->
          TEbinop (op, x, TEcst (Cint (Int64.div n1 n2))) (* n2 op (n1 / x) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bmul, TEcst (Cint n1), x) ->
          TEbinop (op, TEcst (Cint (Int64.div n2 n1)), x) (* n2 op (n1 * x) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bdiv, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (op, TEcst (Cint (Int64.div n1 n2)), x) (* (n1 / x) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bmul, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.div n2 n1))) (* (n1 * x) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bdiv, x, TEcst (Cint n1)) ->
          TEbinop (op, TEcst (Cint (Int64.mul n1 n2)), x) (* n2 op (x / n1) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEcst (Cint n2), TEbinop (Bmul, x, TEcst (Cint n1)) ->
          TEbinop (op, TEcst (Cint (Int64.div n2 n1)), x) (* n2 op (x * n1) *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bdiv, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.mul n1 n2))) (* (x / n1) op n2 *)
      | ((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), TEbinop (Bmul, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (op, x, TEcst (Cint (Int64.div n2 n1))) (* (x * n1) op n2 *)
      | Badd, TEbinop (Bsub, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bsub, TEcst (Cint (Int64.add n1 n2)), x) (* (n1 - x) + n2 *)
      | Badd, TEbinop (Bsub, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub n2 n1)), x) (* (x - n1) + n2 *)
      | Badd, TEcst (Cint n2), TEbinop (Bsub, TEcst (Cint n1), x) ->
          TEbinop (Bsub, TEcst (Cint (Int64.add n1 n2)), x) (* n2 + (n1 - x) *)
      | Badd, TEcst (Cint n2), TEbinop (Bsub, x, TEcst (Cint n1)) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 + (x - n1) *)
      | Bsub, TEbinop (Badd, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub n1 n2)), x) (* (n1 + x) - n2 *)
      | Bsub, TEbinop (Badd, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub n1 n2)), x) (* (x + n1) - n2 *)
      | Bsub, TEcst (Cint n2), TEbinop (Badd, TEcst (Cint n1), x) ->
          TEbinop (Bsub, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 - (n1 + x) *)
      | Bsub, TEcst (Cint n2), TEbinop (Badd, x, TEcst (Cint n1)) ->
          TEbinop (Bsub, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 - (x + n1) *)
      | Bsub, TEbinop (Bsub, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bsub, TEcst (Cint (Int64.sub n1 n2)), x) (* (n1 - x) - n2 *)
      | Bsub, TEbinop (Bsub, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub (Int64.sub Int64.zero n2) n1)), x) (* (x - n1) - n2 *)
      | Bsub, TEcst (Cint n2), TEbinop (Bsub, TEcst (Cint n1), x) ->
          TEbinop (Badd, TEcst (Cint (Int64.sub n2 n1)), x) (* n2 - (n1 - x) *)
      | Bsub, TEcst (Cint n2), TEbinop (Bsub, x, TEcst (Cint n1)) ->
          TEbinop (Bsub, TEcst (Cint (Int64.add n1 n2)), x) (* n2 - (x - n1) *)
      | Bmul, TEbinop (Bmul, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.mul n1 n2)), x) (* (n1 * x) * n2 *)
      | Bmul, TEbinop (Bmul, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.mul n1 n2)), x) (* (x * n1) * n2 *)
      | Bmul, TEcst (Cint n2), TEbinop (Bmul, TEcst (Cint n1), x) ->
          TEbinop (Bmul, TEcst (Cint (Int64.mul n1 n2)), x) (* n2 * (n1 * x) *)
      | Bmul, TEcst (Cint n2), TEbinop (Bmul, x, TEcst (Cint n1)) ->
          TEbinop (Bmul, TEcst (Cint (Int64.mul n1 n2)), x) (* n2 * (x * n1) *)
      | Bmul, TEbinop (Bdiv, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.mul n1 n2)), x) (* (n1 / x) * n2 *)
      | Bmul, TEbinop (Bdiv, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div n2 n1)), x) (* (x / n1) * n2 *)
      | Bmul, TEcst (Cint n2), TEbinop (Bdiv, TEcst (Cint n1), x) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.mul n1 n2)), x) (* n2 * (n1 / x) *)
      | Bmul, TEcst (Cint n2), TEbinop (Bdiv, x, TEcst (Cint n1)) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div n2 n1)), x) (* n2 * (x / n1) *)
      | Bdiv, TEbinop (Bmul, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div n1 n2)), x) (* (n1 * x) / n2 *)
      | Bdiv, TEbinop (Bmul, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div n1 n2)), x) (* (x * n1) / n2 *)
      | Bdiv, TEcst (Cint n2), TEbinop (Bmul, TEcst (Cint n1), x) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.div n2 n1)), x) (* n2 / (n1 * x) *)
      | Bdiv, TEcst (Cint n2), TEbinop (Bmul, x, TEcst (Cint n1)) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.div n2 n1)), x) (* n2 / (x * n1) *)
      | Bdiv, TEbinop (Bdiv, TEcst (Cint n1), x), TEcst (Cint n2) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.div n1 n2)), x) (* (n1 / x) / n2 *)
      | Bdiv, TEbinop (Bdiv, x, TEcst (Cint n1)), TEcst (Cint n2) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div (Int64.div Int64.one n2) n1)), x) (* (x / n1) / n2 *)
      | Bdiv, TEcst (Cint n2), TEbinop (Bdiv, TEcst (Cint n1), x) ->
          TEbinop (Bmul, TEcst (Cint (Int64.div n2 n1)), x) (* n2 / (n1 / x) *)
      | Bdiv, TEcst (Cint n2), TEbinop (Bdiv, x, TEcst (Cint n1)) ->
          TEbinop (Bdiv, TEcst (Cint (Int64.mul n1 n2)), x) (* n2 / (x / n1) *)
      | _, _, _ -> TEbinop (op, se1, se2))
  | TEunop (op, e) -> (
      let te = simplify_texpr e in
      match (op, te) with
      | Uneg, TEcst (Cint i) -> TEcst (Cint (Int64.sub Int64.zero i))
      | Unot, TEcst c -> TEcst (Cbool (is_false c))
      | Unot, TElist l -> TEcst (Cbool (List.length l = 0))
      | Uneg, TEbinop (Bsub, x, y) -> TEbinop (Bsub, y, x) (* -(x - y) *)
      | Uneg, TEunop (Uneg, x) -> x (* -(-x) *)
      | Unot, TEunop (Unot, x) -> x (* not not x *)
      | Unot, TEbinop (((Beq | Bneq | Blt | Ble | Bgt | Bge) as op), x, y) -> TEbinop (inv_op op, x, y)
      | _, _ -> TEunop (op, te))
  | TEcall (fn, args) ->
      let sargs = List.map simplify_texpr args in
      if fn.fn_name = "len" then
        match sargs with
        | [ TElist l ] -> TEcst (Cint (Int64.of_int (List.length l)))
        | [ TEcst (Cstring s) ] -> TEcst (Cint (Int64.of_int (String.length s)))
        | _ -> TEcall (fn, sargs)
      else TEcall (fn, sargs)
  | TElist elist -> TElist (List.map simplify_texpr elist)
  | TErange e -> TErange (simplify_texpr e)
  | TEget (e1, e2) -> TEget (simplify_texpr e1, simplify_texpr e2)

and simplify_block stmts =
  match stmts with
  | [] -> []
  | TSblock block :: rest -> simplify_block block @ simplify_block rest
  | (TSreturn _ as ret_stmt) :: _ -> [ simplify_tstmt ret_stmt ]
  | stmt :: rest -> simplify_tstmt stmt :: simplify_block rest

and simplify_tstmt = function
  | TSif (e, s1, s2) -> (
      let ts1 = simplify_tstmt s1 in
      let ts2 = simplify_tstmt s2 in
      let te = simplify_texpr e in
      match te with
      | TEcst c when is_true c -> ts1
      | TEcst c when is_false c -> ts2
      | TElist l when List.length l <> 0 -> ts1
      | TElist l when List.length l = 0 -> ts2
      | _ -> TSif (te, ts1, ts2))
  | TSreturn e -> TSreturn (simplify_texpr e)
  | TSassign (v, e) -> TSassign (v, simplify_texpr e)
  | TSprint e -> TSprint (simplify_texpr e)
  | TSblock stmts -> TSblock (simplify_block (simplify_block stmts))
  | TSfor (v, e, s) -> TSfor (v, simplify_texpr e, simplify_tstmt s)
  | TSeval e -> TSeval (simplify_texpr e)
  | TSset (e1, e2, e3) -> TSset (simplify_texpr e1, simplify_texpr e2, simplify_texpr e3)

let file ?debug:(b = false) (p : Ast.tfile) : Ast.tfile =
  debug := b;
  let simplify_tdef (tdef : Ast.tdef) : Ast.tdef =
    let fn, stmt = tdef in
    (fn, simplify_tstmt stmt)
  in
  List.map simplify_tdef p
