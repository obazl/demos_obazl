export COMPILER=ocamlc

## Flag '-custom' tells the compiler to build a custom
## runtime and embed it in the executable output.

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib:
alpha.vm.bundled: main libalpha_stubs_bundled.a
	$(COMPILER) -custom \
	../stublibs/libalpha_stubs_bundled.a \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;
libalpha_stubs_bundled.a:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled.a

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
# in this case, both libalpha_stubs_bundle.a and alpha.cmo
# are in ../stublibs, so -I suffices (-ccopt -L not needed)
alpha.vm.bundled.cclib: main libalpha.a libalpha_stubs_bundled.a
	$(COMPILER) -custom \
	-I ../stublibs \
	-cclib -lalpha_stubs_bundled \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

###################
alpha.vm.unbundled: main libalpha.a libalpha_stubs_unbundled.a
	$(COMPILER) -custom \
	../stublibs/libalpha_stubs_unbundled.a \
	../cclibs/libalpha.a \
	-I ../stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;
libalpha_stubs_unbundled.a:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled.a

# here, because stublib does not embed foreign lib libalpha.a,
# we must list the latter on the command line:
alpha.vm.unbundled.cclib: main libalpha.a libalpha_stubs_unbundled.a
	$(COMPILER) -custom \
	-ccopt "-L../cclibs" \
	-cclib -lalpha \
	-I ../stublibs \
	-cclib -lalpha_stubs_unbundled \
	alpha.cmo \
	main.cmo \
	-o alpha.vm;

################
main: alphastub
	$(COMPILER) -I ../stublibs alpha.cmo -c main.ml

alphastub:
	$(MAKE) -C ../stublibs alphastub

libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

include Makefile
