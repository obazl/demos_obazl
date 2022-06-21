color.cmxa: r g b
	ocamlopt red.cmx green.cmx blue.cmx -a -o color.cmxa

r: red.ml
	ocamlopt -c red.ml

g: green.ml
	ocamlopt -c green.ml

b: blue.ml
	ocamlopt -c blue.ml

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
