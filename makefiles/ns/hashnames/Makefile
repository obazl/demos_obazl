NS=Demos_namespaces_direct_hash

LINKALL=

HASHER=md5sum

RED=$(shell ${HASHER} red.ml | cut -d ' ' -f 1)
GREEN=$(shell ${HASHER} green.ml | cut -d ' ' -f 1)
BLUE=$(shell ${HASHER} blue.ml | cut -d ' ' -f 1)

LEAFS = MD5_$(RED).cmo \
	MD5_$(GREEN).cmo \
	MD5_$(BLUE).cmo

test.byte: test.ml $(LEAFS) color.cmo
	ocamlfind ocamlc $(LINKALL) -linkpkg -package ounit2 $(LEAFS) color.cmo -o test.byte test.ml

# The main ns module is Color; this is what clients will reference.
# Since it depends on the submodule hashes, it must be generated at build time.
# -w -49 eliminates warning:
# Warning 49 [no-cmi-file]: no cmi file was found in path for module ...
color.cmo: red.ml green.ml blue.ml
	echo "module Red   = MD5_$(RED)"    > color.ml
	echo "module Green = MD5_$(GREEN)" >> color.ml
	echo "module Blue  = MD5_$(BLUE)"  >> color.ml
	ocamlc -w -49 -c -no-alias-deps $(LINKALL) color.ml

## leaf nodes depend on the ns module
MD5_$(RED).cmo: red.ml color.cmo
	ocamlc $(LINKALL) -no-alias-deps -open Color -c red.ml -o MD5_$(RED)

MD5_$(GREEN).cmo: green.ml color.cmo
	ocamlc $(LINKALL) -no-alias-deps -open Color -c green.ml -o MD5_$(GREEN)

MD5_$(BLUE).cmo: blue.ml color.cmo
	ocamlc $(LINKALL) -no-alias-deps -open Color -c blue.ml -o MD5_$(BLUE)

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
	-rm MD5*.ml 2>/dev/null || true;
	-rm color.ml 2>/dev/null || true;
