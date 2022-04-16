open OUnit2

type t =
  { a : string
  ; b : int
  }
  [@@deriving accessors]

let x : t = {a = "hello"; b = 7}

let test1 _ = assert_equal "hello" (a x)
let test2 _ = assert_equal "7" (string_of_int (b x))
let test3 _ = assert_equal "hello 7" ( (a x) ^ " " ^ (string_of_int (b x)) )

let suite =
"suite">:::
[
  "test1">:: test1;
  "test2">:: test2;
  "test3">:: test3;
]

let () =
  run_test_tt_main suite
