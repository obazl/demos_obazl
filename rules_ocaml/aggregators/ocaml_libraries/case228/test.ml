open OUnit2

let test1 test_ctxt = assert_equal 255 (Red.v)
let test2 test_ctxt = assert_equal 127 (Green.v)
let test3 test_ctxt = assert_equal 80  (Blue.v)

let test4 test_ctxt = assert_equal "msg from Alpha" (Alpha.msg)
let test5 test_ctxt = assert_equal "msg from Beta" (Beta.msg)
let test6 test_ctxt = assert_equal "msg from Gamma" (Gamma.msg)

let test7 test_ctxt = assert_equal 255 (Main.r)
let test8 test_ctxt = assert_equal 127 (Main.g)
let test9 test_ctxt = assert_equal  80 (Main.b)

let test10 test_ctxt = assert_equal "msg from Alpha" (Main.alpha)
let test11 test_ctxt = assert_equal "msg from Beta"  (Main.beta)
let test12 test_ctxt = assert_equal "msg from Gamma" (Main.gamma)

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

