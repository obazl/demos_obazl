(* goal: extend sig B by adding a field 'extra' *)

include (module type of B) with type t := int

val extra : string
