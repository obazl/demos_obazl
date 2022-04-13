let () = print_endline ("Hello from resolver module: Foo")

module Red   = Foo__Red
module Green = Foo__Green
module Blue  = Foo__Blue

let () = print_endline ("Goodbye from resolver module: Foo")
