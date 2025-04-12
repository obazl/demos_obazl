#!/bin/sh

COMPILER=ocamlopt
# ocamlc, ocamlopt
CMEXT=cmx
# cmo, cmx
ARCH=cmxa
# cma, cmxa
EXE=exe
# byte, exe

PUBLIC_NS=Foo
PRIVATE_NS=Foo00

DBG=
# "-g"
LINKALL=
NOALIASDEPS="-no-alias-deps"
NOWARN="-w -49"

echo "BUILDING..."

set -x

## First: helper ns-resolver FooImpl.ml
echo "module C   = ${PRIVATE_NS}__c"   >  ${PRIVATE_NS}.ml

# compile helper ns-resolver
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} ${LINKALL} -c ${PRIVATE_NS}.ml;

# compile helper
${COMPILER} ${DBG} ${LINKALL} -c c.ml -o ${PRIVATE_NS}__c;

## Next: public ns

echo "module A  = ${PUBLIC_NS}__a"  >  ${PUBLIC_NS}.ml
echo "module B  = ${PUBLIC_NS}__b"  >> ${PUBLIC_NS}.ml

# compile public ns-resolver module
${COMPILER} ${DBG} ${NOWARN} ${NOALIASDEPS} ${LINKALL}  -c ${PUBLIC_NS}.ml;

# compile submodules of public ns
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -c a.ml -o ${PUBLIC_NS}__a;
# B depends on A,
# so we need to -open the ns-resolver (Foo.ml) to compile them.
# Without '-open Foo' we get 'Unbound module' errors
# B also depends on C
${COMPILER} ${DBG} ${LINKALL} ${NOALIASDEPS} -I ./ -open ${PRIVATE_NS} -open ${PUBLIC_NS} -c b.ml -o ${PUBLIC_NS}__b;

# archive:
${COMPILER} -a ${PRIVATE_NS}__c.${CMEXT} ${PUBLIC_NS}.${CMEXT} ${PUBLIC_NS}__a.${CMEXT} ${PUBLIC_NS}__b.${CMEXT} -o foo.${ARCH}

## now hide the helper module by removing its .cmi file
rm ${PRIVATE_NS}__c.cmi

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
# fooimpl_c module because its in the archive - but anything
# using the archive from the outside (like test.ml) must
# go through cmi files.
ocamlfind ${COMPILER} ${LINKALL} \
          ${DBG} \
          ${NOALIASDEPS} \
          -linkpkg -package ounit2 \
          -I ./ \
          foo.${ARCH} \
          -o test.${EXE} \
          test.ml
