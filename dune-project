(lang dune 3.11)
(name mini_infer)
(using menhir 2.1)

; This allows Dune to auto-generate the .opam file for you
(generate_opam_files true)

(package
 (name mini_infer)
 (authors "Oris B. Buckner IV")
 (synopsis "A static analyzer")
 (description "Scans code for bugs using abstract interpretation.")
 (depends
  (ocaml (>= 5.0.0))
  (dune (>= 3.11))
  (ocamlgraph (>= 2.1.0))
  (base (>= v0.16.0))))
