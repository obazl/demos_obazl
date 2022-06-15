open OUnit2

let test1 _ = assert_equal "Howdy, world" (Greeting.hi)
let test2 _ = assert_equal "Adieu, world" (Greeting.bye)

let suite =
"suite">:::
 ["test1">:: test1;
 "test1">:: test1]

let () =
  run_test_tt_main suite
