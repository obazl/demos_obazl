## expected:
# Error: Files a.cmx and dep/b.cmx
#        make inconsistent assumptions over interface B

COMPILER=ocamlopt
LINKALL=

## below we (try to) compile module A against the compiled sig
## dep/sig/b.cmi;
## now we try to link against dep/b.cmx
## this will throw:
# Error: Files a.cmx and dep/b.cmx
#        make inconsistent assumptions over interface B
# that's because dep/b.cmx was compiled against dep/b.cmi
# and a.cmx was compiled against dep/sig/b.cmi
# verify by running '$ ocamlobjinfo a.cmx' and
# '$ ocamlobjinfo dep/sig/b.cmi' can comparing the B checksums
# then do the same for dep/b.cmi and dep/b.cmx

test: test.ml a
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I dep b.cmx \
	a.cmx \
	-o test.exe test.ml;
	./test.exe;

## we want to compile a.ml against the sigfile dep/sig/b.mli, so we pass
## '-I dep/sig', hoping the compiler will find dep/sig/b.cmi
## passing '-I dep' prevents warning
# Warning 58 [no-cmx-file]: no cmx file was found in path for module B, and its interface was not compiled with -opaque

a: b a.ml
	$(COMPILER) -I dep/sig -I dep -c a.ml; # emits a.cmx, a.o, a.cmi

## but this would work:
	# $(COMPILER) -I dep -c a.ml; # emits a.cmx, a.o, a.cmi

## moving deps/sig/b.mli to deps/b.mli would also work

b:
	@$(MAKE) -C dep

################################################################
clean:
	@$(MAKE) -C dep clean
	@-rm -f *.cmi *.cmx *.o *.cmo
	@-rm -f test*.exe;
	@-rm -f oUnit*;
