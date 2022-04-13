(* user-supplied main ns module must contain pseudo-recursive equations for all submodules *)

(* In this case we're not using a resolver, so we have to accomodate the renaming here: *)
module Red   = Foo__Red
module Green = Foo__Green
module Blue  = Foo__Blue

let alpha = 0.5 ;;

print_endline ("Hello from user-provided, renamed module Color. Red: " ^ string_of_int Foo__Red.v) ;;
