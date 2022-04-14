open OUnit2

let test1 _ = assert_equal  27 (Colors.RGB.Red.r)
let test2 _ = assert_equal  16 (Colors.RGB.Green.g)
let test3 _ = assert_equal 218 (Colors.RGB.Blue.b)

let hsb1 _ = assert_equal 243 (Colors.HSB.Hue.h)
let hsb2 _ = assert_equal  92 (Colors.HSB.Saturation.s)
let hsb3 _ = assert_equal  85 (Colors.HSB.Brightness.b)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;

    "hsb1">:: hsb1;
    "hsb2">:: hsb2;
    "hsb3">:: hsb3;
  ]

let () =
  run_test_tt_main suite

