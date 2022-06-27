open OUnit2

let test1 _ = assert_equal "Hello A" (A.msg)
(* let test2 _ = assert_equal 7 (B.private_field) *)

let suite =
"suite">:::
 ["test1">:: test1]

let () =
  run_test_tt_main suite

