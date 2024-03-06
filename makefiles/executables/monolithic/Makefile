# pass all srcs in one compile/link cmd
# sources must be in dependency order

exe:
	ocamlopt foo.mli foo.ml main.ml -o main.exe;
	./main.exe

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
