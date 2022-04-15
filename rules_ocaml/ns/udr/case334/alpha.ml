module Red   = Red
module Green = Green
module Blue  = Blue

module Beta  = Beta

let alpha = 0.5

let () = print_endline ("Hello from user-provided module Color. Red: " ^ string_of_int Red.v)
