let () =
  if (C.Types.foo_version <> 1) then
    failwith "foo only works with libfoo version 1";

  match C.Functions.foo_init () with
  | 0 ->
    C.Functions.foo_fnubar "fnubar!";
    C.Functions.foo_exit ()
  | err_code ->
    Printf.eprintf "foo_init failed: %d" err_code;
;;
