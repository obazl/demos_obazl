

open OUnit2

let test1 _ = assert_equal "msg from Simple" (LibHello.Simple.msg())
let test2 _ = assert_equal "msg from Easy" (LibHello.Easy.msg)
let test3 _ = assert_equal "msg from Main" (Main.msg())

let suite =
"suite">:::
 ["test1">:: test1;
 "test1">:: test1;
 "test1">:: test1]

let () =
  run_test_tt_main suite

