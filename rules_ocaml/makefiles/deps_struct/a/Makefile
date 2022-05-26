COMPILER=ocamlopt
LINKALL=

test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	b.cmx a.cmx \
	-o test.exe test.ml;
	./test.exe;

## the compiler finds the B dep (b.cmi, b.cmx) since it is in the same
## directory as a.ml.
a: b
	$(COMPILER) -c a.ml; # emits a.cmx, a.o

b:
	$(COMPILER) -c b.ml; # emits a.cmx, a.o

################################################################
clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	@-rm -f test*.exe;
	@-rm -f oUnit*;
