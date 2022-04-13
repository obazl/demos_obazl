open OUnit2

let test1 test_ctxt = assert_equal 80 (Color.v)

let suite =
"suite">:::
[
  "test1">:: test1;
]

let () =
  run_test_tt_main suite

