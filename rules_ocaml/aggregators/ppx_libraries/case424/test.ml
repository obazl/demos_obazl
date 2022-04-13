open OUnit2

let test1 test_ctxt = assert_equal 255 [%red   255]
let test2 test_ctxt = assert_equal 127 [%green 127]
let test3 test_ctxt = assert_equal 80  [%blue   80]

let test4 test_ctxt = assert_equal "255" [%alpha   255]
let test5 test_ctxt = assert_equal "127" [%beta    127]
let test6 test_ctxt = assert_equal "80"  [%gamma    80]

let test7 test_ctxt = assert_equal 255 Main.r
let test8 test_ctxt = assert_equal 127 Main.g
let test9 test_ctxt = assert_equal 80  Main.b

let test10 test_ctxt = assert_equal "255" Main.alpha
let test11 test_ctxt = assert_equal "127" Main.beta
let test12 test_ctxt = assert_equal  "80" Main.gamma

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;

  "test4">:: test4;
  "test5">:: test5;
  "test6">:: test6;

  "test7">:: test7;
  "test8">:: test8;
  "test9">:: test9;

  "test10">:: test10;
  "test11">:: test11;
  "test12">:: test12;
]

let () =
  run_test_tt_main suite

