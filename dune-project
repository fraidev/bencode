(lang dune 2.9)

(name bencode)

(version 0.1)

(maintainers "fraifelipe@gmail.com")

(generate_opam_files true)

(using menhir 2.0)

(package
 (name bencode)
 (synopsis "bencode")
 (description "bencode")
 (depends
  (alcotest :with-test)
  (dune
   (and
    :build
    (>= 2.9.0)))
 ))

(package
 (name dev)
 (synopsis "A package to install dev dependencies")
 (description "THIS PACKAGE IS FOR DEVELOPMENT PURPOSE")
 (depends
  (ocamlformat
   (>= 0.20))
  (ocamlformat-rpc
   (>= 0.19))
  (ocaml-lsp-server
   (>= 1.10.3))))
