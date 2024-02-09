COMPILER=ocamlopt
LINKALL=

# to see the constructed cmd line,
# pass -only-show to ocamlfind
SHOW=
# e.g. 'make test.exe SHOW=-only-show'


run: test.exe
	./test.exe;

# NOTE: test.cmx depends on a.cmx and ounit2.cmx,
# so it must come after them.
# ocamlfind -linkpkg -package adds ounit2.cmx
# and all of its deps to the cmd line
test.exe: test
	ocamlfind $(COMPILER) \
	$(SHOW) \
	-linkpkg -package ounit2 \
	a.cmx \
	test.cmx \
	-o test.exe;

# ocamlfind -package adds -I directives to the
# cmd line for ounit2 and all of its deps;
# this exposes the .cmi files
test: test.ml a
	ocamlfind $(COMPILER) \
	$(SHOW) \
	-package ounit2 \
	-c test.ml; # emits test.cmx, test.o, test.cmi

# NOTE: ocamlfind not needed here; we add
# it so that -only-show will work
a: a.ml
	ocamlfind $(COMPILER) \
	$(SHOW) \
	-c a.ml; # emits a.cmx, a.o, a.cmi

################################################################
clean:
	@-rm -f *.cmi *.cmx *.o *.cmo
	@-rm -f test*.exe;
	@-rm -f oUnit*;
