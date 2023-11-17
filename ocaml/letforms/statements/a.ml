(* let statements (definitions) *)

(* 'let name = expr' (where expr does not contain 'in')
   is a statement whose side effect is to register
   the binding (name, expr) in the global environment.
 *)

let x = 1

(* CAUTION: whitespace does not terminate let statements.
   In the following example, the compiler will see '1 7'
   and infer that 1 should be a function applied to 7.
 *)

(*
let x = 1

7
 *)

(*
output:

16 | let x = 1
             ^
Error: This expression has type int
       This is not a function; it cannot be applied.
 *)


(* the 'expr' part of a let stmt can be used for side-effects
   such as printing to stdout.
   'print_endline' always evaluates to '()' (of type 'unit'),
   and since '()' is a primitive value there's not much point
   to defining a global var bound to () as in the following:
 *)
let u = print_endline ("x = " ^ (string_of_int x)) (* 1 *)
(* all this does is make 'u' synonymous with '()' *)

(*
   so common practice is to write 'let () = ...'
   Q: does this create a global binding?
 *)
let () = print_endline ("x = " ^ (string_of_int x)) (* 1 *)

(* also common is use of the "wildcard", '_',
   which conveys the idea that the bound value is
   to be discarded, so to speak.
 *)
let _  = print_endline ("x = " ^ (string_of_int x)) (* 1 *)

(* there is a difference between () and _, though.
   The latter matches anything; the former matches
   only (). So the following will succedd:
 *)
let _ = 3

(* but this will fail:
let () = 3
Error: This expression [i.e. '3'] has type int but an expression was expected of type unit
 *)

(* use 'and' for multiple definitions in one 'let': *)
(*
let y = 2 and z = 3
let () = print_endline ("y = " ^ (string_of_int y)) (* 2 *)
let () = print_endline ("z = " ^ (string_of_int z)) (* 3 *)
 *)

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




