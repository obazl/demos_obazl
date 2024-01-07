open OUnit2
open A

let test1 _ = assert_equal 9 (g 1)

let suite =
"suite">:::
 ["test1">:: test1;]

let () =
  run_test_tt_main suite

