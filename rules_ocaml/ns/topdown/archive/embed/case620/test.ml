open OUnit2

let test1 _ = assert_equal 255 (Color.Rgb.Red.v)
let test2 _ = assert_equal 127 (Color.Rgb.Green.v)
let test3 _ = assert_equal 80  (Color.Rgb.Blue.v)

let test4 _ = assert_equal 37 (Color.Cmy.Cyan.v)
let test5 _ = assert_equal 143 (Color.Cmy.Magenta.v)
let test6 _ = assert_equal 201  (Color.Cmy.Yellow.v)

let suite =
"suite">:::
["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;

 "test4">:: test4;
 "test5">:: test5;
 "test6">:: test6;
]
;;

let () =
  run_test_tt_main suite
;;
