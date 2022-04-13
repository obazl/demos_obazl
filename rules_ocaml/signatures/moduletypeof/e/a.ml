module type A_t = sig
  open B
  include B

  open C
  include C

  val amsg : string
end

module A : A_t = struct
  let amsg = "hello a"
  let bmsg = "hello b"
  let cmsg = "hello c"
end

