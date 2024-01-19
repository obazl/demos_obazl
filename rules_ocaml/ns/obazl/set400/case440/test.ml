open OUnit2

let test1 _ = assert_equal 255 (Color.Red.v)
let test2 _ = assert_equal 127 (Color.Green.v)
let test3 _ = assert_equal 80  (Color.Blue.v)
let test4 _ = assert_equal 1  (Color.alpha)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
  "test4">:: test4;
]


let () =
  run_test_tt_main suite
