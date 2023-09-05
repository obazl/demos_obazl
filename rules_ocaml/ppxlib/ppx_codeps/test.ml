open OUnit2

let test1 _ = assert_equal "((1 one)(2 two))" (Hello.x)

(* the %derive extensions here (from @ppx_deriving//lib/ord and
   @ppx_deriving//lib/show) induce a compile-time dependency on
   @ppx_sexp_conv//lib/runtime-lib *)
let test_with_ppx _ =
  let sort = List.sort [%derive.ord: int * int] in
  assert_equal ~printer:[%derive.show: (int * int) list]
               [(1,1);(2,0);(3,5)] (sort [(2,0);(3,5);(1,1)])

let test_without_ppx _ =
  assert_equal [(1,1);(2,0);(3,5)] [(1,1);(2,0);(3,5)]

let suite =
"suite">:::
  [
    "test0">:: test1 ;
    "test1">:: test_with_ppx ;
    "test2">:: test_without_ppx
  ]
;;

let () =
  run_test_tt_main suite
;;
