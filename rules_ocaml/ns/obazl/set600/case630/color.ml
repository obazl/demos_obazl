(* Note that we change the capitalization *)

module RGB = Rgb
module CMY = Cmy

let alpha = 1

let () = print_endline ("Hello from module Color. RGB.Blue.v: " ^ string_of_int RGB.Blue.v)

let () = print_endline ("Hello again from module Color. CMY.Magenta.v: " ^ string_of_int CMY.Magenta.v)
