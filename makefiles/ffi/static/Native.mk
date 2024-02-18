export COMPILER=ocamlopt
SFX="cmx"
LINKALL=

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib.

# here libalpha_stubs.a is just the stubs so we must
# link both archives:
alpha.sys.unbundled: main libalpha.a libalpha_stubs_unbundled.a
	$(COMPILER) \
	../stublibs/libalpha_stubs_unbundled.a \
	../cclibs/libalpha.a \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

libalpha_stubs_unbundled.a:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled.a

# now build against shared foreign lib (libalpha.so)
alpha.sys.unbundled.cclib: main libalpha.a libalpha_stubs_unbundled.a
	$(COMPILER) \
	-ccopt "-L../cclibs" \
	-cclib -lalpha \
	-I ../stublibs \
	-cclib -lalpha_stubs_unbundled \
	alpha.cmx \
	main.cmx \
	-o alpha.sys;

# here libalpha_stubs_bundled.a contains libalph.a so
# we only link the former:
alpha.sys.bundled: main libalpha_stubs_bundled.a
	$(COMPILER) \
	../stublibs/libalpha_stubs_bundled.a \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;
libalpha_stubs_bundled.a:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled.a

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.sys.bundled.cclib: main libalpha_stubs_bundled.a
	$(COMPILER) \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

################
main: alphastub
	$(COMPILER) -I ../stublibs alpha.cmx -c main.ml

alphastub:
	$(MAKE) -C ../stublibs alphastub

libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

libalpha.so:
	$(MAKE) -C ../cclibs libalpha.so

libalpha_stubs_x.a:
	$(MAKE) -C ../stublibs libalpha_stubs_x.a

# include Makefile

