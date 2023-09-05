(* token.ml *)

type t =
  | INT_CONSTANT of string
  | EOS

type token = t
