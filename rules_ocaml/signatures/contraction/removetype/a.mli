(* goal: contract sig B by removing a type field *)

include (module type of B)
        with type t := int

