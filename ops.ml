
(** {2 Opérations x86-64} *)

(** opérations unaires *)
type munop =
  | Maddi   of int64
  (** equal to const *)
  | Msetei  of int64
  (** diff from const*)
  | Msetnei of int64

(** opérations binaires *)
type mbinop =
  | Mmov
  | Madd
  | Msub
  | Mmul
  | Mdiv
  | Msete
  | Msetne
  | Msetl
  | Msetle
  | Msetg
  | Msetge

(** opérations de branchement unaires *)
type mubranch =
  | Mjz
  | Mjnz
  (** inf or eq to const *)
  | Mjlei of int64
  | Mjgi  of int64

(** opérations de branchement binaires *)
type mbbranch =
  | Mjl
  | Mjle