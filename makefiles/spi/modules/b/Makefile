COMPILER=ocamlopt
OPAQUE=-opaque

bcmx: bcmi c
	$(COMPILER) $(OPAQUE) -I ../c -c b.ml; # emits b.cmx, b.o

bcmi:
	$(COMPILER) $(OPAQUE) -c b.mli; # emits b.cmi

.PHONY: c
c:
	$(MAKE) -C ../c;

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
