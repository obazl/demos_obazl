open OUnit2

let test1 _ = assert_equal 243 (Hsb.Hue.h)
let test2 _ = assert_equal  92 (Hsb.Saturation.s)
let test3 _ = assert_equal  85 (Hsb.Brightness.b)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
]

let () =
  run_test_tt_main suite

