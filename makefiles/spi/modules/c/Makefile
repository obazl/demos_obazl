COMPILER=ocamlopt
OPAQUE=-opaque


.PHONY: c
c: ccmi
	$(COMPILER) $(OPAQUE) -c c.ml; # emits c.cmx, c.o

ccmi:
	$(COMPILER) $(OPAQUE) -c c.mli; # emits c.cmi

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
