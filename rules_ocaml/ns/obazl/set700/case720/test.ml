open OUnit2

let test1 _ = assert_equal 255 (Alpha.Beta.Red.v)
let test2 _ = assert_equal 256 (Alpha.Gamma.Red.v)
let test3 _ = assert_equal 127  (Alpha.Beta.Green.v)
let test4 _ = assert_equal 128  (Alpha.Gamma.Green.v)
let test5 _ = assert_equal 80  (Alpha.Beta.Blue.v)
let test6 _ = assert_equal 81  (Alpha.Gamma.Blue.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;

 "test4">:: test4;
 "test5">:: test5;
 "test6">:: test6;
]

let () =
  run_test_tt_main suite
