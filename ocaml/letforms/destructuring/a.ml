let x = 0
let y = 1

let () = print_endline ("x = " ^ (string_of_int x)) (* 0 *)
let () = print_endline ("y = " ^ (string_of_int y)) (* 1 *)

let x = 2 and y = 3

let () = print_endline ("x = " ^ (string_of_int x)) (* 2 *)
let () = print_endline ("y = " ^ (string_of_int y)) (* 3 *)

let (x, y) = (4, 5)             (* destructuring *)
let () = print_endline ("x = " ^ (string_of_int x)) (* 4 *)
let () = print_endline ("y = " ^ (string_of_int y)) (* 5 *)

let (x, y) = begin 6, 7 end     (* equivalently *)
let () = print_endline ("x = " ^ (string_of_int x)) (* 6 *)
let () = print_endline ("y = " ^ (string_of_int y)) (* 7 *)

let (x, y) = begin              (* with whitespace *)
    8,
    9
  end
let () = print_endline ("x = " ^ (string_of_int x)) (* 8 *)
let () = print_endline ("y = " ^ (string_of_int y)) (* 9 *)
