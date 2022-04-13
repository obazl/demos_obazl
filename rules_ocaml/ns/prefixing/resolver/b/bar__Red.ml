open OUnit2

let r = 255

let test1a _ = assert_equal 127 (Green.g)
let test1b _ = assert_equal 127 (Bar.Green.g)
let test1c _ = assert_equal 127 (Bar__Green.g)

let test2a  _ = assert_equal  80 (Blue.b)
let test2b  _ = assert_equal  80 (Bar.Blue.b)
let test2c  _ = assert_equal  80 (Bar__Blue.b)

let suite =
"suite">:::
  [
    "test1a">:: test1a;
    "test1b">:: test1b;
    "test1c">:: test1c;

    "test2a">:: test2a;
    "test2b">:: test2b;
    "test2c">:: test2c;
  ]

let () = run_test_tt_main suite

