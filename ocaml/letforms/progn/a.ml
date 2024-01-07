(* the semicolon operator constructs sequences of expressions. compare
   languages with explicit delimiters and an explicit sequencing
   operator, like parens in lispy languages, and 'progn', 'do', or
   'begin' (in lisp, clojure, and scheme, respectively). OCaml doesn't
   have an explicit sequencing operator, so semicolons are needed to
   tell the compiler that a sequence is not yet complete.
 *)

(* clojure: a bound to last expression in (begin ...)
   (let (a (begin exp1 exp2 ... expn)))
 *)

(* OCaml: a bound to last expression after '='
   not followed by ';'
 *)

let a =
  print_endline (string_of_int 2);
  print_endline "HI A";
  ();
  0
let () = print_endline ("a = " ^ (string_of_int a)) (* 0 *)

(* Expression sequences are for side-effects.
   All but the last subexpression should have
   type unit (i.e. evaluate to '()'), and OCaml
   will warn you if that is not the case. This
   is simply because the values of all but the
   last subexpression will be discarded, so it
   is wasteful to compute anything other than '()'.
 *)
let a = 1; 2 (* Warning 10 [non-unit-statement]: this expression [i.e. '1;'] should have type unit. *)
let () = print_endline ("a = " ^ (string_of_int a)) (* 2 *)

let a = ignore 1; 2 (* ignore the warning *)
let () = print_endline ("a = " ^ (string_of_int a)) (* 2 *)

let a = (); 2 (* no warning *)
let () = print_endline ("a = " ^ (string_of_int a)) (* 2 *)

let a = print_endline "no worries"; 2 (* no warning; 'print_endline <string>' has type unit *)
let () = print_endline ("a = " ^ (string_of_int a)) (* 2 *)


(* How does the compiler know when it hits the last expression
   in a seq? If the above 'let a ...' were followed by a datum like 7,
   the compiler would make the inference that the last expression
   is not 2, but 2 7 - i.e. it would try to treat 2 as a
   function to be applied to 7, which would fail.

   In other words, the decision is not based on syntax alone, it also
   involves type inference. (?)

   So to ensure the compiler gets it right we need to explicitly mark
   the end of the sequence. We can do that with parens or 'begin ... end'.

   But even then we get the same result, except the failure occurs
   after a has been defined rather than when the last expression is
   evaluated. *)


(* let a = begin *)
(*   print_endline (string_of_int 2); *)
(*   print_endline "HI A"; *)
(*   (); *)
(*   0 *)
(*   end *)

(* 7 *)

(*
   in this case the compiler tries to apply the value of the 'begin...end' expression to the next token, 7. Since the value of that
   expression is 0 (the last expr in begin...end), we get the same error:
   This expression has type int [ed: referring to begin...end]
   This is not a function; it cannot be applied.
 *)

(* if we were to replace the last expr 0 above
   with a function definition, then the application
   would work (provided the next token has the right type)

   BUT: the application happens as part of the definition of b
   (below), not as the application of b. The value of the begin...end
   sequence is the last expr in the sequence (like progn in lisps), so
   OCaml will apply the fn to 1, and then bind the result to b.

   NOTE: iow, begin...end does NOT always delimit the
   definition/binding; it's just a (compound) expression.
   IOW, the 'end' below does not mean "end of definition of b".
   we do not seem to have a way to make ocaml limit the
   fn definition to begin...end. The whitespace after 'end'
   does not delimit the definition.
 *)

let b = begin
  print_endline (string_of_int 2);
  print_endline "HI B";
  ();
  fun a -> 2 * a
  end

(* so if we follow the preceding begin...end with a
value, OCaml will treat it as part of the defining
expression for b. *)
3
(* now b is bound to 3, rather than a function. *)
let () = print_endline ("b = " ^ string_of_int b) (* 6 *)
(* if we had written 'let x = 3' instead of '3'
then b would be bound to a function *)
(* or we could have followed it with e.g.: *)
(* let x = b 2 *)

(* w/o explicit delimitation of the seq, the fn arg
   a will be interpreted as a fn to be applied to
   the following term (1), so the type of b
   will be (int -> int) -> int, instead of
   int -> int. that's because of type inference:
   ocaml will see that a is followed by \n\n1,
   so it will infer that a must be a function
   applied to 1, since there is no explicit delimiter
   telling it that the function definition ends at 'a'.
   NB: in more traditional syntax a semicolon might mark
   the end, but not in ocaml.
 *)
let b =
  print_endline (string_of_int 2);
  print_endline "HI B";
  ();
  fun a -> 2 * a
                 (* whitespace insignficant *)
3
(* OCaml sees 'fun a -> 2 * a 3', which applies
   a to 3, so it infers the type of a must be
   int->int
 *)

let x = b (fun x -> x + 1)
let () = print_endline ("x = " ^ string_of_int x); (* 8 *)

(*
   we could also use parens instead of begin...end,
   and we could put delimiters around the fn defn only.

   so the trick is to not just think in types, but
   think like a type inference engine.

 *)



(* "okay" *)

(* 7.1 *)



(* 1; *)

(* "world"; *)

(*   (\* 0 *\) *)
(*   (\* 4 *\) *)

