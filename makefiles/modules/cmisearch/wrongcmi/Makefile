# expected:

# Error: The implementation hello.ml
#        does not match the interface badsig/hello.cmi:
#        The value `badmsg' is required but not provided

# Adding '-I badsig' (and failing to compile ./hello.mli) is what
# causes the problem.

default: badsig
	ocamlopt -c hello.ml -I badsig;

.PHONY: badsig badclean

badsig:
	cd badsig && $(MAKE);

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	$(MAKE) -C badsig clean;
