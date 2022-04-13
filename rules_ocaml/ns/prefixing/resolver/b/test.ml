open OUnit2

(* demonstrates that submodules may be accessed directly via their
   filenames or indirectly via namespacing *)

let test1a _ = assert_equal 255 (Bar.Red.r)
let test1b _ = assert_equal 255 (Bar__Red.r)
let test2a _ = assert_equal 127 (Bar.Green.g)
let test2b _ = assert_equal 127 (Bar__Green.g)
let test3a _ = assert_equal 80  (Bar.Blue.b)
let test3b _ = assert_equal 80  (Bar__Blue.b)

let test4a _ = assert_equal 255 (Baz.Red.r)
let test4b _ = assert_equal 255 (Baz__Red.r)
let test5a _ = assert_equal 127 (Baz.Green.g)
let test5b _ = assert_equal 127 (Baz__Green.g)
let test6a _ = assert_equal 80  (Baz.Blue.b)
let test6b _ = assert_equal 80  (Baz__Blue.b)

let suite =
"suite">:::
  [
    "test1a">:: test1a;
    "test1b">:: test1b;
    "test2a">:: test2a;
    "test2b">:: test2b;
    "test3a">:: test3a;
    "test3b">:: test3b;

    "test4a">:: test4a;
    "test4b">:: test4b;
    "test5a">:: test5a;
    "test5b">:: test5b;
    "test6a">:: test6a;
    "test6b">:: test6b;
 ]

let () = run_test_tt_main suite
