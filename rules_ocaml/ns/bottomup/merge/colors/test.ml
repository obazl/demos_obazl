open OUnit2

(* The Colors ns merges the RGB, HSB, and CMYK nss, so their
   submodules are directly accessible within Color: *)

let rgb1 _ = assert_equal  27 (Colors.Red.r)
let rgb2 _ = assert_equal  16 (Colors.Green.g)
let rgb3 _ = assert_equal 218 (Colors.Blue.b)

let hsb1 _ = assert_equal 243 (Colors.Hue.h)
let hsb2 _ = assert_equal  92 (Colors.Saturation.s)
let hsb3 _ = assert_equal  85 (Colors.Brightness.b)

let cmyk1 _ = assert_equal  88 (Colors.Cyan.c)
let cmyk2 _ = assert_equal  92 (Colors.Magenta.m)
let cmyk3 _ = assert_equal   0 (Colors.Yellow.y)
let cmyk4 _ = assert_equal  15 (Colors.Key.k)

(* But they remain accessible under their original nss, outside of the
   Color ns: *)
let xrgb1 _ = assert_equal  27 (RGB.Red.r)
let xrgb2 _ = assert_equal  16 (RGB.Green.g)
let xrgb3 _ = assert_equal 218 (RGB.Blue.b)

let xhsb1 _ = assert_equal 243 (HSB.Hue.h)
let xhsb2 _ = assert_equal  92 (HSB.Saturation.s)
let xhsb3 _ = assert_equal  85 (HSB.Brightness.b)

let xcmyk1 _ = assert_equal  88 (CMYK.Cyan.c)
let xcmyk2 _ = assert_equal  92 (CMYK.Magenta.m)
let xcmyk3 _ = assert_equal   0 (CMYK.Yellow.y)
let xcmyk4 _ = assert_equal  15 (CMYK.Key.k)

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
    "cmyk4">:: cmyk4;

    "xrgb1">:: xrgb1;
    "xrgb2">:: xrgb2;
    "xrgb3">:: xrgb3;

    "xhsb1">:: xhsb1;
    "xhsb2">:: xhsb2;
    "xhsb3">:: xhsb3;

    "xcmyk1">:: xcmyk1;
    "xcmyk2">:: xcmyk2;
    "xcmyk3">:: xcmyk3;
    "xcmyk4">:: xcmyk4;
  ]

let () =
  run_test_tt_main suite

