open OUnit2

let test1 _ = assert_equal 255 (Nofoo__Red.v)
let test2 _ = assert_equal 127 (Nofoo__Green.v)
let test3 _ = assert_equal 80  (Nofoo__Blue.v)
let test4 _ = assert_equal 255 (Nobar__Red.v)
let test5 _ = assert_equal 127 (Nobar__Green.v)
let test6 _ = assert_equal 80  (Nobar__Blue.v)

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
