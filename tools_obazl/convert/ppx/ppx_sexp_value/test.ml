open OUnit2

let test1 _ = assert_equal "(3 4 5)" (Hello.hello_sexp)

let suite =
"suite">:::
 ["test1">:: test1]

let () =
  run_test_tt_main suite
