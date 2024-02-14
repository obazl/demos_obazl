COMPILER=ocamlopt
SFX="cmx"
LINKALL=

# clibs may be directly listed on cmd line,
# without using -ccopt, -cclib:
alpha.sys: alphastub libalpha_stubs
	$(COMPILER) libalpha_stubs.a cclibs/libalpha.a \
	alphastub.cmx \
	-o alpha.sys;

# clibs may also be passed using -ccopt -Lpath and
# -cclib -llibname
alpha.sys2: alphastub libalpha_stubs
	$(COMPILER) \
	-ccopt "-Lcclibs" \
	-cclib -lalpha \
	-ccopt "-L." \
	-cclib -lalpha_stubs \
	alphastub.cmx \
	-o alpha.sys;

include Makefile

