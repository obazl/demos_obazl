
all:
	ocamlopt -c hello.ml -I badsig;

## same story even if we compile badsig/hello.mli - it will be ignored
withsig:
	ocamlopt -c badsig/hello.mli;
	ocamlopt -c hello.ml -I badsig;

## Use ocamlobjinfo to inspect hello.cmi, hello.cmx. Verify the
## checksums for the Hello interface do not match.

inspect:
	ocamlobjinfo hello.cmx;
	@echo;
	ocamlobjinfo hello.cmi;
	@echo;
	ocamlobjinfo badsig/hello.cmi;

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	$(MAKE) -C badsig clean;
