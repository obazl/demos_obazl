open Ppxlib

let expand ~ctxt green =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.estring ~loc (string_of_int green)

let green_extension =
 Extension.V3.declare
   "green"
   Extension.Context.expression
   Ast_pattern.(single_expr_payload (eint __))
   expand

let rule = Ppxlib.Context_free.Rule.extension green_extension

let () =
  Driver.register_transformation
    ~rules:[rule]
    "green"
