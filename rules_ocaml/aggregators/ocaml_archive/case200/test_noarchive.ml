let () =
  print_endline "Starting tests";
  Main2.hello() ;

open OUnit2;;

let test1 _ = assert_equal "msg from Easy" (Easy.msg);;
(* let test2 _ = assert_equal "msg from Simple" (Simple.msg);; *)

let suite =
"suite">:::
 ["test1">:: test1 ;
  (* "test2">:: test2 *)
 ]
;;

let () =
  run_test_tt_main suite;
  print_endline "Tests finished"
