(* expanded by ocamlc -i *)
type enum = A | B of int | C of bool * int | D of { a : int; b : string; }
val pp_enum : Ppx_show_runtime.Format.formatter -> enum -> unit
val show_enum : enum -> string
val exit_code : int ref
val string_match : int -> string -> string -> unit
type 'a poly = A of enum | B of 'a poly * 'a
val pp_poly :
  (Ppx_show_runtime.Format.formatter -> 'a -> unit) ->
  Ppx_show_runtime.Format.formatter -> 'a poly -> unit
val show_poly :
  (Ppx_show_runtime.Format.formatter -> 'a -> unit) -> 'a poly -> string
val pp_int : Format.formatter -> 'a -> unit
module Test :
  sig
    type t = A
    val pp : Ppx_show_runtime.Format.formatter -> t -> unit
    val show : t -> string
  end
