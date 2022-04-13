let ()
  = print_endline "Hello from Main!" ;
  print_endline ("Red:   " ^ string_of_int [%red   255]);
  print_endline ("Green: " ^ string_of_int [%green 127]);
  print_endline ("Blue:   " ^ string_of_int [%blue  80]);
  print_endline ("Alpha Red:  " ^ [%alpha   255]);
  print_endline ("Beta Green: " ^ [%beta 127]);
  print_endline ("Gamma Blue:  " ^ [%gamma  80]);
  ;;

let r = [%red   255]
let g = [%green 127]
let b = [%blue   80]

let alpha  = [%alpha 255]
let beta   = [%beta  127]
let gamma  = [%gamma  80]
