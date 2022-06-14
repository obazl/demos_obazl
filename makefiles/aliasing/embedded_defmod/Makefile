COMPILER=ocamlopt

test: a
	ocamlfind $(COMPILER) -linkpkg -package ounit2 \
	a.cmx \
	test.ml \
	-o test.exe;
	./test.exe;

a:
	$(COMPILER) -c a.ml;  # emits a.cmi, a.cmx, a.o

clean:
	@-rm -f *.cmi *.cmx *.o *.exe
	@-rm -f oUnit*
