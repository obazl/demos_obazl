(* goal: destructive merge *)

include (module type of C)
include (module type of B)
        with type t := t

