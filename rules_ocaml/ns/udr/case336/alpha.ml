module Red   = Red
module Green = Green
module Blue  = Blue

let alpha = 0.5

let () = print_endline ("Hello from user-provided module Color. Red: " ^ string_of_int Red.v)

let () = print_endline ("Hello again from user-provided module Color. Beta.Red: " ^ string_of_int Beta.Red.v)
