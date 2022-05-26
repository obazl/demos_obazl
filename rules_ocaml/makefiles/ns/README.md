# "direct" namespace demos

These demos show how to implement namespacing directly, without tool
support, by choice of filenames and appropriate structuring of the build.

They're not intended to test or demonstrate OBazl capabilities;
they're for exploring namespacing techniques in OCaml. They all use
Makefiles.

WARNING: your opam setup must be in order. If you get errors like
"can't find ounit2" try running $ eval $(opam config env).
