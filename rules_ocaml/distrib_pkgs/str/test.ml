open OUnit2

let msg = let r = Str.regexp {|hello \([A-Za-z]+\)|} in
    Str.replace_first r {|\1|} "hello world"

let test1 _ = assert_equal "world" msg

let suite =
"suite">:::
 ["test1">:: test1]

let () =
  run_test_tt_main suite
