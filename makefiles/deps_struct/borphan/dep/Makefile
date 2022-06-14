COMPILER=ocamlopt
LINKALL=

# this target compiles b.ml, emiting b.cmx, b.o, and b.cmi.
# to demonstrate that only b.cmx is required for compiling
# clients that depend on B, we then delete b.o and b.cmx.
bcmi:
	$(COMPILER) -c b.ml; # emits b.cmx, b.o, b.cmi
	-rm b.cmx b.o      # for demo purposes

# linking is a different story - to link a module A that depends
# on module B, we need b.cmx and b.o, so we recompile:
bcmx:
	@echo "INFO: recompiling b.ml to reproduce b.cmx, b.o"
	$(COMPILER) -c b.ml; # emits b.cmx, b.o, b.cmi

################################################################
clean:
	@-rm -f *.cmx *.o *.cmi
