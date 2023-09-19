let v = 255 ;;

(* to test submodule build mech *)
print_endline ("Hello from module Red. Blue: " ^ string_of_int Blue.v) ;;

(* non-namespace dep: *)
print_endline ("Hello from module Red. Subred: " ^ string_of_int Subred.v) ;;
