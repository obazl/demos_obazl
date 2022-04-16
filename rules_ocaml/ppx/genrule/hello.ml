open Core ;;                    (* for Sexp *)

let msg =
  Sexp.to_string_hum [%sexp ([3;4;5] : int list)]
;;


