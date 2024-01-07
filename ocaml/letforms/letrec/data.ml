(* let rec  *)

(* coinduction: https://www.cs.cornell.edu/~kozen/Papers/CoCaml.pdf *)

(* infinite lists *)
let rec ones = 1 :: ones;;
(* val ones : int list = [1; <cycle>] *)
(* now ones == [1; 1; 1; ...]  *)
(*
# List.hd ones ;;
- : int = 1
# List.tl ones ;;
- : int list = [1; <cycle>]
# List.nth ones 1234 ;;
- : int = 1
# List.nth ones 123456789 ;;
- : int = 1   (* takes a little longer to compute *)
# List.nth ones 123456789000 ;; (* takes a very long time *)
 *)
let x1 = List.nth ones 0        (* 1 *)
let x99 = List.nth ones 99      (* 1 *)

let rec alt = 1 :: 2 :: alt ;;
(* val alt : int list = [1; 2; <cycle>] *)
(* now alt == [1; 2; 1; 2; ...]  *)
let y1 = List.nth alt 0         (* 1 *)
let y2 = List.nth alt 1         (* 2 *)
let y3 = List.nth alt 2         (* 1 *)
let y4 = List.nth alt 3         (* 2 *)
