let () =
  if (Foo.FooTypes.foo_version <> 1) then
    failwith "foo only works with libfoo version 1";

  match Foo.FooFunctions.foo_init () with
  | 0 ->
    Foo.FooFunctions.foo_fnubar "fnubar!";
    Foo.FooFunctions.foo_exit ()
  | err_code ->
    Printf.eprintf "foo_init failed: %d" err_code;
;;
