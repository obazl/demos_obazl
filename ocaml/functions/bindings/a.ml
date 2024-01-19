(* lexical v. dynamic binding *)

let y = 0
let f x = x + y
let g y = f 9

(* lexical binding: g 1 == 9 (f sees global y) *)
(* OCaml uses lexical binding: *)
let () = print_endline ("g 1 = " ^ string_of_int (g 1)) (* 9 *)

(* dynamic binding: g 1 == 10 (f sees the y bound by g) *)



