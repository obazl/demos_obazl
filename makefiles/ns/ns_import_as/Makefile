NS=color

NOALIASDEPS=-no-alias-deps

LINKALL=

# We generate prefixes for submodules
SUBMODULES=color__red.cmo color__green.cmo color__blue.cmo

# we import ns Greek as Greek, so that
# Color.Greek.Alpha resolves to Greek.alpha

IMPORT=Greek
IMPORT_AS=Greek
IMPSUBS=subns/${IMPORT}__alpha.cmo subns/${IMPORT}__beta.cmo subns/${IMPORT}__gamma.cmo

test.byte: test.ml $(SUBMODULES) ${IMPORT}.cmo ${IMPSUBS} color.cmo
	ocamlfind ocamlc $(LINKALL) -linkpkg -package ounit2 -I ./subns $(SUBMODULES) ${IMPORT}.cmo ${IMPSUBS} color.cmo -o test.byte test.ml

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

${IMPORT}.cmo:
	$(MAKE) -C subns ${IMPORT}.cmo
	$(MAKE) -C subns ${IMPORT}__alpha.cmo
	$(MAKE) -C subns ${IMPORT}__beta.cmo
	$(MAKE) -C subns ${IMPORT}__gamma.cmo

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
	$(MAKE) -C subns clean;
