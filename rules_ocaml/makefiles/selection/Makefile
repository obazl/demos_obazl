# compiling with the dep is not enough, we need to pass the dep for
# linking. The cmx file must be passed explicitly.
exe: a
	ocamlopt a.cmx -o a.exe

a:
	ocamlopt -c a.ml

clean:
	@-rm -f a.cmx a.o a.cmi a.exe
