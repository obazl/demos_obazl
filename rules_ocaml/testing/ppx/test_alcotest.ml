let test_hello () =
  Alcotest.(check string) "same string" "Hello" (Hello.msg)

(* Run it *)
let () =
  Alcotest.run "ocaml_test"
    [
      ( "hello",
        [
          Alcotest.test_case "Hello" `Quick test_hello;
        ] );
    ]
