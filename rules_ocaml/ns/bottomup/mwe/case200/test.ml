open OUnit2
open Hello

let test1 _ = assert_equal "G'day!" (Australian.msg)
let test2 _ = assert_equal "Hello!" (English.msg)
let test3 _ = assert_equal "Salut!" (French.msg)
let test4 _ = assert_equal "Hola!" (Spanish.msg)

let suite =
  "suite">::: [
    "test1">:: test1 ;
    "test2">:: test2 ;
    "test3">:: test3 ;
    "test4">:: test4 ;
]

let () =
  run_test_tt_main suite
