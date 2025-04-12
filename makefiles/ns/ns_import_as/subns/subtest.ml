open OUnit2

let test1 test_ctxt = assert_equal "A" (Greek.Alpha.v)
let test2 test_ctxt = assert_equal "B" (Greek.Beta.v)
let test3 test_ctxt = assert_equal "C"  (Greek.Gamma.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
]
;;

let () =
  run_test_tt_main suite
;;
