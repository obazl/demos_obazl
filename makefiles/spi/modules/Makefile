COMPILER=ocamlopt
export COMPILER

OPAQUE=-opaque
export OPAQUE

test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I a -I b -I c \
	c.cmx b.cmx a.cmx \
	-o test.exe test.ml;
	./test.exe;

.PHONY: a
a:
	$(MAKE) -C a;

clean:
	$(MAKE) -C a clean;
	$(MAKE) -C b clean;
	$(MAKE) -C c clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
