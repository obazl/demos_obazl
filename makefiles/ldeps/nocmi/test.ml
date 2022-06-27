open OUnit2

let test1 _ = assert_equal "The answer is: 42" (A.msg)

let suite =
"suite">:::
[
  "test1">:: test1;
]

let () =
  run_test_tt_main suite
