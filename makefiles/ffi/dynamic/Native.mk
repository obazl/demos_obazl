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
alpha.sys.unbundled.shared: main libalpha_stubs_unbundled_lib_shared_rt.so
	$(COMPILER) \
	-cclib -lalpha_stubs_unbundled_lib_shared_rt \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

alpha.sys.unbundled.static: main libalpha_stubs_unbundled_lib_static_rt.so
	$(COMPILER) \
	-cclib -lalpha_stubs_unbundled_lib_static_rt \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

alpha.sys.bundled.shared: main libalpha_stubs_bundled_lib_shared_rt.so
	$(COMPILER) \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled_lib_shared_rt \
	-I ../stublibs alpha.cmx \
	main.cmx \
	-o alpha.sys;

alpha.sys.bundled.static: main libalpha_stubs_bundled_lib_static_rt.so
	$(COMPILER) \
	-ccopt "-L." \
	-cclib -lalpha_stubs_bundled_lib_static_rt \
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
# so this would fail with "ld: library 'alpha_stubs..etc' not found":
alpha.sys.broken: main dllalpha_stubs_bundled_lib_shared_rt.so
	$(COMPILER) \
	-ccopt "-L../cclibs" \
	-cclib -lalpha \
	-ccopt "-L../stublibs" \
	-cclib -lalpha_stubs_bundled_lib_shared_rt \
	-I ../stublibs \
	alpha.cmx \
	-o alpha.sys;

dllalpha_stubs_bundled_lib_shared_rt.so:
	$(MAKE) -C ../stublibs dllalpha_stubs_bundled_lib_shared_rt.so

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

#### native
libalpha_stubs_unbundled_lib_shared_rt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled_lib_shared_rt.so

libalpha_stubs_unbundled_lib_static_rt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_unbundled_lib_static_rt.so

libalpha_stubs_bundled_lib_shared_rt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled_lib_shared_rt.so

libalpha_stubs_bundled_lib_static_rt.so:
	$(MAKE) -C ../stublibs libalpha_stubs_bundled_lib_static_rt.so

# libalpha_stubs_x.so:
# 	$(MAKE) -C ../stublibs libalpha_stubs_x.so

include Makefile

