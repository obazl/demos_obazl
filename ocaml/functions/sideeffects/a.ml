(* here f will be bound to 6. why?
   the outermost begin...end will evaluate to the function,
   but ocaml will then see the following 3 before it
   binds f, so it will apply the fn to 3 and bind f
   to the result, 6.

   From which we can conclude that this begin...end does
   not delimit the definition of f. rather ocaml
   evaluates it, and continues; if it sees another term,
   it infers it must be dealing with a function so it
   applies it. basically begin...end acts like a lambda
   expression in this case.
 *)

let f = begin
    print_endline "I am a fun definition side-effect";
    fun a -> begin
        print_endline ("I am a fun application side-effect: " ^ (string_of_int a));
        2 * a
      end
  end (* this delimits the fn defn *)
(* whitespace not semantically relevant *)
3

(* (\* without the begin...end it won't compile: *\) *)
(* let f = *)
(*     print_endline "I am a fun definition side-effect"; *)
(*     fun a -> begin *)
(*         print_endline ("I am a fun application side-effect: " ^ (string_of_int a)); *)
(*         2 * a *)
(*       end *)
(* (\* whitespace not semantically relevant; *)
(* this '3' will be treated as part of the fn definition *)
(* but since the preceding expr (delimited by begin...end) *)
(* has type int (the type of 2*a), OCaml will try to *)
(* apply it to 3, and throw an error. *)
(* *\) *)
(* 3 *)


(* the following will fail with:

.. | let _ = f 4
             ^
Error: This expression has type int
       This is not a function; it cannot be applied.
 *)
(*
let _ = f 4
 *)

(* But if we remove the '3' above then f will be a function *)
