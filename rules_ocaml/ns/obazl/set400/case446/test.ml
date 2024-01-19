open OUnit2

let test1 _ = assert_equal 255 (Main.Color.Red.v)
let test2 _ = assert_equal 127 (Main.Color.Green.v)
let test3 _ = assert_equal 80  (Main.Color.Blue.v)
let test4 _ = assert_equal 1   (Main.alpha)

(* by default nslib naming is not transitive, so you can also access the
   nslib submodule directly *)
let test5 _ = assert_equal 255 (Color.Red.v)
let test6 _ = assert_equal 127 (Color.Green.v)
let test7 _ = assert_equal 80  (Color.Blue.v)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
  "test4">:: test4;

  "test5">:: test5;
  "test6">:: test6;
  "test7">:: test7;
]

let () =
  run_test_tt_main suite
