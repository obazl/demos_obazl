COMPILER=ocamlopt
LINKALL=

# test: test.ml extrinsic
# 	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
# 	extrinsic.cmx \
# 	-o test.exe test.ml;
# 	./test.exe;

general: general.ml
	$(COMPILER) -o general.out general.ml;
	./general.out

intrinsic: intrinsic.ml
	$(COMPILER) -o intrinsic.out intrinsic.ml;

extrinsic: extrinsic.ml
	$(COMPILER) -o extrinsic.out extrinsic.ml;

################################################################
clean:
	@-rm -f *.cmi *.cmx *.o *.cmo *.out *.exe
	@-rm -f oUnit*;
