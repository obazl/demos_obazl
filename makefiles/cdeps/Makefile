## cdeps

## demonstrates that compile-time module dependencies can be resolved
## with cmi files only. If the cmx file is missing, the compiler will
## issue a warning but the compile will succeed.

## however, if we then try to link the compiled module into an
## executable the compiler with throw an exception, see below.

## Expected result:
# Warning 58 [no-cmx-file]: no cmx file was found in path for module B, and its interface was not compiled with -opaque

acmx: acmi bcmi
	ocamlopt -c a.ml; # emits a.cmx, a.o

acmi:
	ocamlopt -c a.mli; # emits a.cmi

bcmi:
	ocamlopt -c b.mli; # emits b.cmi


## Expected result for make exe:
## Error: No implementations provided for the following modules:
##         B referenced from a.cmx
exe: acmx
	ocamlopt a.cmx -o a.exe;  # emits a.exe executable

clean:
	@-rm -f *.cmx *.o *.cmi *.exe
