# same as opaque1, but we use '-opaque`, which tells the compiler not
# to do cross-module optimization, which means it will ignore the
# b.cmx dependency (but not b.cmi) when compiling a.ml.

exe: a bcmx
	ocamlopt b.cmx a.cmx -o a.exe

a: b
	ocamlopt -opaque -c a.ml

## this produces b.cmi, b.cmx, b.o;
## for demo purposes we then delete b.cmx
b:
	ocamlopt -opaque -c b.ml
	rm b.cmx

## we need to rebuild b.cmx, since linking for a.exe requires it.
## i.e. it can only go missing for module compilation, not linking
bcmx:
	ocamlopt -opaque -c b.ml

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
