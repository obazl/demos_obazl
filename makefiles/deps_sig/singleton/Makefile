COMPILER=ocamlopt
LINKALL=

## for compilation, module A depends on b.cmi but not b.cmx;
## for linking, it depends on b.cmx, so we put that dep here:
test: test.ml a bcmx
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	-I dep \
	b.cmx \
	a.cmx \
	-o test.exe test.ml;
	./test.exe;

# for demo purposes we show that compilation of a.mli depends on b.cmi
# but not b.cmx.

# if we omit '-I dep' we get an error:
# File "a.ml", line 7, characters 8-11:
# 7 | let z = B.y
#             ^^^
# Error: Unbound module B

# But what this really means is that the compiler cannot find the
# compiled _signature_ (b.cmi) component of module B, not that it
# cannot find the B _module_ (since 'module B' means the pair b.cmi
# and b.cmx).

a: acmi a.ml
	$(COMPILER) -I dep -c a.ml; # emits a.cmx, a.o, a.cmi

acmi: bcmx a.mli
	$(COMPILER) -I dep -c a.mli; # emits a.cmi

bcmx:
	@$(MAKE) -C dep bcmx

################################################################
clean:
	@$(MAKE) -C dep clean
	@-rm -f *.cmi *.cmx *.o *.cmo
	@-rm -f test*.exe;
	@-rm -f oUnit*;
	@-rm -f *.log
