{}
let start_letter  = ['a'-'z' 'A'-'Z' '_']

rule lexer = parse
  | "{"         { T_lbrace }
