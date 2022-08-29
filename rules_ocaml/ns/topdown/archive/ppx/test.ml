open OUnit2

let test1 _ = assert_equal "0xFF" (Color.Red.v)
let test2 _ = assert_equal "0x7F" (Color.Green.v) (* 127 *)
let test3 _ = assert_equal "0x50" (Color.Blue.v)  (* 80 *)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
]

let () =
  run_test_tt_main suite

