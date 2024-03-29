/* file: rpcalc.mly */
/* Reverse polish notation calculator. */

%{
  (* header (ocaml-cstyle comments) *)

open Printf
%}

/* declarations - c-style comments */

%token <float> NUM
%token PLUS MINUS MULTIPLY DIVIDE CARET UMINUS
%token NEWLINE

%start input
%type <unit> input

%%

  /* rules (c-style comments) */

input:    /* empty */		{ }
        | input line		{ }
;

line:     NEWLINE		{ }
        | exp NEWLINE		{ printf "\t%.10g\n" $1; flush stdout }
;

exp:      NUM			{ $1 }
        | exp exp PLUS		{ $1 +. $2 }
        | exp exp MINUS		{ $1 -. $2 }
        | exp exp MULTIPLY		{ $1 *. $2 }
        | exp exp DIVIDE		{ $1 /. $2 }
      	/* Exponentiation */
        | exp exp CARET		{ $1 ** $2 }
      	/* Unary minus    */
        | exp UMINUS		{ -. $1 }
;
%%

  (* trailer (ocaml-cstyle comments) *)
