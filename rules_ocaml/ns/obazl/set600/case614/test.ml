open OUnit2

let test1 _ = assert_equal 1 (Alpha.Red.v)
let test2 _ = assert_equal 2 (Alpha.Green.v)
let test3 _ = assert_equal 3 (Alpha.Blue.v)

let test4 _ = assert_equal 4 (Alpha.Beta.Red.v)
let test5 _ = assert_equal 5 (Alpha.Beta.Green.v)
let test6 _ = assert_equal 6 (Alpha.Beta.Blue.v)

let test7 _ = assert_equal 7 (Alpha.Beta.Gamma.Red.v)
let test8 _ = assert_equal 8 (Alpha.Beta.Gamma.Green.v)
let test9 _ = assert_equal 9 (Alpha.Beta.Gamma.Blue.v)

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
]

let () =
  run_test_tt_main suite

