%{
open Ast
%}

%token <string> T_FOO

/* Types */

%type <Ast.ast> ast

%start ast

%%

ast:
  | T_FOO { IntConstant $1 }
  ;
