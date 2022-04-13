(* 'open B' does not import anything, it just exposes the content of B *)
(* 'include B' will be replaced by the content of B *)
(* 'include' will not work without 'open', either here on on the cmd line. *)
(* it follows that 'open B' also exposes the symbol 'B'. *)

(* IOW, 'open B' adds B to the environment; 'include B' adds it to the
   program. *)

open B
include B

open C
include C

val amsg : string

