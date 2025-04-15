#!/bin/sh

COMPILER=ocamlc
# ocamlc, ocamlopt
CMEXT=cmo
# cmo, cmx
ARCH=cma
# cma, cmxa
EXE=byte
# byte, exe

NS_A=Foo
NS_B=Bar
PRIVATE_NS=Private__

DBG=
# "-g"
LINKALL=
NOALIASDEPS="-no-alias-deps"
NOWARN="-w -49"

echo "BUILDING..."

set -x

## First: helper ns-resolver Private.ml
echo "module X = ${PRIVATE_NS}x"   >  ${PRIVATE_NS}.ml

# compile helper ns-resolver
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} -c ${PRIVATE_NS}.ml;

# compile helper module
${COMPILER} ${DBG} ${LINKALL} -c x.ml -o ${PRIVATE_NS}x;

## Next: public ns Foo (${NS_A})
NS_A_COMPONENTS="${NS_A}.${CMEXT} ${NS_A}__a.${CMEXT} ${NS_A}__b.${CMEXT}"
echo "module A  = ${NS_A}__a"  >  ${NS_A}.ml
echo "module B  = ${NS_A}__b"  >> ${NS_A}.ml

# compile resolver module for public ns Foo
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} ${LINKALL}  -c ${NS_A}.ml;

# compile submodules of public ns Foo
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -c a.ml -o ${NS_A}__a;
# B depends on A,
# so we need to -open the ns-resolver (Foo.ml) to compile them.
# Without '-open Foo' we get 'Unbound module' errors
# B also depends on private module Private__x
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -I ./ -open ${PRIVATE_NS} -open ${NS_A} -c b.ml -o ${NS_A}__b;

## Next: public ns Bar (${NS_B})
NS_B_COMPONENTS="${NS_B}.${CMEXT} ${NS_B}__c.${CMEXT} ${NS_B}__d.${CMEXT}"
echo "module C  = ${NS_B}__c"  >  ${NS_B}.ml
echo "module D  = ${NS_B}__d"  >> ${NS_B}.ml

# compile resolver module for public ns Bar
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} ${LINKALL}  -c ${NS_B}.ml;

# compile submodules of public ns Bar
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -c c.ml -o ${NS_B}__c;
# D depends on C and private X
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -I ./ -open ${PRIVATE_NS} -open ${NS_B} -c d.ml -o ${NS_B}__d;

# archive foobar. Must include the implementation of Private__x,
# but not the ns resolver Private__:
${COMPILER} -a ${PRIVATE_NS}x.${CMEXT} ${NS_A_COMPONENTS} ${NS_B_COMPONENTS} -o foobar.${ARCH}

## now hide the helper module by removing its .cmi file
rm ${PRIVATE_NS}x.cmi

## show that cmi file is required even for exported submodules.
# rm Foo__b.cmi
## This will cause:
## 4 | let test2 test_ctxt = assert_equal "ABC" (Foo.B.v)
##                                               ^^^^^^^
## Error: The module Foo.B is an alias for module Foo__b, which is missing

# Now the test executable.
# NB: the archive foo.cma is not enough, we also need
# the cmi files. That is, the modules in the archive
# no longer need cmi files - Foo__b can use the "hidden"
# Private_x module because its in the archive - but anything
# using the archive from the outside (like test.ml) must
# go through cmi files.
ocamlfind ${COMPILER} ${LINKALL} \
          ${DBG} \
          ${NOALIASDEPS} \
          -linkpkg -package ounit2 \
          -I ./ \
          foobar.${ARCH} \
          -o test.${EXE} \
          test.ml
