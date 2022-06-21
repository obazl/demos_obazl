COMPILER=ocamlopt

export OPAQUE

# HELPER_DIR=
# HELPER_CMX=

HELPER_DIR=-I helper
HELPER_CMX=helper.cmx

# To prove that the [.cmx,o] files are not needed after the archive is
# built:
archive: color.cmxa
	rm -f *cmx *.o;
	rm -f  helper/*cmi helper/*cmx helper/*o;

## WARNING: helper.cmx must come before modules that depend on it:
color.cmxa: r g b
	$(COMPILER) $(HELPER_DIR) $(HELPER_CMX) red.cmx green.cmx blue.cmx -a -o color.cmxa

r: helper red.ml
	$(COMPILER) $(HELPER_DIR) $(OPAQUE) $(WARN_NO_CMX) -c red.ml

g: helper green.ml
	$(COMPILER) $(HELPER_DIR) $(OPAQUE) $(WARN_NO_CMX) -c green.ml

b: helper blue.ml
	$(COMPILER) $(OPAQUE) $(WARN_NO_CMX) -c blue.ml

.PHONY: helper
helper:
	$(MAKE) -C helper
	ln -fs helper/helper.cmi .;

clean:
	$(MAKE) -C helper clean
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe
