# compiling with the dep is not enough, we need to pass the dep for
# linking. Explicitly; providing -I b is not sufficient.
exe: a
	ocamlopt -I b b.cmx a.cmx -o a.exe

a: b
	ocamlopt -I b -c a.ml

.PHONY: b

b:
	$(MAKE) -C b

clean:
	@$(MAKE) -C b clean
	@-rm -f a.cmx a.o a.cmi a.exe
