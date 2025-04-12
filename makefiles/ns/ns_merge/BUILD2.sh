#!/bin/sh

NS=Color
SUBNS=Greek

LINKALL=
NOALIASDEPS="-no-alias-deps"
NOWARN="-w -49"

echo "BUILDING..."

## Sub ns first

echo "module Alpha   = ${SUBNS}__alpha"   >  ${SUBNS}.ml
echo "module Beta    = ${SUBNS}__beta"   >> ${SUBNS}.ml
echo "module Gamma   = ${SUBNS}__gamma"  >> ${SUBNS}.ml

set -x
# compile subns ns-resolver module
ocamlc ${NOWARN} -c ${NOALIASDEPS} ${LINKALL} ${SUBNS}.ml;

# compile submodules of subns
ocamlc ${LINKALL} ${NOALIASDEPS} -c subns/alpha.ml -o ${SUBNS}__alpha;
# Gamma depends on Beta depends on Alpha,
# so we need to -open the ns-resolver (Greek.ml) to compile them.
# Without '-open Greek' we get 'Unbound module' errors
ocamlc ${LINKALL} ${NOALIASDEPS} -open ${SUBNS} -c subns/beta.ml -o ${SUBNS}__beta;
ocamlc ${LINKALL} ${NOALIASDEPS} -open ${SUBNS} -c subns/gamma.ml -o ${SUBNS}__gamma;

## Now the root ns-resolver Color.ml
echo "module Red   = ${NS}__red"   >  ${NS}.ml
echo "module Green = ${NS}__green" >> ${NS}.ml
echo "module Blue  = ${NS}__blue"  >> ${NS}.ml
# merge the subns so that the Greek. prefix not needed:
# Depend on the Greek ns-resolver:
echo "module Alpha = ${SUBNS}.Alpha"  >> ${NS}.ml
echo "module Beta  = ${SUBNS}.Beta"   >> ${NS}.ml
echo "module Gamma = ${SUBNS}.Gamma"  >> ${NS}.ml

# This means that to resolve Color.Alpha, the compiler
# will look for Greek, the ns-resolver.
# Had we written
# echo "module Alpha = ${SUBNS}__Alpha"  >> ${NS}.ml
# (as we do in BUILD1.sh) then the compiler would
# search for Greek__Alpha directly, with no need
# to consult the ns-resolver.

# compile Color ns-resolver
ocamlc ${NOWARN} -c ${NOALIASDEPS} ${LINKALL} ${NS}.ml;

# compile direct submodules of ns Color
ocamlc ${LINKALL} ${NOALIASDEPS} -open ${NS} -c red.ml -o ${NS}__red;
ocamlc ${LINKALL} ${NOALIASDEPS} -open ${NS} -c green.ml -o ${NS}__green;
ocamlc ${LINKALL} ${NOALIASDEPS} -open ${NS} -c blue.ml -o ${NS}__blue;

# Now the test executable. Both the main ns-resolver Color
# and the subns resolver Greek are required:
ocamlfind ocamlc ${LINKALL} -linkpkg -package ounit2 \
          ${NS}.cmo \
          ${NS}__red.cmo \
          ${NS}__green.cmo \
          ${NS}__blue.cmo \
          ${SUBNS}.cmo \
          ${SUBNS}__alpha.cmo \
          ${SUBNS}__beta.cmo \
          ${SUBNS}__gamma.cmo \
          -o test.byte \
          test.ml
