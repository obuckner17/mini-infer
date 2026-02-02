
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SEMI
    | RPAREN
    | NULL
    | LPAREN
    | LET
    | ID of 
# 5 "lib/parser.mly"
       (string)
# 20 "lib/parser.ml"
  
    | EQUAL
    | EOF
    | DEREF
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
open Ast

# 34 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : <empty>.
        Start symbol: prog. *)

  | MenhirState14 : (('s, _menhir_box_prog) _menhir_cell1_stmt, _menhir_box_prog) _menhir_state
    (** State 14.
        Stack shape : stmt.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.statement)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * 
# 5 "lib/parser.mly"
       (string)
# 55 "lib/parser.ml"


and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.program) [@@unboxed]

let _menhir_action_1 =
  fun x ->
    (
# 19 "lib/parser.mly"
             ( Var x )
# 69 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_2 =
  fun () ->
    (
# 20 "lib/parser.mly"
             ( Null )
# 77 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_3 =
  fun () ->
    (
# 11 "lib/parser.mly"
        ( [] )
# 85 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_4 =
  fun p s ->
    (
# 12 "lib/parser.mly"
                       ( s :: p )
# 93 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_5 =
  fun e x ->
    (
# 15 "lib/parser.mly"
                                       ( Assign(x, e) )
# 101 "lib/parser.ml"
     : (Ast.statement))

let _menhir_action_6 =
  fun x ->
    (
# 16 "lib/parser.mly"
                                        ( Deref(x) )
# 109 "lib/parser.ml"
     : (Ast.statement))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | SEMI ->
        "SEMI"
    | RPAREN ->
        "RPAREN"
    | NULL ->
        "NULL"
    | LPAREN ->
        "LPAREN"
    | LET ->
        "LET"
    | ID _ ->
        "ID"
    | EQUAL ->
        "EQUAL"
    | EOF ->
        "EOF"
    | DEREF ->
        "DEREF"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_goto_prog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_16 _menhir_stack _v
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_stmt -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_4 p s in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let _menhir_run_08 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_3 () in
      _menhir_goto_prog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_2 () in
                  _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ID _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_1 in
                  let _v = _menhir_action_1 x in
                  _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_5 e x in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | EOF ->
          _menhir_run_08 _menhir_stack MenhirState14
      | DEREF ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SEMI ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v in
                      let _v = _menhir_action_6 x in
                      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EOF ->
          _menhir_run_08 _menhir_stack _menhir_s
      | DEREF ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
