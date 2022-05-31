(* NOOB ALERT! We're using Jane Street libs, so we need to use their
   operators. Without the "String." the following will not compile. *)
let msg = "Hello"

let inc x = x + 1

let x = 7

(* test should fail, but in this case we pass the wrong tag so this
   test is never executed. *)
let%test _ = 9 = inc x
