let () = print_endline "Hello from A!"

let msg = "msg A"
let msga = "msga"

(* WARNING: B defines 'msg', which overrides the definition above *)
include B

let () = print_endline ("B msgb: " ^ msgb)
