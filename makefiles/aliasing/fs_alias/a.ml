let () = print_endline "Hello from A!"

let msg = "Hello A"

(*
  the module aliasing equation tells the compiler two things:
  1) symbol B within scope (ns) of module A is alias for module B
  2) if you cannot resolve B in the current env, search the file system
 *)
module B = X    (* B = B would also work *)

(* Now, if the compiler can find module X in its file system search
   path, then it will be able to resolve B by aliasing it to X: *)

let () = print_endline (msg ^ " - " ^ B.msg)

(* Another module (e.g. Test) depending on A can refer to A.B *)
