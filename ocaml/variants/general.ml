type poly  = Int of int | String of string

(* let int_of_poly x = function Int x -> x | Some n -> n *)

let padd a b = match a, b with
  | (Int x, Int y) -> Some (x + y)
  | _ -> None
(* val padd : poly -> poly -> int option = <fun> *)

let int_of_intoption = function None -> 0 | Some n -> n
let string_of_intoption = function None -> "None"
                                 | Some n -> (string_of_int n)

let x = padd (Int 2) (Int 3)
let () = print_endline (string_of_intoption x);



