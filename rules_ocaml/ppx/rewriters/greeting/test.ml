open OUnit2

(* NOTE: this module doe not depend directly or indirectly on
   ppx_greeting.ml, but it does "depend" on being transformed by a PPX
   that contains Ppx_greeting. *)

let test1 test_ctxt = assert_equal "Hello, world!" [%greeting "world!"]

let suite =
"suite">:::
[
  "test1">:: test1;
]

let () =
  run_test_tt_main suite
