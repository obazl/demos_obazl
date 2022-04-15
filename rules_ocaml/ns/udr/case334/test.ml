open OUnit2

let test1 test_ctxt = assert_equal 255 (Alpha.Red.v)
let test2 test_ctxt = assert_equal 127 (Alpha.Green.v)
let test3 test_ctxt = assert_equal 80  (Alpha.Blue.v)

let test4 test_ctxt = assert_equal 255 (Alpha.Beta.Red.v)
(* let test5 test_ctxt = assert_equal 127 (Beta.Green.v)
 * let test6 test_ctxt = assert_equal 80  (Beta.Blue.v) *)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;

  "test4">:: test4;
  (* "test5">:: test5;
   * "test6">:: test6; *)
]

let () =
  run_test_tt_main suite
