open OUnit2

let test1 _ = assert_equal 255 (Main.red)
let test2 _ = assert_equal 127 (Main.green)
let test3 _ = assert_equal 80  (Main.blue)

let test4 _ = assert_equal 255 (Main.rouge)
let test5 _ = assert_equal 127 (Main.vert)
let test6 _ = assert_equal 80  (Main.bleu)

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

