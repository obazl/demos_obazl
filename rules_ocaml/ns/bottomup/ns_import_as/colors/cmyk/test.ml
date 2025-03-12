open OUnit2

let test1 _ = assert_equal 88 (CMYK.Cyan.c)
let test2 _ = assert_equal 92 (CMYK.Magenta.m)
let test3 _ = assert_equal  0 (CMYK.Yellow.y)
let test4 _ = assert_equal 15 (CMYK.Key.k)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
    "test4">:: test4;
]

let () =
  run_test_tt_main suite

