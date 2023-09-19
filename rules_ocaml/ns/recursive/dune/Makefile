ALL= \
Demos_namespaces_recursive_makefile__red.cmo \
Demos_namespaces_recursive_makefile__green.cmo \
Demos_namespaces_recursive_makefile__blue.cmo

LEAFS = Demos_namespaces_recursive_makefile__red.cmo \
	Demos_namespaces_recursive_makefile__green.cmo \
	Demos_namespaces_recursive_makefile__blue.cmo

driver: ${ALL}
	ocamlc -w -31 *.cmo Driver.ml -o Driver.exe

# The helper module is Ns_init. It contains only alias statements.
# Submodules depend on it for compilation, and the main ns module
# depends on it to resolve its recursive alias statements.
Demos_namespaces_recursive_makefile_ns.cmo: Demos_namespaces_recursive_makefile_ns.ml
	ocamlc -w -49 -c -no-alias-deps -linkall Demos_namespaces_recursive_makefile_ns.ml

## leaf nodes depend on the ns module
Demos_namespaces_recursive_makefile__red.cmo: red.ml Demos_namespaces_recursive_makefile_ns.cmo
	cp red.ml Demos_namespaces_recursive_makefile__red.ml
	ocamlc -w -49 -linkall -no-alias-deps -open Demos_namespaces_recursive_makefile_ns -c Demos_namespaces_recursive_makefile__red.ml

Demos_namespaces_recursive_makefile__green.cmo: green.ml Demos_namespaces_recursive_makefile_ns.cmo
	cp green.ml Demos_namespaces_recursive_makefile__green.ml
	ocamlc -w -49 -linkall -no-alias-deps -open Demos_namespaces_recursive_makefile_ns -c Demos_namespaces_recursive_makefile__green.ml

Demos_namespaces_recursive_makefile__blue.cmo: blue.ml Demos_namespaces_recursive_makefile_ns.cmo
	cp blue.ml Demos_namespaces_recursive_makefile__blue.ml
	ocamlc -w -49 -linkall -no-alias-deps -open Demos_namespaces_recursive_makefile_ns -c Demos_namespaces_recursive_makefile__blue.ml


# The main ns module is Color; this is what clients will reference.
color.cmo: Demos_namespaces_recursive_makefile_ns.cmo color.ml
	ocamlc -w -49 -c -no-alias-deps -linkall Demos_namespaces_recursive_makefile_ns.cmo -open Demos_namespaces_recursive_makefile_ns color.ml

test.byte: test.ml $(LEAFS) color.cmo
	ocamlfind ocamlc -w -49 -linkall -linkpkg -package ounit2 $(LEAFS) color.cmo -o test.byte test.ml

clean:
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
	-rm *.cma 2>/dev/null || true;
	-rm *.cmx 2>/dev/null || true;
	-rm *.cmxa 2>/dev/null || true;
	-rm *.byte 2>/dev/null || true;
	-rm *.log 2>/dev/null || true;
	-rm *.cache 2>/dev/null || true;
	-rm Demos_namespaces_recursive_makefile__red.ml 2>/dev/null || true;
	-rm Demos_namespaces_recursive_makefile__green.ml 2>/dev/null || true;
	-rm Demos_namespaces_recursive_makefile__blue.ml 2>/dev/null || true;
