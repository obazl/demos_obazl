open OUnit2

let test1 test_ctxt = assert_equal "A"   (Foo.A.v)
let test2 test_ctxt = assert_equal "ABC" (Foo.B.v)
(* let test3 test_ctxt = assert_equal "C"   (Foo00__c.v) *)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 (* "test3">:: test3; *)
]
;;

let () =
  run_test_tt_main suite
;;
