let msg_a = "The answer from A is: 7"

(* Module B is a direct dep, mediated by mylib, which is expressed in
   the build program. *)
let msg_b = ("The answer from B is: " ^ string_of_int(B.answer))

(* module C is an indirect dep, we're not supposed to reference it. It
   should be possible to change or remove C without affecting clients
   of B. But since we can refer to C, we do so. Now changes to C may
   break A. *)
let msg_c = ("The answer from C is: " ^ string_of_int(C.answer))

