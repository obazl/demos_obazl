module type Printable = sig
  type t
  val print : Format.formatter -> t -> unit
end
