## Demonstrates binding a fixed signature to different structs.

## The sigfile a.mli has one field, so any struct with that field
## satisfies the signature. Each sigfile file in this directory
## implements that field plus some others. Note that ax.mli is the
## least struct that will satisfy the signature.

## To run: $ make COMBO=<combo>
## where <combo> = x | xy | xyz

## or: $ make all

COMPILER=ocamlopt
LINKALL=

COMBOS = x xy xyz

COMBO=x

# we only need one test file, since we have only one interface to test:
test: test.ml a$(COMBO)
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 a.cmx -o test.exe test.ml;
	./test.exe;

## principle names of sigfile and structfile must match.
## to make this work we symlink the selected structfile to a.ml:
a$(COMBO): amli
	ln -fs a$(COMBO).ml a.ml || true;  ## symlink to a.ml
	$(COMPILER) -c a.ml; # emits a.cmx, a.o

amli:
	$(COMPILER) -c a.mli; # emits a.cmi

all:
	for c in $(COMBOS); do $(MAKE) COMBO=$$c; done

################################################################
clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	@-rm -f test*.exe;
	@-rm -f a.ml;
	@-rm -f oUnit*;
