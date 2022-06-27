## Expected:

# Error: Could not find the .cmi file for interface hello.mli.

# To fix, just compile the mli file first.

include ../../../Makecolors.mak

all:
	@echo "$(CCRED)Makefile: $(CURDIR)"
	@echo "Expected output: Error: could not find cmi file$(CCRESET)"
	ocamlopt -c hello.ml;

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
