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

${COMPILER} ${VERBOSE} ${CMT} -c hello.mli; # emits hello.cmi

if [[ -n "${VERBOSE+x}" ]]; then
    ocamlobjinfo hello.cmi;
    ocamlcmt hello.cmti;
fi

${COMPILER} ${VERBOSE} ${CMT} -c hello.ml; # emits hello.cmo, or hello.cmx, hello.o

if [[ -n "${VERBOSE+x}" ]]; then
    ocamlobjinfo hello.${CMEXT};
    ocamlcmt hello.cmt;
fi

# demonstrate that interfaces not required for linking:
rm hello.cmi;

${COMPILER} ${VERBOSE} hello.${CMEXT} -o hello.${EXE};

./hello.${EXE};
