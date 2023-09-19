(* this module is 'include'd by the main nslib module 'Color' *)

let alpha = 1

(* a dependency on a submodule of same nslib *)
let () =
  print_endline ("Hello from included module Color_include. Red: "
                 ^ string_of_int Red.v)
