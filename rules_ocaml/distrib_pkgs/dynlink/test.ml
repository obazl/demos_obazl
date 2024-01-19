open OUnit2

let x = Dynlink.adapt_filename "foo.ml"
let test1 _ = assert_equal "foo.cmxs" x

let f = Dynlink.loadfile "foo"
(* let x = Dynlink.error_message Unsafe_file *)
(* let test2 _ = assert_equal "foomsg" x *)

let suite =
"suite">:::
  [
    "test1">:: test1;
    (* "test2">:: test2; *)
    (* "test3">:: test3; *)
  ]

let () =
  run_test_tt_main suite
