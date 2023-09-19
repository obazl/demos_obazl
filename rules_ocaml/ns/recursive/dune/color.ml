module Red   = Red
module Green = Green
module Blue  = Blue

(* An ns module can contain more than just alias statements. *)

let alpha = 0.5 ;;

print_endline ("Hello from color.ml. Red: " ^ string_of_int Red.v) ;;
