(* This file is designated as the 'main' module of an ns library whose
   submodules are exogenous - meaning they are in a different
   namespace. So the aliasing equations must refer to the namespaced
   names. *)

module Red   = Demos_Namespaces_Obazl_Set100_Case110__Red
module Green = Demos_Namespaces_Obazl_Set100_Case110__Green
module Blue  = Demos_Namespaces_Obazl_Set100_Case110__Blue

let () =
  print_endline ("Hello from user-supplied module Color.")
