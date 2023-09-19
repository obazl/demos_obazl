open OUnit2

let test1 _ = assert_equal 1 (Alpha.Ared.v)
let test2 _ = assert_equal 2 (Alpha.Agreen.v)
let test3 _ = assert_equal 3 (Alpha.Ablue.v)

let test4 _ = assert_equal 4 (Alpha.Beta.Bred.v)
let test5 _ = assert_equal 5 (Alpha.Beta.Bgreen.v)
let test6 _ = assert_equal 6 (Alpha.Beta.Bblue.v)

let test7 _ = assert_equal 7 (Alpha.Beta.Gamma.Cred.v)
let test8 _ = assert_equal 8 (Alpha.Beta.Gamma.Cgreen.v)
let test9 _ = assert_equal 9 (Alpha.Beta.Gamma.Cblue.v)

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

