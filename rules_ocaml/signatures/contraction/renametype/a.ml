type u = int
let of_string x = int_of_string x
let to_string x = string_of_int x

let s1 = of_string "3"          (* private *)

let msg = s1                    (* public *)

(* demonstrate this was bound into executable *)
let () = print_endline ("hello from a.ml: " ^ to_string s1)
