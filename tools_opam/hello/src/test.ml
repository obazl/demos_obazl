open OUnit2

let test1 _ = assert_equal "Hello" (Hello.msg)
let test2 _ = assert_equal 2 (Hello.MyModule.inc 1)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2
  ]

let () =
  run_test_tt_main suite

