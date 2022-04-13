open Color
open Couleur

let () = print_endline ("Red: " ^ string_of_int Red.v)
let () = print_endline ("Green carats: " ^ string_of_int Green.carats)

let () = print_endline ("Rouge: " ^ string_of_int Rouge.v)
let () = print_endline ("Vert carats: " ^ string_of_int Vert.carats)

let red   = Color.Red.v
let green = Color.Green.v
let green_carats   = Color.Green.carats
let blue  = Color.Blue.v

let rouge = Couleur.Rouge.v
let vert  = Couleur.Vert.v
let vert_carats   = Couleur.Vert.carats
let bleu  = Couleur.Bleu.v
