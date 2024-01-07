COMPILER=ocamlopt
LINKALL=

test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	a.cmx \
	-o test.exe test.ml;
	./test.exe;

a: a.ml
	$(COMPILER) -c a.ml; # emits a.cmx, a.o, a.cmi
################################################################
clean:
	@-rm -f *.cmi *.cmx *.o *.cmo
	@-rm -f test*.exe;
	@-rm -f oUnit*;
