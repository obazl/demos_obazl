(* Compilation fails for a.mli because it tries to 'include' B and C,
   but b.mli and c.mli do not include module type declarations of the
   form: module type X = sig ... end *)

open B
include B
(* 6 | include B *)
(*             ^ *)
(* Error: Unbound module type B *)
(* Hint: There is a module named B, but modules are not module types *)

open C
include C
(* 13 | include C *)
(*              ^ *)
(* Error: Unbound module type C *)
(* Hint: There is a module named C, but modules are not module types *)

val amsg : string

