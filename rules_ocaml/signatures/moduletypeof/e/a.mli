(* 'module A: sig...end' says that 'module A' is a token of type
   'sig...end', i.e. of a sigtype. It does NOT name a module type.

to finish the defn we need to add 'module A = struct...end'.

so: the type of 'module A' is sig...end, that is, a sigtype. A token
   of a sigtype type is a structure.

so from a typing perspective, we have sigtypes inhabited by structs.
   from an algebraic perspective, each struct is bound to the sigtype,
   so each particular token of the sigtype gives rise to a module.

module types are different. they're not used to create module tokens,
   they're used for functors, sig composition, etc.

 *)

(* declare (define?) a module type *)
(* NB: this works as both a decl in a.mli and a defn in a.ml *)
module type A_t = sig
  open B
  include B

  open C
  include C

  val amsg : string
end

(* declare a token of the module type *)
module A : A_t

(* equivalently: *)

(* module A : sig *)
(*   open B *)
(*   include B *)

(*   open C *)
(*   include C *)

(*   val amsg : string *)
(* end *)

