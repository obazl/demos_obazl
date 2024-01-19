let v = 255

(* to test submodule build mech *)
let () = print_endline ("Hello from module Red. Blue: " ^ string_of_int Blue.v)

(* non-namespace dep: *)
let () = print_endline ("Hello from module Red. Subred: " ^ string_of_int Subred.v)
