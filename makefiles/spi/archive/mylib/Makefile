COMPILER=ocamlopt
OPAQUE=

## Here B depends on C, so b.cmx must follow c.cmx on the command
## line: Note that mylib does NOT depend (directly) on C. However B
## does depend on C, so if you use ocamlobjinfo to inspect mylib.cmxa
## you will see that it contains only B, but that B imports the
## interface of C, and the implementation (but with no crc; ?).
mylib: b
	$(COMPILER) -I ../b b.cmx -a -o mylib.cmxa;

## In order to compile against an archive, the component sigs must be
## on the search path, so we link them here.
b: c
	$(MAKE) -C ../b;
	ln -fs ../b/b.cmi .;

c:
	$(MAKE) -C ../c;

clean:
	@-rm -f *.cmxa *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
