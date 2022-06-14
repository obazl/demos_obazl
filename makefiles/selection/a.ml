let platform = "macos"

let () = print_endline ("Hello from " ^ platform)

let msg = "msga"

module type B = sig val msg : string end

module  Blinux : B = struct let msg = "linux msg" end

module  Bmacos : B = struct let msg = "macos msg" end

(* syntax error: *)
(* module B : B = if platform == "linux" then Blinux else Bmacos *)
;;
(* if platform == "linux" *)
(* then let module B : B = Blinux in *)
(*      begin print_endline B.msg end *)
(* else let module B : B = Bmacos in *)
(*      begin print_endline B.msg end *)

(* But defining module B like this, in a local begin...end, buys us
   nothing; we get the same if we do: *)

if platform == "linux"
then print_endline Blinux.msg
else print_endline Bmacos.msg

