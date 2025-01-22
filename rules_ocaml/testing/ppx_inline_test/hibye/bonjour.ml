let inc x = x + 1

let%test "test1" = 3 = inc 2

let x = 7

let%test "test2" = 8 = inc x
let%test "test3" = 2 = inc 1
