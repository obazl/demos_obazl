# to make build targets independent, each depends on clean
.PHONY: clean

RANLIB=ranlib

vm: clean
	$(MAKE) -f VM.mk alpha.vm

vm2:
	$(MAKE) -f VM.mk alpha.vm2

################

sys: clean
	$(MAKE) -f Native.mk alpha.sys

sys.bundled: clean
	$(MAKE) -f Native.mk alpha.sys.bundled

sys3:
	$(MAKE) clean;
	$(MAKE) -f Native.mk alpha.sys3

# alphastub:
# 	$(COMPILER) -c alphastub.ml;

# # compile stub files for shared lib (-fPIC)
# # '-I`ocamlc -where` exposes ocaml sdk headers
# # (in <switch>/lib/ocaml/caml)
# alpha_stubs:
# 	$(CC) -fPIC -c stub_int.c \
# 	-c stub_str.c \
# 	-I cclibs \
# 	-I`ocamlc -where`;

#### build shared lib from stub files ####

# # for vm executable: name it dll<name>.so,
# # and link against libcamlrun_shared.so
# # link it using -dlpath "-L." and -dllib -lalpha_stubs
# dllalpha_stubs: libalpha alpha_stubs
# 	$(CC) -shared \
# 	-o dllalpha_stubs.so \
# 	stub_int.o stub_str.o \
# 	cclibs/libalpha.a \
# 	`ocamlc -where`/libcamlrun_shared.so;

# libalpha:
# 	$(MAKE) -C cclibs libalpha

################################################################
clean:
	$(MAKE) -C ../cclibs clean
	$(MAKE) -C ../stublibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.vm *.sys;
	@-rm -f *.so;
	@-rm -f oUnit*;
