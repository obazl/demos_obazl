(* let rec  *)

(* IMPORTANT: recursive functions must be inductively
   defined. Meaning they must be defined for a base case
   or cases and for an inductive case.
 *)

let rec f x = 2 + x
let () = print_endline ("f 1 = " ^ (string_of_int (f 1))) (* 3 *)
