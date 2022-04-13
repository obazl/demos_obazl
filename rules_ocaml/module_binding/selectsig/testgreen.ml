open OUnit2

(* let test1 test_ctxt = assert_equal "Hello Red" (A.red) *)
let test2 test_ctxt = assert_equal "Hello Green" (A.green)
(* let test3 test_ctxt = assert_equal "Hello Blue" (A.blue) *)


let suite =
"suite">:::
  [
    (* "test1">:: test1; *)
    "test2">:: test2;
    (* "test3">:: test3 *)
  ]

let () =
  run_test_tt_main suite

