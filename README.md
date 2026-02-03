![Build Status](https://github.com/your-username/mini-infer/actions/workflows/main.yml/badge.svg)

# Mini-Infer: A Static Analysis Engine in OCaml

Mini-Infer is a proof-of-concept static analyzer inspired by. It uses **Abstract Interpretation** to detect null pointer dereferences without actually executing the code.



##  How it Works
The tool follows a standard compiler-style pipeline:
1. **Lexing (`lexer.mll`)**: Breaks source text into tokens.
2. **Parsing (`parser.mly`)**: Builds an **Abstract Syntax Tree (AST)**.
3. **Static Analysis (`analysis.ml`)**: Performs a dataflow analysis to track variable states (Null vs. NotNull) across the program.

## Installation & Usage
Ensure you have `opam` and `dune` installed.

```bash
# Install dependencies
opam install base menhir ocamlgraph

# Build the project
dune build

# Run the analyzer on test_input.txt
dune exec mini_infer
