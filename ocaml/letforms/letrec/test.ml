open OUnit2
open Data
open Functions

(* let test0 _ = assert_equal ones [1; <cycle>]; *)
let test1 _ = assert_equal x1 1
let test2 _ = assert_equal x99 1
let test3 _ = assert_equal y1 1
let test4 _ = assert_equal y2 2
let test5 _ = assert_equal y3 1
let test6 _ = assert_equal y4 2
let test7 _ = assert_equal (f 1) 3

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
    "test4">:: test4;
    "test5">:: test5;
    "test6">:: test6;
    "test7">:: test7;
 ]

let () =
  run_test_tt_main suite

