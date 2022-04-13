open OUnit2

let test1 _ = assert_equal "hello" A.extra
let test2 _ = assert_equal 3 (A.of_string "3")
let test3 _ = assert_equal "3" (A.to_string 3)


let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
  ]

let () =
  run_test_tt_main suite

