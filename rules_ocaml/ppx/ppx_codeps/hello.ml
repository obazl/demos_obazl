(* the ppx transformer injects code that depends on these two libs.
   common practice is to open them here in the source file, but for
   demo purposes we use `-open` command-line options instead. *)
(* open Sexplib
 * open Sexplib.Std *)

type int_pair = (int * int) [@@deriving sexp] ;;

let x = [%sexp_of: (int * string) list] [1,"one"; 2,"two"] |> Sexp.to_string ;;

