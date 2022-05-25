# opaque1: compile a.ml without dep b.cmx and without -opaque

## this will succeed, but a.cmx will not be cross-module optimized.
exe: a bcmx
	ocamlopt b.cmx a.cmx -o a.exe

# expected output from 'make a':
# Warning 58 [no-cmx-file]: no cmx file was found in path for module B, and its interface was not compiled with -opaque
a: bcmi
	ocamlopt -c a.ml

## we could suppress the warning, by passing -w -58:
	# ocamlopt -w -58 -c a.ml

# for demo purposes, we compile b.ml and then remove b.cmx
# so that we can compile a.ml with b.cmi only
bcmi:
	ocamlopt -c b.ml
	rm b.cmx

## we need to rebuild b.cmx, since linking for a.exe requires it.
## i.e. it can only go missing for module compilation, not linking
bcmx:
	ocamlopt -c b.ml

clean:
	@-rm -f a.cmx a.o a.cmi a.exe b.cmx b.o b.cmi
