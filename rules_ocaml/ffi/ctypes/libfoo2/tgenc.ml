(* generated by dune *)

let () =
  print_endline "#include <foo.h>";
  Cstubs_structs.write_c Format.std_formatter
    (module FooAPI.Types)

