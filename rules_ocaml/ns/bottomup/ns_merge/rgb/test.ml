open OUnit2

let test1 _ = assert_equal  32 (MyRGB.Red.r)
let test2 _ = assert_equal  64 (MyRGB.Green.g)
let test3 _ = assert_equal 128 (MyRGB.Blue.b)

(* The MyRGB ns merges all submodules of exogenous RGB ns. Those
   submodules remain accessible via the RGB ns. *)

let test4 _ = assert_equal  32 (RGB.Red.r)
let test5 _ = assert_equal  64 (RGB.Green.g)
let test6 _ = assert_equal 128 (RGB.Blue.b)

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
