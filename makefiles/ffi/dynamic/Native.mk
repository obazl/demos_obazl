export COMPILER=ocamlopt
SFX="cmx"
LINKALL=

# Macos: DSOs and native executables embed paths to dso deps,
# so we do not need -I or --ccopt -L for those.
# But to build our executable we must pass
# -cclib <stubslib>
# (whose path is embedded in the executable;
# run "otool -L <exe>" to see)

# static clibs may be directly listed on cmd line,
# without using -ccopt, -cclib, but shared libs
# must be passed with -cclib -lname.
alpha.sys: main libalpha_stubs.so
	$(COMPILER) \
	-cclib -lalpha_stubs \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

alpha.sys.bundled: main libalpha_stubs_bundled.so
	$(COMPILER) \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

# static clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.sys2: main libalpha_stubs
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alpha.cmx \
	-o alpha.sys;

# BUT: we cannot use the dll<name>.so that we
# use for vm executables.
# ocamlopt does not understand -dllpath or -dllib,
# and -l<name> will search for lib<name>.so, not dll<name>.so;
# so this would fail with "ld: library 'alpha_stubs' not found":
alpha.sys3: main dllalpha_stubs
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alpha.cmx \
	-o alpha.sys;

# furthermore putting a .so file directly on the cmd line
# results in "don't know what to do with <name>.so"
# (for native compilers only)

################
main: alphastub
	$(COMPILER) -I ../stublibs alpha.cmx -c main.ml

alphastub:
	$(MAKE) -C ../stublibs alphastub

libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

libalpha.so:
	$(MAKE) -C ../cclibs libalpha.so

####

libalpha_stubs.so:
	$(MAKE) -C ../stublibs libalpha_stubs.so

libalpha_stubs_bundled.so:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled.so

# libalpha_stubs_x.so:
# 	$(MAKE) -C ../stublibs libalpha_stubs_x.so

include Makefile

