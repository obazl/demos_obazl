export COMPILER=ocamlc

## With shared libs, do not use -custom
## output is a vm executable whose first line is
## '#!/path/to/ocamlrun'

# both static and shared clibs may be directly
# listed on cmd line, without using -ccopt, -cclib.
# WARNING: this does not work for .so files with ocamlopt.
# (Since dllalpha_stubs.so links to static libalpha.a,
# the latter need not be listed here).
# Note: on macos we need the relative path to
# dllalpha_stubs.so (whose "install name" must match)
alpha.vm: main dllalpha_stubs.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
alpha.vm2: main dllalpha_stubs.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

################
main: alphastub
	$(COMPILER) -I ../stublibs alpha.cmo -c main.ml

alphastub:
	$(MAKE) -C ../stublibs alphastub

libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

libalpha.so:
	$(MAKE) -C ../cclibs libalpha.so

####

dllalpha_stubs.so:
	$(MAKE) -C ../stublibs dllalpha_stubs.so


include Makefile
