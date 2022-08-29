open OUnit2

let test7 _ = assert_equal 24 (Main.green_carats)
let test8 _ = assert_equal 24 (Main.vert_carats)

let suite =
"suite">:::
[
  "test7">:: test7;
  "test8">:: test8;
]


let () =
  run_test_tt_main suite

