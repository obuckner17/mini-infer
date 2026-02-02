{
open Parser
}

let white = [' ' '\t' '\n']+
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule read =
  parse
  | white    { read lexbuf }
  | "let"    { LET }
  | "="      { EQUAL }
  | "null"   { NULL }
  | "deref"  { DEREF }
  | ";"      { SEMI }
  | "("      { LPAREN }
  | ")"      { RPAREN }
  | id as s  { ID s }
  | eof      { EOF }
