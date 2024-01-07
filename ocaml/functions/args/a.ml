(* function args and type inference *)

let f x = 3
(* val f : 'a -> int = <fun> *)

(* we can apply f to values of any type, since
   it always returns '3':
 *)

(* these all print '3' *)
let () = print_endline ("f 1 = " ^ string_of_int (f 1))
let () = print_endline ("f 3.14 = " ^ string_of_int (f 3.14))
let () = print_endline ("f 'a' = " ^ string_of_int (f 'a'))
let () = print_endline ("f \"hi\" = " ^ string_of_int (f "hi"))

(* same behavior even if we tell OCaml that the arg has
   type int. OCaml will still infer that the type does
   not matter:
 *)

let g x:int = 3
(* val g : 'a -> int = <fun> *)

(* these all print '3' *)
let () = print_endline ("g 1 = " ^ string_of_int (g 1))
let () = print_endline ("g 3.14 = " ^ string_of_int (g 3.14))
let () = print_endline ("g 'a' = " ^ string_of_int (g 'a'))
let () = print_endline ("g \"hi\" = " ^ string_of_int (g "hi"))

(* If however we _use_ the arg in the definition, so that
   the value of application depends on the input, OCaml will
   infer a more precise type (which we need not explicitly
   annotate):
 *)

let h x = x + 1  (* same as 'let h x:int = x + 1' *)
(* val h : int -> int = <fun> *)

let () = print_endline ("h 1 = " ^ string_of_int (h 1)) (* 2 *)

(* but:
let () = print_endline ("h 3.14 = " ^ string_of_int (h 3.14))

Error: This expression [3.14] has type float but an expression was expected of type int
 *)

(* Same thing happens even if we tell OCaml that the arg is
   generically typed. OCaml will refine the type to make
   it as "narrow" as possible:
 *)

let j x: 'a = x + 1 ;;
(* val j : int -> int = <fun> *)

let () = print_endline ("j 1 = " ^ string_of_int (j 1)) (* 2 *)

(* TODO: something about principal types? *)
(* https://www.cl.cam.ac.uk/teaching/1516/L28/type-inference.pdf
   "A type A is principal for a term M if every other derivable
   type for M is a substitution instance of A."
 *)

