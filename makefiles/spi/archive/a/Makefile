COMPILER=ocamlopt
OPAQUE=-opaque

# A depends on B, which is in mylib; but B depends on C, which is not
# in mylib. Since but a.ml refers directly to C, we must put C in the
# search path with -I ../c or the build will fail.

# This is a good thing if we want to prevent our code from depending
# on such indirect (private) deps. A problem arises when build tools
# (e.g. findlib/ocamlfind) automatically add such -I arguments for all
# dependencies of a library/package. This exposes indirect deps to our
# source code, making it possible to depend on stuff that should be
# considered implementation detail.

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
