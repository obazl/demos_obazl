let () = print_endline "Hello from A!"

let msg = "Hello A"

module X = struct
  let () = print_endline "Hello from B(X)!"
  let msg = "Hello B(X)"
end

(*
  the module aliasing equation tells the compiler two things:
  1) symbol B within scope (ns) of module A is alias for module X
  2) if you cannot resolve B in the current env, search the file system

  in this case, it will find the definition of X above and will not
  search the file system (which contains compiled module X, which will
  be ignored). *)
module B = X

let () = print_endline (msg ^ " - " ^ B.msg)

(* Another module (e.g. Test) depending on A can refer to A.B *)
