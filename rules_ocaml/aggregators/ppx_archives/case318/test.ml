open OUnit2

let test1 _ = assert_equal "255" [%red   255]
let test2 _ = assert_equal "127" [%green 127]
let test3 _ = assert_equal "80"  [%blue   80]

(* let test4 _ = assert_equal "255" [%alpha   255]
 * let test5 _ = assert_equal "127" [%beta    127]
 * let test6 _ = assert_equal "80"  [%gamma    80] *)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;

  (* "test4">:: test4;
   * "test5">:: test5;
   * "test6">:: test6; *)
]

let () =
  run_test_tt_main suite

