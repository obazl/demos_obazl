(* this file wraps a cclib in a different pkg, to simulate a
   real-world scenario where the cclib may be pre-built *)

external print_hello: unit -> unit = "caml_print_hello"
external print_int:   unit -> unit = "caml_print_int"
