NS=Greek

# Here we generate greek.ml (ns-resolver module) at build time.

NOALIASDEPS=-no-alias-deps

LINKALL=

# We generate prefixes for submodules
SUBMODULES=${NS}__alpha.cmo ${NS}__beta.cmo ${NS}__gamma.cmo

subtest.byte: subtest.ml $(SUBMODULES) ${NS}.cmo
	ocamlfind ocamlc $(LINKALL) -linkpkg -package ounit2 $(SUBMODULES) ${NS}.cmo -o subtest.byte subtest.ml

# -w -49 eliminates warning:
# Warning 49 [no-cmi-file]: no cmi file was found in path for module ...
NOWARN=-w -49
${NS}.cmo: ${NS}.ml
	ocamlc ${NOWARN} -c ${NOALIASDEPS} $(LINKALL) ${NS}.ml

${NS}.ml:
	echo "module Alpha   = ${NS}__alpha"   >  ${NS}.ml
	echo "module Beta    = ${NS}__beta" >> ${NS}.ml
	echo "module Gamma   = ${NS}__gamma"  >> ${NS}.ml

## submodules depend on the ns module
${NS}__alpha.cmo: alpha.ml ${NS}.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open ${NS} -c alpha.ml -o ${NS}__alpha

${NS}__beta.cmo: beta.ml ${NS}.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open ${NS} -c beta.ml -o ${NS}__beta

${NS}__gamma.cmo: gamma.ml ${NS}.cmo
	ocamlc $(LINKALL) ${NOALIASDEPS} -open ${NS} -c gamma.ml -o ${NS}__gamma

clean:
	-rm ${NS}.ml 2>/dev/null || true;
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
	-rm *.cma 2>/dev/null || true;
	-rm *.cmx 2>/dev/null || true;
	-rm *.cmxa 2>/dev/null || true;
	-rm *.byte 2>/dev/null || true;
	-rm *.log 2>/dev/null || true;
	-rm *.cache 2>/dev/null || true;
