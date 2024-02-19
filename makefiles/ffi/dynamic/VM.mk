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
libalpha.vm.libstublib.bundled.shared: main libalpha_stubs_bundled_lib_shared_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/libalpha_stubs_bundled_lib_shared_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;
libalpha_stubs_bundled_lib_shared_camlrt.so:
	$(MAKE) -C ../stublibs libalpha_libstubs_bundled_lib_shared_camlrt.so

dllalpha.vm.bundled.shared: main dllalpha_stubs_bundled_lib_shared_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_bundled_lib_shared_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
dllalpha.vm.bundled.shared.dllib: main dllalpha_stubs_bundled_lib_shared_camlrt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_bundled_lib_shared_camlrt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_bundled_lib_shared_camlrt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_bundled_lib_shared_camlrt.so

########################
libalpha.vm.bundled.static: main libalpha_stubs_bundled_lib_static_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/libalpha_stubs_bundled_lib_static_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;
libalpha_stubs_bundled_lib_static_camlrt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled_lib_static_camlrt.so

dllalpha.vm.bundled.static: main dllalpha_stubs_bundled_lib_static_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_bundled_lib_static_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha.vm.bundled.static.dllib: main dllalpha_stubs_bundled_lib_static_camlrt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_bundled_lib_static_camlrt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_bundled_lib_static_camlrt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_bundled_lib_static_camlrt.so

########################
libalpha.vm.unbundled.shared: main libalpha_stubs_unbundled_lib_shared_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/libalpha_stubs_unbundled_lib_shared_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;
libalpha_stubs_unbundled_lib_shared_camlrt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled_lib_shared_camlrt.so

dllalpha.vm.unbundled.shared: main dllalpha_stubs_unbundled_lib_shared_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_unbundled_lib_shared_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# but stublibs must be named 'dllname.so' and passed
# with -dllpath path and -dllib -lname
dllalpha.vm.unbundled.shared.dllib: main dllalpha_stubs_unbundled_lib_shared_camlrt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_unbundled_lib_shared_camlrt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_unbundled_lib_shared_camlrt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_unbundled_lib_shared_camlrt.so

########################
libalpha.vm.unbundled.static: main libalpha_stubs_unbundled_lib_static_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/libalpha_stubs_unbundled_lib_static_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

libalpha_stubs_unbundled_lib_static_camlrt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled_lib_static_camlrt.so

dllalpha.vm.unbundled.static: main dllalpha_stubs_unbundled_lib_static_camlrt.so
	$(COMPILER) \
	-I ../stublibs \
	../stublibs/dllalpha_stubs_unbundled_lib_static_camlrt.so \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha.vm.unbundled.static.dllib: main dllalpha_stubs_unbundled_lib_static_camlrt.so
	$(COMPILER) \
	-dllpath "../stublibs" \
	-dllib -lalpha_stubs_unbundled_lib_static_camlrt \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

dllalpha_stubs_unbundled_lib_static_camlrt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_unbundled_lib_static_camlrt.so

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
