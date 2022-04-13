val amsg : string

(* NOTE: these could contain anything, since the compile command can
   'open' any sigfile that contains declarations for these module
   types. *)
include B
include C
