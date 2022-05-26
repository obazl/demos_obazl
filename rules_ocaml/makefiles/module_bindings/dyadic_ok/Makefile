exe: cmx
	ocamlopt hello.cmx;  # emits a.out executable

cmx: cmi
	ocamlopt -c hello.ml; # emits hello.cmx, hello.o

cmi:
	ocamlopt -c hello.mli; # emits hello.cmi

clean:
	rm hello.cmx hello.o hello.cmi a.out
