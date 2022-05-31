open Sexplib
open Sexplib.Std                (* for sexp_of_list *)

let hello_sexp =
  Sexp.to_string_hum [%sexp ([3;4;5] : int list)]

let () = print_endline "Hello, ppx!"


