open OUnit2

let test1 _ = assert_equal "The answer is: 55" (A.msg_a)
let test2 _ = assert_equal "The answer from C is: 42" (A.msg_c)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
]

let () =
  run_test_tt_main suite
