open OUnit2

(* let test1 _ = assert_equal "Hello Red" (A.red) *)
let test2 _ = assert_equal "Hello Green" (A.green)
(* let test3 _ = assert_equal "Hello Blue" (A.blue) *)


let suite =
"suite">:::
  [
    (* "test1">:: test1; *)
    "test2">:: test2;
    (* "test3">:: test3 *)
  ]

let () =
  run_test_tt_main suite

