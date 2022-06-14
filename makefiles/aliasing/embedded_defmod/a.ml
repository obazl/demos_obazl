let () = print_endline "Hello from A!"

let msg = "Hello A"

module B = struct
  let () = print_endline "Hello from B!"
  let msg = "Hello B"
end
