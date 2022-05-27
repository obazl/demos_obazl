COMPILER=ocamlopt

## we want to compile b.ml against sigfile sig/b.mli, so we pass
## -I sig, hoping the compiler will find sig/b.cmi
## but the compiler will only look for b.mli in the current directory,
## and when it fails to find it, it will generate it from b.ml
## so b.ml will NOT in fact be compiled against sig/b.cmi
b: bsig
	$(COMPILER) -I sig -c b.ml; # emits b.cmx, b.o, but also b.cmi

## compiles sig/b.mli to sig/b.cmi
bsig:
	@$(MAKE) -C sig

################################################################
clean:
	@$(MAKE) -C sig clean
	@-rm -f *.cmi *.cmx *.o *.cmo
