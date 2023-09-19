(* These alias equations are recursive. The compiler will resolve
   them by looking in the helper module
   (Demos_namespaces_recursive_makefile_ns), which must be '-open'ed on the
   command line. *)

module Red   = Red
module Green = Green
module Blue  = Blue

(* An ns module can contain more than just aliasing equations. *)

let alpha = 0.5 ;;

print_endline ("Hello from the Color module. Red: " ^ string_of_int Red.v) ;;
