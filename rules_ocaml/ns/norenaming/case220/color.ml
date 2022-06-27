(* user-supplied main ns module must contain pseudo-recursive
   equations for all submodules *)
(* in this case no pseudo-namespace (prefix) is used *)

module Red   = Red
module Green = Green
module Blue  = Blue

module Alpha = struct
  let v = 0.5
end

let beta = 1.2

let () =
  print_endline ("Hello from user-provided module Color. Red: "
                 ^ string_of_int Red.v)
