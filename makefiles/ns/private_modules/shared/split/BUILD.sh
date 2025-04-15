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

## Any name will do for the private ns, since it will not
## be exported:
PRIVATE_NS=Private

DBG=
# "-g"
LINKALL=
NOALIASDEPS="-no-alias-deps"
NOWARN="-w -49"

echo "BUILDING..."

set -x

## First: helper ns-resolver Private.ml
PRIVATE_NS_COMPONENTS="${PRIVATE_NS}.${CMEXT} ${PRIVATE_NS}__x.${CMEXT}"
echo "module X = ${PRIVATE_NS}__x"   >  ${PRIVATE_NS}.ml

# compile helper ns-resolver
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} -c ${PRIVATE_NS}.ml;

# compile helper module
${COMPILER} ${DBG} ${LINKALL} -c x.ml -o ${PRIVATE_NS}__x;

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

## Now if we run 'ocamlobjinfo' against Foo__b.cmi and
## Foo__b.cmo, we will see that the interfaces for Private
## and Private__x are imported, and that Foo__b.cmo lists
## Private__x as a "Required global". So when we go to
## link Foo__b we will need Private__x.cmo, but we will
## not need either Private.cmi or Private__x.cmi. Similarly
## for Bar__d below.

# archive foo. Must NOT include ${PRIVATE_NS}__x.${CMEXT}
# i.e. Private__x
${COMPILER} -a ${NS_A_COMPONENTS} -o foo.${ARCH}

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

# archive bar. Must NOT include ${PRIVATE_NS}__x.${CMEXT}
# i.e. Private__x
${COMPILER} -a ${NS_B_COMPONENTS} -o bar.${ARCH}

## now hide the helper module by removing its .cmi file
rm ${PRIVATE_NS}__x.cmi
## and for good measure, we also remove the ns resolver
## for the private ns. It is no longer needed, since
## the modules that use it are already compiled.
rm ${PRIVATE_NS}.cmi
rm ${PRIVATE_NS}.${CMEXT}
## We're left with only the implementation file for the
## private module, which is all we need for linking.

## show that cmi file is required even for exported submodules.
# rm Foo__b.cmi
## This will cause:
## 4 | let test2 test_ctxt = assert_equal "ABC" (Foo.B.v)
##                                               ^^^^^^^
## Error: The module Foo.B is an alias for module Foo__b, which is missing

## Now the test executable.
## Both foo.cma and bar.cma contain a module that depends
## on private module Private__x. If we were to include that
## module in both archives, we would get an error:
# File "test.ml", line 1:
# Error: Files bar.cma(Private__x) and foo.cma(Private__x)
#        both define a module named Private__x
## So we must link Private__x separately; i.e. both
## archive files depend on it.

ocamlfind ${COMPILER} ${LINKALL} \
          ${DBG} \
          ${NOALIASDEPS} \
          -linkpkg -package ounit2 \
          -I ./ \
          ${PRIVATE_NS}__x.${CMEXT} \
          foo.${ARCH} \
          bar.${ARCH} \
          -o test.${EXE} \
          test.ml
