default: badsig
	@echo "Demonstrates that search for .cmi, unlike search for .mli,";
	@echo "is affected by \"-I\" options. The compiler will find ./hello.mli,";
	@echo "but will then find \"badsig/hello.cmi\", which does not";
	@echo "match \"./hello.ml\", so the compile will fail.";
	@echo "Expected output:";
	@echo "Error: The implementation hello.ml";
	@echo "       does not match the interface badsig/hello.cmi:";
	@echo "       The value \`badmsg' is required but not provided";
	@echo;
	ocamlopt -c hello.ml -I badsig;

## NB: adding '-I badsig' (and failing to compile ./hello.mli)
##     is what causes the problem.

.PHONY: badsig badclean

badsig:
	cd badsig && $(MAKE);

clean:
	cd badsig && $(MAKE) clean;
