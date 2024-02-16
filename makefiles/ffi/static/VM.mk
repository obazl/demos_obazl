export COMPILER=ocamlc

## Flag '-custom' tells the compiler to build a custom
## runtime and embed it in the executable output.

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib:
alpha.vm: main libalpha.a libalpha_stubs.a
	$(COMPILER) -custom \
	stublibs/libalpha_stubs.a \
	cclibs/libalpha.a \
	-I stublibs alpha.cmo \
	main.cmo \
	-custom \
	-o alpha.vm;

alpha.vm.bundled: main libalpha_stubs_bundled.a
	$(COMPILER) -custom \
	stublibs/libalpha_stubs_bundled.a \
	-I stublibs alpha.cmo \
	main.cmo \
	-custom \
	-o alpha.vm;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.vm.cclib: main libalpha.a libalpha_stubs.a
	$(COMPILER) -custom \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	-I stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

alpha.vm.cclib.bundled: main libalpha.a libalpha_stubs_bundled.a
	$(COMPILER) -custom \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled \
	-I stublibs alpha.cmo \
	main.cmo \
	-o alpha.vm;

################
main: alphastub
	$(COMPILER) -I stublibs alpha.cmo -c main.ml

alphastub:
	$(MAKE) -C stublibs alphastub

libalpha.a:
	$(MAKE) -C cclibs libalpha.a

libalpha_stubs.a:
	$(MAKE) -C stublibs libalpha_stubs.a

libalpha_stubs_bundled.a:
	$(MAKE) -C stublibs libalpha_stubs_bundled.a

include Makefile
