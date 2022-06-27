COMPILER=ocamlopt
LINKALL=

include ../../Makecolors.mak

## since the B dep is not in the same directory as a.ml,
## we need to tell the linker where to find b.cmx
## by passsing -I:
test: test.ml a bcmx
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I dep \
	b.cmx \
	a.cmx \
	-o test.exe test.ml;
	./test.exe;

## Since the B dep is not in the same directory as a.ml,
## we need to tell the compiler where to find b.cmi
## by passing '-I dep`. Furthermore, for demo purposes
## the bcmi target compiles b.ml and then deletes b.cmx and b.o,
## in order to demonstrate that only b.cmi is needed for compiling a.ml.
## Expected output:
# Warning 58 [no-cmx-file]: no cmx file was found in path for module B, and its interface was not compiled with -opaque
## Passing -opaque would eliminate this warning.
a: bcmi
	@echo "$(CCMAG)Makefile: $(CURDIR)"
	@echo "Expected output: Warning 58 [no-cmx-file]$(CCRESET)"
	$(COMPILER) -I dep -c a.ml; # emits a.cmx, a.o, a.cmi

bcmi:
	@$(MAKE) -C dep bcmi

bcmx:
	@$(MAKE) -C dep bcmx

################################################################
clean:
	@$(MAKE) -C dep clean
	@-rm -f *.cmx *.o *.cmi *.exe
	@-rm -f test*.exe;
	@-rm -f oUnit*;
