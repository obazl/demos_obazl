COMPILER=ocamlopt
OPAQUE=-opaque

a: b
	$(COMPILER) $(OPAQUE) -I ../b -I ../c \
	-c a.ml; # emits a.cmi, a.cmx, a.o

b:
	$(MAKE) -C ../b;

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
