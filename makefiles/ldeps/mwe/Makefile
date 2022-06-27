COMPILER=ocamlopt
export COMPILER

OPAQUE=-opaque
export OPAQUE

test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	b.cmx a.cmx \
	-o test.exe test.ml;
	./test.exe;


a:
	$(MAKE) -C main;
	ln -fs main/a.cmi .;
	ln -fs main/a.cmx .;
	ln -fs main/a.o .;
	ln -fs dep/b.cmx .;
	ln -fs dep/b.o .;

clean:
	$(MAKE) -C dep clean;
	$(MAKE) -C main clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
