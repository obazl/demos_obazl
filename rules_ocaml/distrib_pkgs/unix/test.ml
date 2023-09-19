open OUnit2

let _ = Unix.putenv "FOO" "99"
let foo = Unix.getenv "FOO"

let test1 _ = assert_equal foo "99"

let suite =
"suite">:::
  [
    "test1">:: test1;
    (* "test2">:: test2; *)
    (* "test3">:: test3; *)
  ]

let () =
  run_test_tt_main suite
