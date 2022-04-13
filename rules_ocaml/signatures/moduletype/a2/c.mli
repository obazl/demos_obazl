module type C = sig
  val cmsg : string
  (* to prove that this sig is used uncomment the following and he build will fail. *)
  (* val cextra: string *)
end
