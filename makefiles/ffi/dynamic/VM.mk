COMPILER=ocamlc

## With shared libs, do not use -custom

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib.
# WARNING: this does not work for .so files with ocamlopt.
alpha.vm: alphastub dllalpha_stubs
	$(COMPILER) \
	dllalpha_stubs.so \
	cclibs/libalpha.a \
	alphastub.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
alpha.vm2: alphastub dllalpha_stubs
	$(COMPILER) \
	-dllpath "." \
	-dllib -lalpha_stubs \
	alphastub.cmo \
	-o alpha.vm;


include Makefile
