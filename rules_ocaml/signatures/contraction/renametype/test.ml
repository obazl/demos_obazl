open OUnit2

let test1 _ = assert_equal "3" (A.to_string A.msg)
let test2 _ = assert_equal (A.of_string "3") A.msg

let suite =
"suite">:::
 ["test1">:: test1;
  "test2">:: test2]

let () =
  run_test_tt_main suite

