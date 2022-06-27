include ../Makecolors.mak

## Expected result for make exe:
## Error: No implementations provided for the following modules:
##         B referenced from a.cmx
exe: acmx
	@echo "$(CCRED)Makefile: $(CURDIR)"
	@echo "Expected output: Error: no implementations provided$(CCRESET)"
	ocamlopt a.cmx -o a.exe;  # emits a.exe executable

acmx: b
	@echo "$(CCMAG)Makefile: $(CURDIR)"
	@echo "Expected output: Warning 58 [no-cmx-file]$(CCRESET)"
	ocamlopt -c a.ml; # emits a.cmi, a.cmx, a.o

b:
	ocamlopt -c b.mli; # emits b.cmi


clean:
	@-rm -f *.cmx *.o *.cmi *.exe
