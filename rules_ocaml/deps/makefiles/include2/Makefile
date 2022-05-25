# compiling with the dep is not enough, we need to pass the dep for
# linking:
exe: a
	ocamlopt -I b b.cmx a.cmx

a: b
	ocamlopt -I b -opaque -c a.ml

.PHONY: b

b:
	$(MAKE) -C b

clean:
	@$(MAKE) -C b clean
	@-rm -f a.cmx a.o a.cmi a.out
