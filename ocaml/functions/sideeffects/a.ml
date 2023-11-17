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
   expression.
 *)

let f = begin
    print_endline "I am a fun definition side-effect";
    fun a -> begin
        print_endline ("I am a fun application side-effect: " ^ (string_of_int a));
        2 * a
      end
  end
(* 3 *)

let _ = f 4

(* let () = print_endline string_of_int 3 *)
(* let x = (f 3) *)
(*     in x *)

(* 1 *)
