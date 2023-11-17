(*
  we can write any expression here
 *)
(*
1 (* ok; evaluated, but effectively discarded *)
 *)


(* but if we try to write a sequence, where only
   whitespace separates the subexpressions,
   we crap out:
 *)
(*
2
3
 *)

(* result:
.. | 2
     ^
Error: This expression has type int
       This is not a function; it cannot be applied.
 *)

(* This is because of type inference. Since whitespace
   is insignificant, OCaml sees the above as '2 3',
   and it infers that this must be a function application,
   so '2' must be a function, and we get the error.

   To make ocaml see a sequence of two expressions,
   ('2', then '3'), we need to use the semicolon
   sequencing operator:
 *)
(*
2;
3
 *)
(* the semicolon tells ocaml two things: first that
   '2' is an expression, and second that what follows
   is also an expression. We could also write this '2; 3'.

   The semicolon turns '2; 3' into one compound expression
   composed of two subexpressions; the value of the
   compound expression is the value of the last subexpression,
   and the values of all other subexpressions are
   effectively discarded.  Since discarding a subexpression
   that returns a value other than () is wasteful, OCaml
   will warn us:

35 | 2;
     ^
     Warning 10 [non-unit-statement]: this expression should have type unit.

     Compare this, which prints no warning:
 *)
(*
();
4
 *)

(* now try the same thing with explicit delimiters: *)
(*
begin
  5;
  6
end
 *)
(* same thing: we get a warning that '5' should
   have type unit. *)
(*
begin (); 6 end (* no warning *)
 *)

(* we can use parens instead of begin...end *)
(*
(5; 6) (* same warning *)
 *)

(*
((); 6) (* no warning *)
 *)

(*
3
4
 *)

