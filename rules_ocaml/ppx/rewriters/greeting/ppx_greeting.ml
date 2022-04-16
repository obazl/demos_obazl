(* ppx_greeting - a simple ppxlib rewriter *)
(* see https://github.com/ocaml-ppx/ppxlib/blob/master/examples/simple-extension-rewriter *)

open Ppxlib

let expand ~ctxt greeting =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.estring ~loc ("Hello, " ^ greeting)

let greeting_extension =
 Extension.V3.declare
   "greeting"
   Extension.Context.expression
   Ast_pattern.(single_expr_payload (estring __))
   expand

let rule = Ppxlib.Context_free.Rule.extension greeting_extension

let () =
  Driver.register_transformation
    ~rules:[rule]
    "greeting"
