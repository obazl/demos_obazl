open OUnit2

let test1 _ = assert_equal 255 (Red.r)
let test2 _ = assert_equal 127 (Green.g)
let test3 _ = assert_equal 80  (Blue.b)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
]

let () =
  run_test_tt_main suite
