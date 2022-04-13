https://ocaml.org/manual/moduleexamples.html#s%3Aseparate-compilation

"Note that only top-level structures can be mapped to
separately-compiled files, but neither functors nor module types.
However, all module-class objects can appear as components of a
structure, so the solution is to put the functor or module type inside
a structure, which can then be mapped to a file."



[Destructive substitutions](https://ocaml.org/manual/signaturesubstitution.html#ss%3Adestructive-substitution)

module type Printable = sig
  type t
  val print : Format.formatter -> t -> unit
end
module type Comparable = sig
  type t
  val compare : t -> t -> int
end
module type PrintableComparable = sig
  include Printable
  include Comparable with type t := t
end
