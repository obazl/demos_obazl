NS=color

# Here we generate color.ml at build time.

# The ns-resolver module is Color; this is what clients will reference.  It depends on the submodules, and submodules depend on the ns-resolver.  The `-no-alias-deps` flag breaks this circular dependency. Without it we would get errors like:

# File "color.ml", line 1, characters 15-25:
# 1 | module Red   = Color__red
#                    ^^^^^^^^^^
# Error: Unbound module Color__red

NOALIASDEPS=-no-alias-deps

LINKALL=

# We generate prefixes for submodules
SUBMODULES=color__red.cmo color__green.cmo color__blue.cmo

# we import module Foobar as X, so that
# Color.X resolves to Foobar (no ns prefix)

IMPORT=Foobar
IMPORT_AS=X

test.byte: test.ml $(SUBMODULES) ${IMPORT}.cmo color.cmo
	ocamlfind ocamlc $(LINKALL) -linkpkg -package ounit2 $(SUBMODULES) ${IMPORT}.cmo color.cmo -o test.byte test.ml

# -w -49 eliminates warning:
# Warning 49 [no-cmi-file]: no cmi file was found in path for module ...
NOWARN=-w -49
color.cmo: color.ml
	ocamlc ${NOWARN} -c ${NOALIASDEPS} $(LINKALL) color.ml

color.ml:
	echo "module Red    = Color__red"   >  color.ml
	echo "module Green  = Color__green" >> color.ml
	echo "module Blue   = Color__blue"  >> color.ml
	echo "module ${IMPORT_AS} = ${IMPORT}"   >> color.ml

## submodules depend on the ns module
color__red.cmo: red.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c red.ml -o color__red

color__green.cmo: green.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c green.ml -o color__green

color__blue.cmo: blue.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c blue.ml -o color__blue

${IMPORT}.cmo: foobar.ml
	ocamlc $(LINKALL) ${NOALIASDEPS} -c foobar.ml -o ${IMPORT}

clean:
	-rm color.ml 2>/dev/null || true;
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
	-rm *.cma 2>/dev/null || true;
	-rm *.cmx 2>/dev/null || true;
	-rm *.cmxa 2>/dev/null || true;
	-rm *.byte 2>/dev/null || true;
	-rm *.log 2>/dev/null || true;
	-rm *.cache 2>/dev/null || true;
