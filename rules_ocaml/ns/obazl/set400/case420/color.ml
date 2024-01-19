(* This file is designated as the 'main' module of an ns library whose
   submodules are exogenous - meaning they are in a different
   namespace (Bazel package). *)

module Red   = Demo__Red
module Green = Demo__Green
module Blue  = Demo__Blue

let () = print_endline ("Hello from user-supplied main module Color.")
