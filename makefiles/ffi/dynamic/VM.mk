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
alpha.vm.bundled.shared: main dllalpha_stubs_bundled_lib_shared_rt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_bundled_lib_shared_rt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
alpha.vm.bundled.shared.dllib: main dllalpha_stubs_bundled_lib_shared_rt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_bundled_lib_shared_rt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_bundled_lib_shared_rt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_bundled_lib_shared_rt.so

########################
alpha.vm.bundled.static: main dllalpha_stubs_bundled_lib_static_rt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_bundled_lib_static_rt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

alpha.vm.bundled.static.dllib: main dllalpha_stubs_bundled_lib_static_rt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_bundled_lib_static_rt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_bundled_lib_static_rt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_bundled_lib_static_rt.so

########################
alpha.vm.unbundled.shared: main dllalpha_stubs_unbundled_lib_shared_rt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_unbundled_lib_shared_rt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
alpha.vm.unbundled.shared.dllib: main dllalpha_stubs_unbundled_lib_shared_rt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_unbundled_lib_shared_rt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_unbundled_lib_shared_rt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_unbundled_lib_shared_rt.so

########################
alpha.vm.unbundled.static: main dllalpha_stubs_unbundled_lib_static_rt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_unbundled_lib_static_rt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

alpha.vm.unbundled.static.dllib: main dllalpha_stubs_unbundled_lib_static_rt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_unbundled_lib_static_rt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_unbundled_lib_static_rt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_unbundled_lib_static_rt.so

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

include Makefile
