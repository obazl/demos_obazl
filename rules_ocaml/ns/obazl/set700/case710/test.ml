open OUnit2

let test1 _ = assert_equal 255 (Color.Red.v)
let test1a _ = assert_equal  5 (Subred.v)
let test2 _ = assert_equal 127 (Color.Green.v)
let test3 _ = assert_equal 80  (Color.Blue.v)

let test4 _ = assert_equal 255 (Couleur.Rouge.v)
let test5 _ = assert_equal 127 (Couleur.Vert.v)
let test6 _ = assert_equal 80  (Couleur.Bleu.v)

let suite =
"suite">:::
[
  "test1">:: test1;
  "test1a">:: test1a;
  "test2">:: test2;
  "test3">:: test3;

 "test4">:: test4;
 "test5">:: test5;
 "test6">:: test6;
]

let () =
  run_test_tt_main suite

