(* let statements (definitions) *)

(* 'let name = expr' (where expr does not contain 'in')
   is a statement whose side effect is to register
   the binding (name, expr) in the global environment.
 *)

let x = 1
let () = print_endline ("x = " ^ (string_of_int x)) (* 1 *)

(* let bindings are not visibile within the let env. *)
(* this would fail with "Error: unbound value x",
   because the binding (x, 1) is not visible
   elsewhere in the let env.
let x = 1 and y = x + 1
 *)

(* but if we define x first, it becomes visible
   in the global environment. *)
let x = 2
let () = print_endline (string_of_int x) (* 2 *)

(* the following will succeed, but the value of x
   used to compute y will be 2 from the global binding,
   not 1:
 *)
let x = 1 and y = x + 1 (* rebinds x, binds y *)

let () = print_endline (string_of_int x) (* 1 *)
let () = print_endline (string_of_int y) (* 3 *)




