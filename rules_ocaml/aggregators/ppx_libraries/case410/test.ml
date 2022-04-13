open OUnit2

let test1 test_ctxt = assert_equal "255" [%red   255]
let test2 test_ctxt = assert_equal "127" [%green 127]
let test3 test_ctxt = assert_equal "80"  [%blue   80]

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
]

let () =
  run_test_tt_main suite
