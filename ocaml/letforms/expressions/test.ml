open OUnit2
open A

(* let test1 _ = assert_equal y 4 *)
(* let test1 _ = assert_equal x () *)

let suite =
"suite">:::
  [
    (* "test1">:: test1; *)
    (* "test2">:: test2; *)
 ]

let () =
  run_test_tt_main suite

