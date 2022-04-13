let ()
  = print_endline "Hello from Main!" ;
  print_endline ("Main Red:   " ^ string_of_int Red.v);
  print_endline ("Main Green: " ^ string_of_int Green.v);
  print_endline ("Main Blue:  " ^ string_of_int Blue.v);
  print_endline ("Main Alpha: " ^ Alpha.msg);
  print_endline ("Main Beta:  " ^ Beta.msg);
  print_endline ("Main Gamma: " ^ Gamma.msg);
  ;;

let r = Red.v
let g = Green.v
let b = Blue.v

let alpha = Alpha.msg
let beta  = Beta.msg
let gamma = Gamma.msg
