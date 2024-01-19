open OUnit2

let test1 _ = assert_equal 255 (A.B.Color.Red.v)
let test2 _ = assert_equal 127 (A.B.Color.Green.v)
let test3 _ = assert_equal 80  (A.B.Color.Blue.v)

let test4 _ = assert_equal 255 (B.Color.Red.v)
let test5 _ = assert_equal 127 (B.Color.Green.v)
let test6 _ = assert_equal 80  (B.Color.Blue.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
 "test4">:: test4;
 "test5">:: test5;
 "test6">:: test6;
]
;;

let () =
  run_test_tt_main suite
;;
