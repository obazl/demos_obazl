(* Since our build rule enrolled nslib "color" in an ns_env, it gets prefixed. *)
(* The following breaks: *)
module Color = Color

(* But this works: *)
(* module Color = Demos_Namespaces_Obazl_Footgunnery_Case20_Src__Color *)

(* Alternatively, remove the alias equation and 'include' this file. *)
(* The names used to implement namespacing do not really matter, so we can let OBazl generate them. *)

let () = print_endline ("Hello from user-provided module B.  Red: " ^ string_of_int Color.Red.v)
