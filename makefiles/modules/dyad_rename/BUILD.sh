#!/bin/sh

# uses ocamlopt by default. to use ocamc: make OCAMLC=1
# to enable verbosity: make VERBOSE=1

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

CMT=-bin-annot

if [[ -n "${VERBOSE+x}" ]]; then
    VERBOSE=-verbose
fi

set -x

${COMPILER} ${VERBOSE} ${CMT} -c b.mli -o C; # emits C.cmi, C.cmti

if [[ -n "${VERBOSE+x}" ]]; then
    ocamlobjinfo C.cmi;
    ocamlcmt C.cmti;
fi

${COMPILER} ${VERBOSE} ${CMT} -cmi-file C.cmi -c a.ml -o C; # emits C.cmt, C.cmx, C.o

if [[ -n "${VERBOSE+x}" ]]; then
    ocamlobjinfo C.${CMEXT};
    ocamlcmt C.cmt;
fi

# demonstrate that interfaces not required for linking:
rm *.cmi;

${COMPILER} ${VERBOSE} C.${CMEXT} -o hello.${EXE};

./hello.${EXE};
