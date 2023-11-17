(* lexical v. dynamic binding *)

let y = 0
let foo x = x + y
let bar y = foo 9
(* lexical binding: bar 1 == 9 (foo sees global y) *)
(* dynamic binding: bar 1 == 10 (foo sees the y bound by bar) *)

let () = print_endline ("foo 1 = " ^ string_of_int (foo 1))

(* OCaml uses lexical binding: bar 1 == 9 *)
let () = print_endline ("bar 1 = " ^ string_of_int (bar 1))



