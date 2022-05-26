
all:
	@echo "Demonstrates that -I does not affect search for .mli file.";
	@echo "The compiler will not find badsig/hello.mli,";
	@echo "so it will infer hello.mli from hello.ml";
	@echo;
	ocamlopt -c hello.ml -I badsig;

## same story even if we compile badsig/hello.mli - it will be ignored
withsig:
	ocamlopt -c badsig/hello.mli;
	ocamlopt -c hello.ml -I badsig;

## Use ocamlobjinfo to inspect hello.cmi, hello.cmx. Verify the
## checksums for the Hello interface.

inspect:
	ocamlobjinfo hello.cmx;
	@echo;
	ocamlobjinfo hello.cmi;
	@echo;
	ocamlobjinfo badsig/hello.cmi;
