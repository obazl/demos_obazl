COMPILER=ocamlopt

## Try with and without '-I color'
##SUBDIR=-I color
SUBDIR=

test: test.ml client
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	${SUBDIR} \
	color.cmxa \
	client.cmx \
	-o test.exe test.ml;
	./test.exe

client: lncolor
	$(COMPILER) ${SUBDIR} -c client.ml

## Try omitting some of these ln commands to see the errors produced
lncolor: color
	ln -fs color/red.cmi .;
	ln -fs color/green.cmi .;
	ln -fs color/blue.cmi .;
	ln -fs color/color.cmxa .;
	ln -fs color/color.a .;

.PHONY: color
color:
	${MAKE} -C color;

clean:
	${MAKE} -C color clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
