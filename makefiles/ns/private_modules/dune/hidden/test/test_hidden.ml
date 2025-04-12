open OUnit2

let test1 _ = assert_equal "A"   (Hidden.A.v)
let test2 _ = assert_equal "ABC" (Hidden.B.v)
let test3 _ = assert_equal "C"   (Hidden.C.v)

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
