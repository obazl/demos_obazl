(* Closures are not just for functions. Any expression
   containing a free variable is "open"; before it can
   be evaluated, its free variables must be bound to values.
   An expression whose variables are all bound is "closed",
   or "a closure". Function closures are just a special
   case.
 *)

(* In this example, the 'x' in 'x + 1' is free, so
   this would fail with "Error: unbound value x",
   because closures are computed before bindings;
   here the binding 'x = 1' is not visible
   elsewhere in the let env. Global definitions
   are registered AFTER all expressions are closed.
let x = 1 and y = x + 1
 *)

(* But if we define x first, it becomes visible
   in the global environment, so the second
   let here can use it to close the RHS expression.
   (I.e. the 'x' in '(string_of_int x)' is free, and
   must be bound to a value before evaluation.)
 *)
let x = 2
let () = print_endline ("x = " ^ (string_of_int x)) (* 2 *)

(* The following will succeed, but the value of x
   used to compute y will be 2 from the global binding,
   not 1. That is, the closure of 'x + 1' uses the
   global binding, not the local binding.
 *)

let x = 2               (* rebind global x *)
let () = print_endline ("x = " ^ (string_of_int x)) (* 2 *)

(* close 'x + 1' using global x, which is bound to 2;
   globals x and z are (re)bound AFTER the closure
   is computed *)
let x = 1 and z = x + 1

let () = print_endline ("x = " ^ (string_of_int x)) (* 1 *)
let () = print_endline ("z = " ^ (string_of_int z)) (* 3 *)



