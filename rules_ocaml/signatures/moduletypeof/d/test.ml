module S_id = struct
  type t = string
  let of_string x = x
  let to_string x = x
end

module Username : (module type of String_id) = S_id
module Hostname : module type of String_id = S_id

type session_info = { user: Username.t;
                      host: Hostname.t;
                      (* when_started: Time.t; *)
                    }

let sessions_have_same_user s1 s2 =
  s1.user = s2.user

let s1 = { user = Username.of_string "foo"; host = Hostname.of_string "bar" }
let s2 = { user = Username.of_string "foo"; host = Hostname.of_string "baz" }

let () = print_endline ("mtype: " ^ string_of_bool (sessions_have_same_user s1 s2))
