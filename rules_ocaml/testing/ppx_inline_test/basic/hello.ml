let () = print_endline "Hello from Hello!"
(* let () = *)
(*   for i = 0 to Array.length Sys.argv - 1 do *)
(*     Printf.printf "[%i] %s\n" i Sys.argv.(i) *)
(*   done *)

let inc x = x + 1

let%test "test1" = 3 = inc 2

let x = 7

let%test "test2" = 8 = inc x
let%test "test3" = 2 = inc 1
