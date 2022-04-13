open Ppxlib

let expand ~ctxt alpha =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.estring ~loc (string_of_int alpha)

let alpha_extension =
 Extension.V3.declare
   "alpha"
   Extension.Context.expression
   Ast_pattern.(single_expr_payload (eint __))
   expand

let rule = Ppxlib.Context_free.Rule.extension alpha_extension

let enable =
  Driver.register_transformation
    ~rules:[rule]
    "alpha"
