let v = 127

let () =
  print_endline ("Hello from module Alpha.Beta.Green. Blue: "
                 ^ string_of_int Blue.v)

(* access sibling nslib *)
let () = print_endline ("Hello again from module Alpha.Beta.Green. Alpha.Gamma.Green: "
                        ^ string_of_int Gamma.Green.v)
