export COMPILER=ocamlopt
SFX="cmx"
LINKALL=

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib.

# here libalpha_stubs.a is just the stubs so we must
# link both archives:
alpha.sys: main libalpha.a libalpha_stubs.a
	$(COMPILER) \
	stublibs/libalpha_stubs.a \
	cclibs/libalpha.a \
	-I stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

# here libalpha_stubs_bundled.a contains libalph.a so
# we only link it:
alpha.sys.bundled: main libalpha_stubs_bundled.a
	$(COMPILER) \
	stublibs/libalpha_stubs_bundled.a \
	-I stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;


# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.sys.cclib: main libalpha.a libalpha_stubs.a
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	-I stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

alpha.sys.cclib.bundled: main libalpha_stubs_bundled.a
	$(COMPILER) \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled \
	-I stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

################
# now build against shared foriegn lib (libalpha.so)
alpha.sys.cclib.x: main libalpha.a libalpha_stubs.a
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	-I stublibs alpha.cmx \
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

libalpha_stubs.a:
	$(MAKE) -C ../stublibs libalpha_stubs.a

libalpha_stubs_bundled.a:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled.a

libalpha_stubs_x.a:
	$(MAKE) -C ../stublibs libalpha_stubs_x.a

# include Makefile

