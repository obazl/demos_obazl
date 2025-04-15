open OUnit2

let test1 test_ctxt = assert_equal "A"   (Foo.A.v)
let test2 test_ctxt = assert_equal "ABX" (Foo.B.v)
let test3 test_ctxt = assert_equal "C"   (Bar.C.v)
let test4 test_ctxt = assert_equal "CDX" (Bar.D.v)

(* test5 will only work if Private__x.cmi is NOT removed *)
(* If it IS removed, we get a compilation error:

File "test.ml", line 15, characters 40-51:
15 | let test5 test_ctxt = assert_equal "X" (Private.X.v)
                                             ^^^^^^^^^^^
Error: The module Private.X is an alias for module Private__x, which is missing

But note that the error message is misleading: it is not the
"module" that is missing, but its interface file Private__x.cmi.
 *)
(* let test5 test_ctxt = assert_equal "X" (Private.X.v) *)

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
