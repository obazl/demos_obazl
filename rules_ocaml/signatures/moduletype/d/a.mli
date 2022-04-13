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

