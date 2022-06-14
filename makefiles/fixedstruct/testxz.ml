open OUnit2

let test1 _ = assert_equal 1 (A.x)
let test2 _ = assert_equal 3 (A.z)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
]

let () =
  run_test_tt_main suite

