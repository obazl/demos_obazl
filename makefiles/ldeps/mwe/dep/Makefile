bcmx: bcmi
	$(COMPILER) $(OPAQUE) -c b.ml; # emits b.cmx, b.o

bcmi:
	$(COMPILER) $(OPAQUE) -c b.mli; # emits b.cmi

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
