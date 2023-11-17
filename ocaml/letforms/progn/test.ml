open OUnit2
open A

(* let test1 _ = assert_equal a 0 *)
let test2 _ = assert_equal (b 2) 4

let suite =
"suite">:::
  [
    (* "test1">:: test1; *)
    "test2">:: test2;
 ]

let () =
  run_test_tt_main suite

