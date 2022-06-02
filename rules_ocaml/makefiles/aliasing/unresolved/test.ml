open OUnit2

let test1 _ = assert_equal "Hello A" (A.msg)
let test2 _ = assert_equal "Hello B" (A.B.msg)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2
  ]

let () =
  run_test_tt_main suite

