
# To prove that the [.cmx,o] files are not needed after the archive is
# built:
archive: color.cmxa
	rm -f *cmx *.o;

color.cmxa: r g b
	ocamlopt red.cmx green.cmx blue.cmx -a -o color.cmxa

r: red.ml
	ocamlopt -opaque -c red.ml

g: green.ml
	ocamlopt -c green.ml

b: blue.ml
	ocamlopt -c blue.ml

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
