let v = 255 ;;

(* Submodules can reference each other without going through the main
   module (Color). *)

print_endline ("Hello from the Red module. Green: " ^ string_of_int Green.v) ;;
