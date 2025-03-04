(* for demo purposes, we put the wrapper in the same package as the C library. *)

(* Note that we do not use anything from the OCaml C API *)

external my_int_fn: unit -> int = "caml_my_int_fn"
external my_str_fn: unit -> string = "caml_my_str_fn"

external print_hello: unit -> unit = "caml_print_hello"
external print_int:   unit -> unit = "caml_print_int"
