(* https://stackoverflow.com/questions/47920327/why-use-module-type-in-ocaml *)

(* open Core.Std *)

(* module type ID = sig *)
(*  type t *)
(*   val of_string : string -> t *)
(*  val to_string : t -> string *)
(* end *)

(* can't put module decl in same file as defn? *)
(* not separately; but we can declare and define in one go: *)
(* module String_id : sig *)
(*   type t *)
(*   val of_string : string -> t *)
(*   val to_string : t -> string *)
(* end *)
(* = *)
module S_id = struct
  type t = string
  let of_string x = x
  let to_string x = x
end

(* cannot use file-defined module as module type *)
(* module Username : String_id = S_id *)
(* Error: Unbound module type String_id *)
(* Hint: There is a module named String_id, but modules are not module types *)

(* but we can use 'module type of' to recover module type *)
module Username : (module type of String_id) = S_id
module Hostname : module type of String_id = S_id

(* module Username = String_id *)
(* module Hostname = String_id *)

type session_info = { user: Username.t;
                      host: Hostname.t;
                      (* when_started: Time.t; *)
                    }

let sessions_have_same_user s1 s2 =
  s1.user = s2.user
