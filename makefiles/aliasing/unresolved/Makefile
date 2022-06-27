COMPILER=ocamlopt

## Expected output:
# File "test.ml", line 4, characters 38-45:
# 4 | let test2 _ = assert_equal "Hello B" (A.B.msg)
#                                           ^^^^^^^
# Error: Unbound module A.B

include ../../Makecolors.mak

test: a
	@echo "$(CCRED)Makefile: $(CURDIR)"
	@echo "Expected output: Error unbound module$(CCRESET)"
	-ocamlfind $(COMPILER) -linkpkg -package ounit2 \
	-c test.ml;  # emits test.cmi, test.cmx, test.o

a: b
	$(COMPILER) -c a.ml;  # emits a.cmi, a.cmx, a.o

b:
	$(COMPILER) -c b.ml;  # emits a.cmi, a.cmx, a.o

clean:
	@-rm -f *.cmi *.cmx *.o *.exe
	@-rm -f oUnit*
