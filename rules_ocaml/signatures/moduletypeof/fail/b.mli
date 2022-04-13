type t
val of_string : string -> t
val to_string : t -> string
val foo : t -> t (* a.ml does not implement, so 'make amod' fails *)

