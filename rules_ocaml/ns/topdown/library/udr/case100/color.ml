(* user-supplied main ns module must contain pseudo-recursive equations for all submodules *)

let alpha = 0.5 ;;


module Red   = Color__Red
module Green = Color__Green
module Blue  = Color__Blue

let () = print_endline ("Hello from user-provided resolver Color.Red: " ^ string_of_int Red.v)
