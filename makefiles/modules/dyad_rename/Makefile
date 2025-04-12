exe: cmx
	ocamlopt C.cmx -o hello.exe;  # emits hello.exe executable

cmx: cmi
	ocamlopt -bin-annot -cmi-file C.cmi -c a.ml -o C; # emits C.cmx, C.o

cmi:
	ocamlopt -bin-annot -c b.mli -o C; # emits C.cmi

clean:
	@-rm -f *.cmx *.o *.cmi *.cmt* *.exe
