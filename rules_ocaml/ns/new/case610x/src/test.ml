open OUnit2

let test1 test_ctxt = assert_equal 255 (Alpha.Beta.Color.Red.v)
let test2 test_ctxt = assert_equal 127 (Alpha.Beta.Color.Green.v)
let test3 test_ctxt = assert_equal 80  (Alpha.Beta.Color.Blue.v)

let test4 test_ctxt = assert_equal 255 (Beta.Color.Red.v)
let test5 test_ctxt = assert_equal 127 (Beta.Color.Green.v)
let test6 test_ctxt = assert_equal 80  (Beta.Color.Blue.v)

let test7 test_ctxt = assert_equal 255 (Color.Red.v)
let test8 test_ctxt = assert_equal 127 (Color.Green.v)
let test9 test_ctxt = assert_equal 80  (Color.Blue.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;

 "test4">:: test4;
 "test5">:: test5;
 "test6">:: test6;

 "test7">:: test7;
 "test8">:: test8;
 "test9">:: test9;
]

let () =
  run_test_tt_main suite

