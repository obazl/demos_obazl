(* for demo purposes, we put the wrapper in the same package as the C library. *)
let () = print_endline "Hello from alpha!"

external my_int_fn: unit -> int = "alpha_my_int_fn"
external my_str_fn: unit -> string = "my_str_fn"

external print_hello: unit -> unit = "my_print_hello"
external print_int:   unit -> unit = "my_print_int"
