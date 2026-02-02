
(* The type of tokens. *)

type token = 
  | SEMI
  | RPAREN
  | NULL
  | LPAREN
  | LET
  | ID of (string)
  | EQUAL
  | EOF
  | DEREF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
