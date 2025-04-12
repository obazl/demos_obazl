LINK_LAZY=-no-alias-deps

## The driver target depends on all modules. We've listed them here in
## postorder traversal order, which would be required if we were not
## using -no-alias-deps. Since we are, the compilation of the
## namespace modules (containing the alias statements) is decoupled
## from the compilation of the component modules, so they can be
## listed in any order.

ALL= \
Alpha__Beta1__Gamma__Goodbye.cmo \
Alpha__Beta1__Gamma__Hello.cmo \
Alpha__Beta1__Gamma.cmo \
Alpha__Beta1.cmo \
Alpha__Beta2__Gamma__Hola.cmo \
Alpha__Beta2__Gamma__Adios.cmo \
Alpha__Beta2__Gamma.cmo \
Alpha__Beta2.cmo \
Alpha__Gamma__Howdy.cmo \
Alpha__Gamma.cmo \
Alpha.cmo

## With -no-alias-deps, we get "lazy linking" - we do not need to list
## the linkage deps of the namespacing (i.e. aliasing) modules on the
## compile command line. Linking will be deferred.

default: driver
	./Driver.exe

driver: ${ALL}
	ocamlc -w -31 ${ALL} Driver.ml -o Driver.exe

## The leafs have no dependencies, so we can build them all at once in any order:
leafs: Alpha__Beta1__Gamma__Hello.cmo \
	Alpha__Beta1__Gamma__Goodbye.cmo \
	Alpha__Beta2__Gamma__Hola.cmo \
	Alpha__Beta2__Gamma__Adios.cmo \
	Alpha__Gamma__Howdy.cmo

## We can build all the namespace modules at once using -no-alias-deps. In any order:
nss: Alpha.cmo \
	Alpha__Beta1.cmo \
	Alpha__Beta1__Gamma.cmo \
	Alpha__Beta2.cmo \
	Alpha__Beta2__Gamma.cmo \
	Alpha__Gamma.cmo \
	Alpha__Gamma__Howdy.cmo

## First, the leaf nodes (submodules of the ns), which have no dependencies.
Alpha__Beta1__Gamma__Hello.cmo:
	ocamlc -c Alpha__Beta1__Gamma__Hello.ml

Alpha__Beta1__Gamma__Goodbye.cmo:
	ocamlc -c Alpha__Beta1__Gamma__Goodbye.ml

## Now the parent. It contains alias statements so it depends on the
## leaf nodes. Without `-no-alias-deps`, we would need to list these
## dependencies. NOTE: using `-no-alias-deps` means that building the
## namespace module does _NOT_ trigger a build of its dependencies, as
## it would if we listed the deps explicitly. So they must be built
## separately.

Alpha__Beta1__Gamma.cmo:  #  Alpha__Beta1__Gamma__Hello.cmo Alpha__Beta1__Gamma__Goodbye.cmo
	ocamlc -c ${LINK_LAZY} Alpha__Beta1__Gamma.ml

Alpha__Beta1.cmo: # Alpha__Beta1__Gamma.cmo
	ocamlc -c ${LINK_LAZY} Alpha__Beta1.ml

## and similarly for the rest...

################
Alpha__Beta2__Gamma__Hola.cmo:
	ocamlc -c Alpha__Beta2__Gamma__Hola.ml

Alpha__Beta2__Gamma__Adios.cmo:
	ocamlc -c Alpha__Beta2__Gamma__Adios.ml

Alpha__Beta2__Gamma.cmo:  # Alpha__Beta2__Gamma__Hola.cmo Alpha__Beta2__Gamma__Adios.cmo
	ocamlc -c ${LINK_LAZY} Alpha__Beta2__Gamma.ml

Alpha__Beta2.cmo:  # Alpha__Beta2__Gamma.cmo
	ocamlc -c ${LINK_LAZY} Alpha__Beta2.ml

################
Alpha__Gamma__Howdy.cmo:
	ocamlc -c Alpha__Gamma__Howdy.ml

Alpha__Gamma.cmo:  #  Alpha__Gamma__Howdy.cmo
	ocamlc -c ${LINK_LAZY} Alpha__Gamma.ml

################
 Alpha.cmo:  # Alpha__Beta1.cmo Alpha__Beta2.cmo Alpha__Gamma.cmo
	ocamlc -c ${LINK_LAZY} Alpha.ml

clean:
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
	-rm *.cma 2>/dev/null || true;
	-rm *.cmx 2>/dev/null || true;
	-rm *.cmxa 2>/dev/null || true;
