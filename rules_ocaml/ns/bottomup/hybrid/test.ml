open OUnit2

(* elective submodules *)
let grk1 _ = assert_equal 255 (Greek.Alpha.v)
let grk2 _ = assert_equal 127 (Greek.Beta.v)
let grk3 _ = assert_equal 80  (Greek.Gamma.v)

(* fused exogenous NON-namespaced submodules *)
let rgb1 _ = assert_equal 255 (Greek.R.r)
let rgb2 _ = assert_equal 127 (Greek.G.g)
let rgb3 _ = assert_equal 80  (Greek.B.b)

(* fused exogenous namespaced submodules *)
let rgb4 _ = assert_equal  32 (Greek.Red.r)
let rgb5 _ = assert_equal  64 (Greek.Green.g)
let rgb6 _ = assert_equal 128 (Greek.Blue.b)

(* imported ns CMYK *)
let cmyk1 _ = assert_equal 88 (Greek.CMYK.Cyan.c)
let cmyk2 _ = assert_equal 92 (Greek.CMYK.Magenta.m)
let cmyk3 _ = assert_equal  0 (Greek.CMYK.Yellow.y)
let cmyk4 _ = assert_equal 15 (Greek.CMYK.Key.k)

let suite =
"suite">:::
[
  "grk1">:: grk1;
  "grk2">:: grk2;
  "grk3">:: grk3;

  "rgb1">:: rgb1;
  "rgb2">:: rgb2;
  "rgb3">:: rgb3;

  "rgb4">:: rgb4;
  "rgb5">:: rgb5;
  "rgb6">:: rgb6;

  "cmyk1">:: cmyk1;
  "cmyk2">:: cmyk2;
  "cmyk3">:: cmyk3;
  "cmyk4">:: cmyk4;
]

let () =
  run_test_tt_main suite

