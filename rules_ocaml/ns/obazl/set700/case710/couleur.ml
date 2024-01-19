module Rouge = Red
module Vert  = Green
module Bleu  = Blue

let alpha = 1

let () = print_endline ("Hello from module Couleur. Rouge: " ^ string_of_int Rouge.v)
