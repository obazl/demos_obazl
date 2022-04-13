let ()
  = print_endline "Hello from Main!" ;
  print_endline ("Red:   " ^ [%red   255]);
  print_endline ("Green: " ^ [%green 127]);
  print_endline ("Blue:  " ^ [%blue  80]);
  ;;

let r = [%red   255]
let g = [%green 127]
let b = [%blue   80]
