COMPILER=ocamlc

## Flag '-custom' tells the compiler to build a custom
## runtime and embed it in the executable output.

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib:
alpha.vm: alphastub libalpha_stubs
	$(COMPILER) -custom \
	libalpha_stubs.a \
	cclibs/libalpha.a \
	alphastub.cmo \
	-custom \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.vm2: alphastub libalpha_stubs
	$(COMPILER) -custom \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alphastub.cmo \
	-o alpha.vm;


include Makefile
