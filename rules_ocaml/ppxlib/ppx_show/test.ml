open OUnit2

(* let () = print_endline "TESTING" *)

let test1 _ = assert_equal "Show.Test.A" (Show.Test.show A)

let test2 _ = assert_equal "1L" (Format.asprintf "@[%a@]" [%show: int64] 1L)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2
  ]

let () =
  run_test_tt_main suite
