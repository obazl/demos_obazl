open OUnit2

(* The generated ns module 'color.ml' contains alias equations and serves as a resolver: *)
let test1 _ = assert_equal 255 (Color.Red.v)
let test2 _ = assert_equal 127 (Color.Green.v)
let test3 _ = assert_equal 80  (Color.Blue.v)

(* Since this demo uses an ns module, these will not resolve: *)
(* let test4 _ = assert_equal 255 (Red.v)
 * let test5 _ = assert_equal 127 (Green.v)
 * let test6 _ = assert_equal 80  (Blue.v) *)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;

 (* "test4">:: test4;
  * "test5">:: test5;
  * "test6">:: test6; *)
]
;;

let () =
  run_test_tt_main suite
;;
