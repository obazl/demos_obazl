open OUnit2

let test1 _ = assert_equal "The answer from A is: 7" (A.msg_a)
let test2 _ = assert_equal "The answer from B is: 55" (A.msg_b)
let test3 _ = assert_equal "The answer from C is: 42" (A.msg_c)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
]

let () =
  run_test_tt_main suite
