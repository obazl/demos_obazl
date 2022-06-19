acmx: b
	ocamlopt -c a.ml; # emits a.cmi, a.cmx, a.o

b:
	ocamlopt -c b.mli; # emits b.cmi


## Expected result for make exe:
## Error: No implementations provided for the following modules:
##         B referenced from a.cmx
exe: acmx
	ocamlopt a.cmx -o a.exe;  # emits a.exe executable

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
