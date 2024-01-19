open OUnit2

let test1 _ = assert_equal "Hello!" (Greetings.Hello.msg)
let test2 _ = assert_equal "Goodbye!" (Greetings.Goodbye.msg)

let suite =
  "suite">::: [
    "test1">:: test1 ;
    "test2">:: test2 ;
]

let () =
  run_test_tt_main suite
