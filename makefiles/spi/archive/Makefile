COMPILER=ocamlopt
export COMPILER

OPAQUE=-opaque
export OPAQUE

# A depends on B, which is in mylib.cmxa. B in turn depends on C, so
# we must add c.cmx to the command line.
test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I a -I c -I mylib \
	c.cmx mylib.cmxa a.cmx \
	-o test.exe test.ml;
	./test.exe;

.PHONY: a
a:
	$(MAKE) -C a;

clean:
	$(MAKE) -C a clean;
	$(MAKE) -C b clean;
	$(MAKE) -C c clean;
	$(MAKE) -C mylib clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
