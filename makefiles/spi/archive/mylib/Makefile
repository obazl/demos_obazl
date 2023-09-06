COMPILER=ocamlopt
OPAQUE=

## Here B depends on C, so b.cmx must follow c.cmx on the command
## line.
mylib: b
	$(COMPILER) -I ../c c.cmx -I ../b b.cmx -a -o mylib.cmxa;

## In order to (later) link against an archive, the component sigs
## must not only be on the search path, but evidently must be in the
## same directory as the archive file. So we symlink b.cmi and c.cmi
## here. (In practice, the archive will usually be built in the same
## directory as its components.)

b: c
	$(MAKE) -C ../b;
	ln -fs ../b/b.cmi .;

c:
	$(MAKE) -C ../c;
	ln -fs ../c/c.cmi .;

clean:
	@-rm -f *.cmxa *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
