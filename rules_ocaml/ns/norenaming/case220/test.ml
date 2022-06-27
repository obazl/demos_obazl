open OUnit2

let test1 test_ctxt = assert_equal 255 (Color.Red.v)
let test2 test_ctxt = assert_equal 127 (Color.Green.v)
let test3 test_ctxt = assert_equal 80  (Color.Blue.v)

(* exported by custom resolver *)
let test4 test_ctxt = assert_equal 0.5  (Color.Alpha.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
 "test4">:: test4;
]

let () =
  run_test_tt_main suite
