open OUnit2

let () = print_endline "Hello from test!"

let () = print_endline ("Hello from test! " ^ Alpha.my_str_fn())

let test1 _ = assert_equal "hello" (Alpha.my_str_fn())
(* let test2 _ = assert_equal 17 (Alpha.my_int_fn()) *)

let suite =
"suite">:::
[
  "test1">:: test1 ;
  (* "test2">:: test2 *)
]

let () =
  run_test_tt_main suite
