exe: cmx
	ocamlopt hello.cmx -o hello.exe;  # emits a.exe executable

cmx: cmi
	ocamlopt -c hello.ml; # emits hello.cmx, hello.o

cmi:
	ocamlopt -c hello.mli; # emits hello.cmi

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
