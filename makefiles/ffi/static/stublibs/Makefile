RANLIB=ranlib

alphastub:
	$(COMPILER) -c alpha.ml;

# compile stub files
# '-I`ocamlc -where` exposes ocaml sdk headers
# (in <switch>/lib/ocaml/caml)
alpha_cstubs:
	$(CC) -c stub_int.c \
	-c stub_str.c \
	-I`ocamlc -where` \
	-I ../cclibs;

#### archive stubs ####

# 2 options: complete (bundled) or partial archive
# complete archive includes stubs plus user libalpha.a
# partial contains just the stubs
# in the latter case linking must include both libs

# partial:
libalpha_stubs.a: alpha_cstubs
	$(AR) rcs libalpha_stubs.a \
	stub_int.o stub_str.o;
	$(RANLIB) libalpha_stubs.a;

# using shared lib (libalpha.so)
libalpha_stubs_x.a: alpha_cstubs libalpha.so
	$(AR) rcs libalpha_stubs_x.a \
	stub_int.o stub_str.o;
	$(RANLIB) libalpha_stubs_x.a;

# bundled:
# to include libalpha.a in libalpha_stubs.a
# we need to extract the objects and add them
# or in this case we can list them directly
# without extracting from the archive file.
# then for linking this libalpha_stubs.a is sufficient,
# no need to also link libalpha.a
libalpha_stubs_bundled.a: alpha_cstubs libalpha.a
	$(AR) rcs libalpha_stubs_bundled.a \
	stub_int.o stub_str.o \
	../cclibs/*.o;
	$(RANLIB) libalpha_stubs_bundled.a;

# if libalpha.a were a precompiled third-party archive,
# we would have to extract the objects and then
# add them to the new archive.
#	../cclibs/libalpha.a;

libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

libalpha.so:
	$(MAKE) -C ../cclibs libalpha.so

################################################################
clean:
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.so *.vm *.sys;
	@-rm -f oUnit*;
