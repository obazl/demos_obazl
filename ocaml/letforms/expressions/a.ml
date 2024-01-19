(* let expressions *)

(* 'let ... in expr ' is an expression whose value
   is the last term in expr. It does NOT register
   a binding in the global environment.
 *)

(* 'let () = ...' is not an expression; it does not return
   a value. if you try to use it as the expr part of
   'let ... in expr', you'll get a syntax error.
   to make it work you must make it an expression
   by add another 'in expr':
 *)

(* this works, because 'print_endline arg' is an expression *)
(* let x = 1 in print_endline ("x = " ^ string_of_int x) *)

(* nesting works *)
(*
let x = 1 in
    let y = 2 in
    ()
 *)

(* but two in a row fails w/syntax error on second 'in' *)
(*
let x = 1 in () (* ok, evaluates to () *)
let y = 2 in () (* syntax error on 'in' *)
 *)

(* removing second 'in' works: *)

(* let x = 1 in () (\* ok, evaluates to () *\) *)
(* let y = 2       (\* ok *\) *)

(* or use the sequencing op ';'  this makes
   the second let a subsexpression of the first
 *)
(*
let x = 1 in ();
let y = 2 in ();
 *)


(* let y = *)
(*   print_endline (string_of_int 2); *)
(*   print_endline "HI"; *)
(*   (); *)
(*   0; *)
(*   "world"; *)
(*   4 *)

(* let z = *)
(*   let z = 3 in () *)

(* let y = 2 in print_endline (string_of_int y) *)

(* this fails, because 'let x = y' (without 'in...')
   is not an exprssion
 *)
(* let x = 9 in let () = print_endline (string_of_int x) *)

(* this works because 'let ... in ...' is an expression *)
(* let x = 9 in let () = print_endline (string_of_int x) in () *)

  (* let a = 1 in 3 *)

(* let x = 1 *)
(* let () = print_endline (string_of_int x) (\* 3 *\) *)
(* let y = 2 *)

(* let a = 1 in x + 1; 3 (\* does NOT define global a *\) *)
(* this would give "Error: Unbound value a" *)
(* let () = print_endline (string_of_int a) *)

(* let a = 1 in let () = print_endline (string_of_int a) ; 7 *)
(* let a = 1 in 3 *)

(* let b = let x = 1 in x *)

let b =
  let x = 1 in x + 1; (* Warning 10 [non-unit-statement]: this expression should have type unit.*)
  5
let () = print_endline ("b = " ^ string_of_int b) (* 5 *)

let c =
  let x = 1 and y = 2 in x + y

let () = print_endline ("c = " ^ string_of_int c); (* 3 *)
