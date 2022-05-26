## Demonstrates binding a fixed struct to different sigs.

## The struct a.ml has three fields, so it can satisfy any signature
## composed of combination of those fields. Each .mli file exposes one
## combination.

## To run: $ make COMBO=<combo>
## where <combo> = x | y | z | xy | xz | yz | xyz

## or: $ make all

## Note that axyz.mli is the principal signature for a.ml. It is also
## the greatest signature for a.ml; extending it by adding more fields
## would result in a signature that a.ml could not satisfy.
## To verify this, run '$ make COMBO=xyz_extended'. Expected result:
# Error: The implementation a.ml does not match the interface a.cmi:
#        The value `extra' is required but not provided
#        File "a.mli", line 5, characters 0-14: Expected declaration

COMPILER=ocamlopt
LINKALL=

COMBOS = x y z xy xz yz xyz

COMBO=x

test$(COMBO): test$(COMBO).ml a$(COMBO)
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 a.cmx -o test$(COMBO).exe test$(COMBO).ml;
	./test$(COMBO).exe;

a$(COMBO): a$(COMBO)mli
	$(COMPILER) -c a.ml; # emits a.cmx, a.o

## principle names of sigfile and structfile must match.
## to make this work we symlink the selected sigfile to a.mli:
a$(COMBO)mli:
	ln -fs a$(COMBO).mli a.mli || true;  ## symlink to a.mli
	$(COMPILER) -c a.mli; # emits a.cmi

all:
	for c in $(COMBOS); do $(MAKE) COMBO=$$c; done

################################################################
clean:
	@-rm -f *.cmx *.o *.cmi *.exe
	@-rm -f test*.exe;
	@-rm -f a.mli;
	@-rm -f oUnit*;
