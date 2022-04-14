open OUnit2

let rgb1 _ = assert_equal  27 (Colors.R.r) (* not: Colors.RGB.Red.r *)
let rgb2 _ = assert_equal  16 (Colors.G.g)
let rgb3 _ = assert_equal 218 (Colors.B.b)

let hsb1 _ = assert_equal 243 (Colors.H.h)
let hsb2 _ = assert_equal  92 (Colors.S.s)
let hsb3 _ = assert_equal  85 (Colors.Br.b)

let cmyk1 _ = assert_equal  88 (Colors.C.c)
let cmyk2 _ = assert_equal  92 (Colors.M.m)
let cmyk3 _ = assert_equal   0 (Colors.Y.y)
let cmyk4 _ = assert_equal  15 (Colors.K.k)

let suite =
"suite">:::
  [
    "rgb1">:: rgb1;
    "rgb2">:: rgb2;
    "rgb3">:: rgb3;

    "hsb1">:: hsb1;
    "hsb2">:: hsb2;
    "hsb3">:: hsb3;

    "cmyk1">:: cmyk1;
    "cmyk2">:: cmyk2;
    "cmyk3">:: cmyk3;
  ]

let () =
  run_test_tt_main suite

