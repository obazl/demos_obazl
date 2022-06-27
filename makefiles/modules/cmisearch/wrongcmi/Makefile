# expected:

# Error: The implementation hello.ml
#        does not match the interface badsig/hello.cmi:
#        The value `badmsg' is required but not provided

# Adding '-I badsig' (and failing to compile ./hello.mli) is what
# causes the problem.

include ../../../Makecolors.mak

default: badsig
	@echo "$(CCRED)Makefile: $(CURDIR)"
	@echo "Expected output: Error: implementation does not match interface$(CCRESET)"
	ocamlopt -c hello.ml -I badsig;

.PHONY: badsig badclean

badsig:
	cd badsig && $(MAKE);

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	$(MAKE) -C badsig clean;
