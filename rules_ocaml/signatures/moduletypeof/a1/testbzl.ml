open OUnit2

let test1 _ = assert_equal "hello a" A.A.amsg
let test2 _ = assert_equal "hello b" A.A.bmsg
let test3 _ = assert_equal "hello c" A.A.cmsg


let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
  ]

let () =
  run_test_tt_main suite

