COMPILER=ocamlopt

test: a
	ocamlfind $(COMPILER) -linkpkg -package ounit2 \
	x.cmx a.cmx \
	test.ml \
	-o test.exe;    # emits test.exe, test.cmi, test.cmx, test.o
	./test.exe;     # runs the test

a: x
	$(COMPILER) -c a.ml;  # emits a.cmi, a.cmx, a.o

x:
	$(COMPILER) -c x.ml;  # emits x.cmi, x.cmx, x.o

clean:
	@-rm -f *.cmi *.cmx *.o *.exe
	@-rm -f oUnit*
