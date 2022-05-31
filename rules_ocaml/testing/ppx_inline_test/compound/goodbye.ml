(* compile with '-inline-test-lib goodbye' *)

let dec x = x - 1

let%test "goodbye test1" = 3 = dec 4

let x = 7

let%test "goodbye test2" = 6 = dec x
let%test "goodbye test3" = 0 = dec 1
