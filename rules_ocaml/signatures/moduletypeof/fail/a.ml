(* does not implement 'foo', inherited from module type of B *)
(* so 'make amod' fails with:
File "a.ml", line 1:
Error: The implementation a.ml does not match the interface a.cmi:  ...
       In module A:
       The value `foo' is required but not provided
       File "b.mli", line 4, characters 0-16: Expected declaration
 *)

module A = struct
  type t = string
  let of_string x = x
  let to_string x = x
end

let s1 = A.of_string "foo"

let () = print_endline ("A string: " ^ A.to_string s1)
