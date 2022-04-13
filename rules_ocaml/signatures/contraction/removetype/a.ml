(* type t removed *)
let of_string x = int_of_string x
let to_string x = string_of_int x

let msg = of_string "3"

let () = print_endline ("hello from a.ml: " ^ to_string msg)

