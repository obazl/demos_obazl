RANLIB=ranlib

vm:
	$(MAKE) -f VM.mk alpha.vm

vm2:
	$(MAKE) -f VM.mk alpha.vm2

sys:
	$(MAKE) -f Native.mk alpha.sys

sys2:
	$(MAKE) clean;
	$(MAKE) -f Native.mk alpha.sys2

sys3:
	$(MAKE) clean;
	$(MAKE) -f Native.mk alpha.sys3

alphastub:
	$(COMPILER) -c alphastub.ml;

# compile stub files for shared lib (-fPIC)
alpha_stubs: alpha
	$(CC) -fPIC -c stub_int.c \
	-c stub_str.c \
	-I`ocamlc -where` \
	-I cclibs;

#### build shared lib from stub files ####

# for vm executable: name it dll<name>.so,
# and link against libcamlrun_shared.so
# link it using -dlpath "-L." and -dllib -lalpha_stubs
dllalpha_stubs: alpha_stubs
	$(CC) -shared \
	-o dllalpha_stubs.so \
	stub_int.o stub_str.o \
	cclibs/libalpha.a \
	`ocamlc -where`/libcamlrun_shared.so;

# for native executable: name it lib<name>.so,
# and link against libasmrun_shared.so;
# link it using -ccopt "-L." and -cclib -lalpha_stubs
libalpha_stubs: alpha_stubs
	$(CC) -shared \
	-o libalpha_stubs.so \
	stub_int.o stub_str.o \
	cclibs/libalpha.a \
	`ocamlc -where`/libasmrun_shared.so;

alpha:
	$(MAKE) -C cclibs alpha

################################################################
clean:
	$(MAKE) -C cclibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.vm *.sys;
	@-rm -f *.so;
	@-rm -f oUnit*;
