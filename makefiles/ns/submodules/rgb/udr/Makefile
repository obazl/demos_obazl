NS=color

# The ns-resolver module is Color; this is what clients will reference.  It depends on the submodules, and submodules depend on the ns-resolver.  The `-no-alias-deps` flag breaks this circular dependency. Without it we would get errors like:

# File "color.ml", line 1, characters 15-25:
# 1 | module Red   = Color__red
#                    ^^^^^^^^^^
# Error: Unbound module Color__red

NOALIASDEPS=-no-alias-deps

LINKALL=

SUBMODULES=color__red.cmo color__green.cmo color__blue.cmo

test.byte: test.ml $(SUBMODULES) foobar.cmo color.cmo
	ocamlfind ocamlc $(LINKALL) -linkpkg -package ounit2 $(SUBMODULES) foobar.cmo color.cmo -o test.byte test.ml

# -w -49 eliminates warning:
# Warning 49 [no-cmi-file]: no cmi file was found in path for module ...
NOWARN=-w -49
color.cmo: # ${SUBMODULES} # this would create a dep cycle
	ocamlc ${NOWARN} -c ${NOALIASDEPS} $(LINKALL) color.ml

## submodules depend on the ns module
color__red.cmo: red.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c red.ml -o color__red

color__green.cmo: green.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c green.ml -o color__green

color__blue.cmo: blue.ml color.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open Color -c blue.ml -o color__blue

foobar.cmo: foobar.ml
	ocamlc $(LINKALL) ${NOALIASDEPS} -c foobar.ml

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
