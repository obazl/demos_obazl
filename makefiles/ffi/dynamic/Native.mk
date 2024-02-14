COMPILER=ocamlopt
SFX="cmx"
LINKALL=

# static clibs may be directly listed on cmd line,
# without using -ccopt, -cclib, but shared libs
# must be passed with -cclib -lname:
alpha.sys: alphastub libalpha_stubs
	$(COMPILER) \
	cclibs/libalpha.a \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alphastub.cmx \
	-o alpha.sys;

# static clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.sys2: alphastub libalpha_stubs
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alphastub.cmx \
	-o alpha.sys;

# BUT: we cannot use the dll<name>.so that we
# use for vm executables.
# ocamlopt does not understand -dllpath or -dllib,
# and -l<name> will search for lib<name>.so, not dll<name>.so;
# so this would fail with "ld: library 'alpha_stubs' not found":
alpha.sys3: alphastub dllalpha_stubs
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alphastub.cmx \
	-o alpha.sys;

# furthermore putting a .so file directly on the cmd line
# results in "don't know what to do with <name>.so"
# (for native compilers only)

include Makefile

