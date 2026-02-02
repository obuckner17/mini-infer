open Base

type v_state = Null | NotNull | Unknown
type memory = (string, v_state, String.comparator_witness) Map.t

let empty_memory = Map.empty (module String)

(* We use Ast.program here to be 100% explicit *)
let analyze_prog (mem : memory) (prog : Ast.program) =
  List.fold prog ~init:mem ~f:(fun current_mem stmt ->
    match (stmt : Ast.statement) with
    | Assign (name, Null) -> 
        Map.set current_mem ~key:name ~data:Null
    | Assign (name, Int _) -> 
        Map.set current_mem ~key:name ~data:NotNull
    | Deref name ->
        (match Map.find current_mem name with
         | Some Null -> 
             Stdlib.print_endline ("🚨 BUG FOUND: Null pointer dereference of '" ^ name ^ "'!"); 
             current_mem
         | _ -> current_mem)
    | _ -> current_mem)
