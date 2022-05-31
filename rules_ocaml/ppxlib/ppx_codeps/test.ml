open OUnit2

let test_list_sort _ =
  let sort = List.sort [%derive.ord: int * int] in
  assert_equal ~printer:[%derive.show: (int * int) list]
               [(1,1);(2,0);(3,5)] (sort [(2,0);(3,5);(1,1)])

let suite =
"suite">:::
 ["test1">:: test_list_sort]
;;

let () =
  run_test_tt_main suite
;;
