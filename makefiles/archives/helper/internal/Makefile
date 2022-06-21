COMPILER=ocamlopt
LINKALL=-linkall

## Either pass -opaque or disable warning 58
OPAQUE=
#-opaque
export OPAQUE

WARN_NO_CMX=-w -58
export WARN_NO_CMX

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

exe: test
	ocamlfind $(COMPILER) -w -49 $(LINKALL) \
	-linkpkg -package ounit2 \
	color.cmxa test.cmx \
	-o test.exe;
	./test.exe;

## compile the test as a module, then link it
test: test.ml client
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	${COLOR} \
	color.cmxa \
	client.cmx \
	$(WARN_NO_CMX) \
	-c test.ml

client: lncolor
	$(COMPILER) ${COLOR} $(OPAQUE) $(WARN_NO_CMX) -c client.ml

## Try omitting some of these ln commands to see the errors produced
lncolor: color
	ln -fs color/red.cmi .;
	ln -fs color/green.cmi .;
	ln -fs color/blue.cmi .;
	ln -fs color/color.cmxa .;
	ln -fs color/color.a .;

.PHONY: color
color:
	${MAKE} -C color;

clean:
	${MAKE} -C color clean;
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
	@-rm -f oUnit-suite*
