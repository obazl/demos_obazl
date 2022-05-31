(* compile with '-inline-test-lib main' *)

let%test "main test1" = 3 = Hello.inc 2
let%test "main test2" = 1 = Goodbye.dec 2
