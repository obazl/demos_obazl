COMPILER=ocamlopt
LINKALL=-linkall

OPAQUE=
#-opaque
export OPAQUE

##COLOR=-I color
COLOR=

## In this demo, the Red and Green modules depend on Helper, from
## helper/helper.ml. We add it to the archive, and then we're done
## with it - no need to keep any of its files around. We don't even
## need its cmi file.

## Why not? Presumably the dependency of Red and Green on Helper is
## completely resolved when we build the archive.

## Moral: we only need to distribute the .cmi/.cmx files for the
## public compoonents of the archive, the ones to which clients willl
## want to refer.

## That is, assuming the archive contains all the deps of its
## components. If we do not put helper.cmx in the archive, then we
## have to provide it when we try to link the executable.

## test.cmx needs ounit2; remember that compiling it only uses the cmi
## of ounit2, to link we need the implementation file.
## for that we need ocamlfind again:
exe: test
	ocamlfind $(COMPILER) -w -49 $(LINKALL) \
	-linkpkg -package ounit2 \
	helper.cmx color.cmxa test.cmx \
	-o test.exe;
	./test.exe;

## compile the test as a module, then link it
test: test.ml client
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	${COLOR} \
	color.cmxa \
	client.cmx \
	-c test.ml

client: lncolor
	$(COMPILER) ${COLOR} $(OPAQUE) -c client.ml

## Try omitting some of these ln commands to see the errors produced
lncolor: color
	ln -fs color/red.cmi .;
	ln -fs color/green.cmi .;
	ln -fs color/blue.cmi .;
	ln -fs color/color.cmxa .;
	ln -fs color/color.a .;
	ln -fs color/helper/helper.cmi .;
	ln -fs color/helper/helper.cmx .;
	ln -fs color/helper/helper.o .;

# File "_none_", line 1:
# Error: Cannot find file helper.cmx

.PHONY: color
color:
	${MAKE} -C color;

clean:
	${MAKE} -C color clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
