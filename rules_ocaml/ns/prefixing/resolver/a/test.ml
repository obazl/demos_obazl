open OUnit2

(* demonstrates that submodules may be accessed directly via their
   filenames or indirectly via namespacing *)

let test1a _ = assert_equal 255 (Foo.Red.r)
let test1b _ = assert_equal 255 (Foo__Red.r)

let test2a _ = assert_equal 127 (Foo.Green.g)
let test2b _ = assert_equal 127 (Foo__Green.g)

let test3a _ = assert_equal 80  (Foo.Blue.b)
let test3b _ = assert_equal 80  (Foo__Blue.b)

let suite =
"suite">:::
  [
    "test1a">:: test1a;
    "test1b">:: test1b;
    "test2a">:: test2a;
    "test2b">:: test2b;
    "test3a">:: test3a;
    "test3b">:: test3b;
  ]

let () = run_test_tt_main suite
