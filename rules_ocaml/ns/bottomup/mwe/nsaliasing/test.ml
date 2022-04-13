open OUnit2

let test1 _ = assert_equal 255 (RGB.Color.Red.r)
let test2 _ = assert_equal 127 (RGB.Color.Green.g)
let test3 _ = assert_equal 80  (RGB.Color.Blue.b)

(* The RGB namespace contains the Color namespace, it just aliases
   Color to Color. So we can also access Color without using the RGB
   prefix: *)

let test4 _ = assert_equal 255 (Color.Red.r)
let test5 _ = assert_equal 127 (Color.Green.g)
let test6 _ = assert_equal 80  (Color.Blue.b)


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
