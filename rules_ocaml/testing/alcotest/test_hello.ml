let test_hello () =
  Alcotest.(check string) "same string" "Hello" (Hello.msg)

(* Run it *)
let () =
  Alcotest.run "OBazl alcotest"
    [
      ( "hello",
        [
          Alcotest.test_case "Hello test" `Quick test_hello;
        ] );
    ]
