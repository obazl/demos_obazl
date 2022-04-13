open Ppxlib

let expand ~ctxt blue =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.estring ~loc (string_of_int blue)

let blue_extension =
 Extension.V3.declare
   "blue"
   Extension.Context.expression
   Ast_pattern.(single_expr_payload (eint __))
   expand

let rule = Ppxlib.Context_free.Rule.extension blue_extension

let enable =
  Driver.register_transformation
    ~rules:[rule]
    "blue"
