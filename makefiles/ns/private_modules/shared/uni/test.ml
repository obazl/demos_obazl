open OUnit2

let test1 test_ctxt = assert_equal "A"   (Foo.A.v)
let test2 test_ctxt = assert_equal "ABX" (Foo.B.v)
let test3 test_ctxt = assert_equal "C"   (Bar.C.v)
let test4 test_ctxt = assert_equal "CDX" (Bar.D.v)

(* let test5 test_ctxt = assert_equal "X" (Private__.X.v) *)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
 "test4">:: test4;

 (* "test5">:: test5; *)
]
;;

let () =
  run_test_tt_main suite
;;
