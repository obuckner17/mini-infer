type expression =
  | Var of string
  | Int of int
  | Null

type statement =
  | Assign of string * expression
  | If of expression * statement list * statement list
  | Deref of string

type program = statement list
