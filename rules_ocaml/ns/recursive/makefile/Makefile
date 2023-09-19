NS=Demos_namespaces_recursive_makefile

LINKALL=

# Modules must be listed in dependency order. In this case, Red
# depends on Green, so it must be listed after Green.
LEAFS = $(NS)__green.cmo \
	$(NS)__red.cmo \
	$(NS)__blue.cmo

test.byte: test.ml $(LEAFS) color.cmo
	ocamlfind ocamlc -w -49 $(LINKALL) -linkpkg -package ounit2 $(LEAFS) color.cmo -o test.byte test.ml

# The main ns module is Color; it's the "entry point" of the namespace.
# It contains recursive aliasing equations; to resolve them it needs to -open the resolver module.
color.cmo: $(NS)_resolver.cmo color.ml
	ocamlc -w -49 -c -no-alias-deps $(LINKALL) $(NS)_resolver.cmo -open $(NS)_resolver color.ml

# The resolver module; it contains only alias statements. Submodules
# depend on it for compilation, and the main ns module depends on it
# to resolve its recursive aliasing equations.
$(NS)_resolver.cmo: $(NS)_resolver.ml
	ocamlc -w -49 -c -no-alias-deps $(LINKALL) $(NS)_resolver.ml

## leaf nodes (submodules) depend on the resolver module; they need to -open it in order to compile.
## In this demo, we use simple names for the submodules, and rename
## them by copying, prepending a namespace prefix.

# for demo purposes, Red depends on Green
$(NS)__red.cmo: red.ml $(NS)_resolver.cmo $(NS)__green.cmo
	cp red.ml $(NS)__red.ml
	ocamlc -w -49 $(LINKALL) -open $(NS)_resolver -c $(NS)__red.ml

$(NS)__green.cmo: green.ml $(NS)_resolver.cmo
	cp green.ml $(NS)__green.ml
	ocamlc -w -49 $(LINKALL) -open $(NS)_resolver -c $(NS)__green.ml

$(NS)__blue.cmo: blue.ml $(NS)_resolver.cmo
	cp blue.ml $(NS)__blue.ml
	ocamlc -w -49 $(LINKALL) -open $(NS)_resolver -c $(NS)__blue.ml

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
	-rm $(NS)__red.ml 2>/dev/null || true;
	-rm $(NS)__green.ml 2>/dev/null || true;
	-rm $(NS)__blue.ml 2>/dev/null || true;
