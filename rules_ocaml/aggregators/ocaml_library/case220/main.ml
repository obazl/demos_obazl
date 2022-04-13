let ()
  = print_endline "Hello from Main!" ;
  print_endline ("Red:   "   ^ string_of_int Red.v);
  print_endline ("Green: " ^ string_of_int Green.v);
  print_endline ("Blue:  "  ^ string_of_int Blue.v);
  ;;

let r = Red.v
let g = Green.v
let b = Blue.v
