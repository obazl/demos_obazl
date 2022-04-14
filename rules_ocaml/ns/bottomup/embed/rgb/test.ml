open OUnit2

let test1 _ = assert_equal  32 (Colors.MyRGB.Red.r)
let test2 _ = assert_equal  64 (Colors.MyRGB.Green.g)
let test3 _ = assert_equal 128 (Colors.MyRGB.Blue.b)

(* The Colors namespace depends on the RGB namespace, it just aliases
   MyRGB to RGB. So we can also access RGB without using the
   Colors.MyRGB prefix: *)

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
