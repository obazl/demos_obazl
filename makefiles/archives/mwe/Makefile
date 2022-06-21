COMPILER=ocamlopt

test: test.ml client
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I color \
	color.cmxa \
	client.cmx \
	-o test.exe test.ml;
	./test.exe;

client: color
	$(COMPILER) -I color -c client.ml

.PHONY: color
color:
	${MAKE} -C color;

clean:
	${MAKE} -C color clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
