%{
open Ast
%}

%token <string> ID
%token LET EQUAL NULL DEREF SEMI LPAREN RPAREN EOF
%start <Ast.program> prog
%%

prog:
  | EOF { [] }
  | s = stmt; p = prog { s :: p }

stmt:
  | LET; x = ID; EQUAL; e = expr; SEMI { Assign(x, e) }
  | DEREF; LPAREN; x = ID; RPAREN; SEMI { Deref(x) }

expr:
  | x = ID   { Var x }
  | NULL     { Null }
