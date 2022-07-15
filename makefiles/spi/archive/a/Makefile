COMPILER=ocamlopt
OPAQUE=-opaque

# A depends on B, which is in mylib; but B depends on C, which is not
# in mylib. Since but a.ml refers to C, we must put C in the search
# path with -I ../c.

# Note that A does not have a (direct) build dependency on either B or
# C.


a: mylib
	$(COMPILER) $(OPAQUE) \
	-I ../mylib \
	-c a.ml; # emits a.cmi, a.cmx, a.o

mylib:
	$(MAKE) -C ../mylib;

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
