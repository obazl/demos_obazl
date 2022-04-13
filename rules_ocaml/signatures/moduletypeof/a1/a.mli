(* b.mli and c.mli do not contain 'module type' declarations. *)
(* if they did we would use the open-and-include method: *)
(* open B *)
(* include B *)
(* open C *)
(* include C *)
(* compare signatures/moduletype/a1 *)

include (module type of B)
include (module type of C)

val amsg : string

