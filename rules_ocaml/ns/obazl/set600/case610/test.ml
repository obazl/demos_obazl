open OUnit2

let test1 _ = assert_equal 255 (Alpha.Red.v)
let test2 _ = assert_equal 127 (Alpha.Beta.Green.v)
let test3 _ = assert_equal 80  (Alpha.Beta.Gamma.Blue.v)

(* let test5 _ = assert_equal 127 (Beta.Green.v)
 * let test6 _ = assert_equal 80  (Beta.Gamma.Blue.v) *)

(* let test7 _ = assert_equal 255 (Gamma.Red.v)
 * let test8 _ = assert_equal 127 (Gamma.Green.v) *)
(* let test9 _ = assert_equal 80  (Gamma.Blue.v) *)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;

  (* "test4">:: test4; *)
  (* "test5">:: test5;
   * "test6">:: test6; *)

  (* "test7">:: test7;
   * "test8">:: test8; *)
  (* "test9">:: test9; *)
]
;;

let () =
  run_test_tt_main suite
;;
