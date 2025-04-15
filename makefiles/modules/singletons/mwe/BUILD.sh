#!/bin/sh

# uses ocamlopt by default. to use ocamc: make OCAMLC=1
# to enable verbosity: make VERBOSE=1
# to enable debugging: make DBG=1 OCAMLC=1

if [[ -n "${VERBOSE+x}" ]]; then
    VERBOSE=-verbose
fi


if [[ -n "${OCAMLC+x}" ]]; then
    COMPILER=ocamlc
    CMEXT=cmo
    ARCH=cma
    EXE=byte
else
    COMPILER=ocamlopt
    CMEXT=cmx
    ARCH=cmxa
    EXE=exe
fi

if [[ -n "${DBG+x}" ]]; then
    DBG=-g
fi
LINKALL=

echo "BUILDING..."

set -x

# Compile module A
${COMPILER} ${DBG} ${VERBOSE} -c a.ml;

# Compile module Test.
# 'ocamlfind -package ounit2' adds -I directives to the
# cmd line for ounit2 and all of its deps;
# this exposes their .cmi files
ocamlfind ${COMPILER} \
          ${DBG} \
          ${VERBOSE} \
	  -package ounit2 \
	  -c test.ml;

# To demonstrate that linking an executable does
# not require intefaces:
rm *.cmi;

# Build executable. Link units (structures) must be listed in
# reverse dependency order. E.g. Test depends on A,
# so a.cmo precedes test.cmo.
# 'ocamlfind -linkpkg ounit2' does two things:
# 1) adds -I directives to the cmd line for ounit2 and
#    all of its deps;
# 2) adds the archives of ounit2 and its deps to the cmd line
#    e.g. ${SWITCH_PREFIX}/lib/ounit2/oUnit.cma
ocamlfind ${COMPILER} \
          ${DBG} \
	  ${VERBOSE} \
	  -linkpkg -package ounit2 \
	  a.${CMEXT} \
	  test.${CMEXT} \
	  -o test.${EXE};

# run the test:
if [[ -n "${DBG+x}" ]]; then
    ocamldebug ./test.${EXE}
else
    ./test.${EXE}
fi
