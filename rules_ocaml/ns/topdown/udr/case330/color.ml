(* user-supplied main ns module must contain pseudo-recursive equations for all submodules *)

module Red   = Red
module Green = Green
module Blue  = Blue

let alpha = 0.5 ;;

print_endline ("Hello from user-provided module Color. Red: " ^ string_of_int Red.v) ;;
