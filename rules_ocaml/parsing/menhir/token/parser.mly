%{
open Ast
%}

%token <string> INT_CONSTANT
%token EOS

/* Types */

%type <Ast.ast> ast

%start ast

%%

ast:
  | INT_CONSTANT EOS { IntConstant $1 }
  ;
