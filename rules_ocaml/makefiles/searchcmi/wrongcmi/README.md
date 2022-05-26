# cmisearch

Demonstrates that search for .cmi, unlike search for .mli, is affected
by "-I" options. The compiler will find ./hello.mli, but will then
find "badsig/hello.cmi", which does not match "./hello.ml", so the
compile will fail.

Expected output:
Error: The implementation hello.ml
       does not match the interface badsig/hello.cmi:
       The value \`badmsg' is required but not provided

	ocamlopt -c hello.ml -I badsig;
