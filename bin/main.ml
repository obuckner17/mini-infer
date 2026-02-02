open Mini_infer
open Ast

let () =
  print_endline "=== Mini-Infer: Starting Scan ===";
  
  (* We are creating a small program: x = null; then use x; *)
  let my_buggy_code = [
    Assign ("x", Null);
    Deref ("x")
  ] in

  (* Run the analysis *)
  let _ = Analysis.analyze_prog Analysis.empty_memory my_buggy_code in
  
  print_endline "=== Scan Finished ==="
