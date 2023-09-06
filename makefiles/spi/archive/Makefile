COMPILER=ocamlopt
export COMPILER

OPAQUE=-opaque
export OPAQUE

# A depends on B, which is in mylib.cmxa. B in turn depends on C, so
# we must add c.cmx to the command line.

# Note that we do not have -I b here, for demo purposes. When we built
# mylib.cmxa we symlinked b.cmi to mylib/, so mylib.cmxa and b.mci are
# in the same directory. Without that symlink, we would get
# "Error: Unbound module B", since the compiler would be unable to
# find b.cmi.
# Note in addtion that adding -I b here would not help. Evidently when
# the compiler finds that interface B was imported to mylib.cmxa,
# it want to find b.cmi in the same directory as mylib.cmxa. ???

test: test.ml a
	@echo "$(CCRED)Makefile: $(CURDIR)"
	-ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I a -I mylib \
	mylib.cmxa a.cmx \
	-o test.exe test.ml;
	./test.exe;

.PHONY: a
a:
	$(MAKE) -C a;

clean:
	$(MAKE) -C a clean;
	$(MAKE) -C b clean;
	$(MAKE) -C c clean;
	$(MAKE) -C mylib clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
	@-rm -f *.log
