# compiling with the dep is not enough, we need to pass the dep for
# linking. The cmx file must be passed explicitly.
exe: a
	ocamlopt b.cmx a.cmx -o a.exe

a: b
	ocamlopt -c a.ml

b:
	ocamlopt -c b.ml

clean:
	@-rm -f a.cmx a.o a.cmi a.exe b.cmx b.o b.cmi
