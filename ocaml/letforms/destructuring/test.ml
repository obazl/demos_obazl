open OUnit2
open A

let test1 _ = assert_equal x 8
let test2 _ = assert_equal y 9

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
 ]

let () =
  run_test_tt_main suite

