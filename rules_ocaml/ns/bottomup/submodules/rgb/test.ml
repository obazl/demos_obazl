open OUnit2

(* The generated ns module 'color.ml' contains alias equations: *)
let test1 _ = assert_equal  32 (RGB.Red.r)
let test2 _ = assert_equal  64 (RGB.Green.g)
let test3 _ = assert_equal 128 (RGB.Blue.b)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
]

let () =
  run_test_tt_main suite

