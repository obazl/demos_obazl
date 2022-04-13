(* open Core *)

(* NOOB ALERT! We're using Jane Street libs, so we need to use their
   operators. Without the "String." the following will not compile. *)
let%test "foo" = String.("HelloLib" = Hello.msg)


(* let%expect_test "addition" =
 *   printf "%d" (1 + 2);
 *   [%expect {| 4 |}] *)


(* Ppx_inline_test_lib.Runtime.exit () *)
