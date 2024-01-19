open OUnit2

let test1 _ = assert_equal "msg B" (A.msg)
let test2 _ = assert_equal "msga" (A.msga)
(* let test3 _ = assert_equal "msg B" (A.msg) *)
let test4 _ = assert_equal "msgb" (A.msgb)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    (* "test3">:: test3; *)
    "test4">:: test4;
  ]

let () =
  run_test_tt_main suite

