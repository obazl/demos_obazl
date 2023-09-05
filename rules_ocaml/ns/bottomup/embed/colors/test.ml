open OUnit2

let test1 _ = assert_equal  27 (Colors.Foo.Red.r)
let test2 _ = assert_equal  16 (Colors.Foo.Green.g)
let test3 _ = assert_equal 218 (Colors.Foo.Blue.b)

let hsb1 _ = assert_equal 243 (Colors.Bar.Hue.h)
let hsb2 _ = assert_equal  92 (Colors.Bar.Saturation.s)
let hsb3 _ = assert_equal  85 (Colors.Bar.Brightness.b)

let cmyk1 _ = assert_equal 88 (Colors.Baz.Cyan.c)
let cmyk2 _ = assert_equal 92 (Colors.Baz.Magenta.m)
let cmyk3 _ = assert_equal  0 (Colors.Baz.Yellow.y)
let cmyk4 _ = assert_equal 15 (Colors .Baz.Key.k)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;

    "hsb1">:: hsb1;
    "hsb2">:: hsb2;
    "hsb3">:: hsb3;

    "cmyk1">:: cmyk1;
    "cmyk2">:: cmyk2;
    "cmyk3">:: cmyk3;
  ]

let () =
  run_test_tt_main suite

