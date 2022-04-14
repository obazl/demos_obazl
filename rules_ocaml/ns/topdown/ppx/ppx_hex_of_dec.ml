(* ppx_hex_of_dec - convert decimal to hex *)

open Ppxlib

let expand ~ctxt dec =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let result = (Printf.sprintf "0x%X" dec) in
  Ast_builder.Default.estring ~loc result

let dec_extension =
 Extension.V3.declare
   "hex_of_dec"
   Extension.Context.expression
   Ast_pattern.(single_expr_payload (eint __))
   expand

let rule = Ppxlib.Context_free.Rule.extension dec_extension

let () =
  Driver.register_transformation
    ~rules:[rule]
    "hex_of_dec"
