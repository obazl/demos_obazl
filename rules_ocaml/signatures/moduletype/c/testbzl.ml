open OUnit2

let test1 _ = assert_equal "hello a" A1.amsg
let test2 _ = assert_equal "hello b" A1.bmsg
let test3 _ = assert_equal "hello c" A1.cmsg
let test4 _ = assert_equal "hello a" A2.amsg
let test5 _ = assert_equal "hello b" A2.bmsg
let test6 _ = assert_equal "hello c" A2.cmsg


let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
    "test4">:: test4;
    "test5">:: test5;
    "test6">:: test6;
  ]

let () =
  run_test_tt_main suite

