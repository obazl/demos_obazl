open OUnit2

let x = Hello.msg

let test1 _ = assert_equal "Hello" (x)

let suite =
"suite">:::
  [
    "test1">:: test1;
  ]

let () =
  run_test_tt_main suite

