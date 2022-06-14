COMPILER=ocamlopt
LINKALL=

COMBOS = x y z xy xz yz xyz

COMBO=x

test$(COMBO): test$(COMBO).ml a$(COMBO)
	ocamlfind $(COMPILER) $(LINKALL) -linkpkg -package ounit2 a.cmx -o test$(COMBO).exe test$(COMBO).ml;
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
