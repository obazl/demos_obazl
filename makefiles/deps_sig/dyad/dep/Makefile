COMPILER=ocamlopt
LINKALL=

bcmx: bcmi
	$(COMPILER) -c b.ml; # emits b.cmx, b.o

# for this demo we pass -opaque, to eliminate the warning:
# Warning 58 [no-cmx-file]: no cmx file was found in path for module B, and its interface was not compiled with -opaque
# we only need -opaque for the sigfile

OPAQUE=-opaque
bcmi:
	$(COMPILER) $(OPAQUE) -c b.mli; # emits b.cmi

################################################################
clean:
	@-rm -f *.cmi *.cmx *.o *.cmo
