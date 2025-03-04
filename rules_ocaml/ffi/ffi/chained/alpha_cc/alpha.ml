(* for demo purposes, we put the wrapper in the same package as the C library. *)

external print_hello: unit -> unit = "caml_print_hello"
external print_int:   unit -> unit = "caml_print_int"
