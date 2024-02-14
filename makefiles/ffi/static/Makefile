RANLIB=ranlib

vm:
	$(MAKE) -f VM.mk alpha.vm

vm2:
	$(MAKE) -f VM.mk alpha.vm2

sys:
	$(MAKE) -f Native.mk alpha.sys

sys2:
	$(MAKE) -f Native.mk alpha.sys2

alphastub:
	$(COMPILER) -c alphastub.ml;

# compile stub files
alpha_stubs: alpha
	$(CC) -c stub_int.c \
	-c stub_str.c \
	-I`ocamlc -where` \
	-I cclibs;

# archive them
libalpha_stubs: alpha_stubs
	$(AR) rc libalpha_stubs.a stub_int.o stub_str.o;
	$(RANLIB) libalpha_stubs.a

alpha:
	$(MAKE) -C cclibs alpha

################################################################
clean:
	$(MAKE) -C cclibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.vm *.sys;
	@-rm -f oUnit*;
