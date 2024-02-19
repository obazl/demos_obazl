RANLIB=ranlib

UNAME := $(shell uname)

INSTALL_NAME=

ifeq ($(UNAME), Linux)
LINKFLAGS=
LINKFORCE=
endif
ifeq ($(UNAME), Darwin)
INSTALL_NAME=-install_name ../stublibs/$@
LINKFLAGS=-undefined dynamic_lookup -Wl,-no_compact_unwind
LINKFORCE=-Wl,-force_load,
endif

# NB: linux and macos treat DSO deps differently. The MacOS linker
# records the "install name" extracted from the DSO; the linux linker
# seems to record the path to the dep.  On the mac this can be overridden
# by listing the DSO file on the cmd line.


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

#### static (archive) stubs ####

# 2 options: complete (bundled) or partial (unbundled) archive
# complete archive includes stubs plus user libalpha.a
# partial contains just the stubs
# in the latter case linking must include both libs

# partial:
libalpha_stubs_unbundled.a: alpha_cstubs
	$(AR) rcs libalpha_stubs_unbundled.a \
	stub_int.o stub_str.o;
	$(RANLIB) libalpha_stubs_unbundled.a;

# using shared lib (libalpha.so)
# libalpha_stubs_x.a: alpha_cstubs libalpha.so
# 	$(AR) rcs libalpha_stubs_x.a \
# 	stub_int.o stub_str.o;
# 	$(RANLIB) libalpha_stubs_x.a;

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

################  shared lib stubs ###################
## build methods:
## a. bundled foreign lib (stublib links against archive)
##    1. linked to static rt
##    2. linked to shared rt
## b. unbundled foreignlib (stublib links against dso)
##    1. linked to static rt
##    2. linked to shared rt

# for vm executable: name it dll<name>.so,
# and link against libcamlrun_shared.so
# link it using -dlpath "-L." and -dllib -lalpha_stubs
# libalpha_libstubs_bundled_lib_shared_rt.so: libalpha.a alpha_cstubs
# 	$(CC) -shared \
# 	-o libalpha_stubs_bundled_lib_shared_rt.so \
# 	-install_name ../stublibs/libalpha_stubs_bundled_lib_shared_rt.so \
# 	stub_int.o stub_str.o \
# 	../cclibs/libalpha.a \
# 	`ocamlc -where`/libcamlrun_shared.so;

dllalpha_stubs_bundled_lib_shared_camlrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o dllalpha_stubs_bundled_lib_shared_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.a \
	`ocamlc -where`/libcamlrun_shared.so;

dllalpha_stubs_bundled_lib_static_camlrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o dllalpha_stubs_bundled_lib_static_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.a \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libcamlrun_pic.a ;

################
libalpha_stubs_unbundled_lib_shared_camlrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_unbundled_lib_shared_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so \
	$(LINKFORCE)`ocamlc -where`/libcamlrun_shared.so ;

dllalpha_stubs_unbundled_lib_shared_camlrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o dllalpha_stubs_unbundled_lib_shared_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so \
	`ocamlc -where`/libcamlrun_shared.so;

dllalpha_stubs_unbundled_lib_static_camlrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o dllalpha_stubs_unbundled_lib_static_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libcamlrun_pic.a ;

libalpha_stubs_unbundled_lib_static_camlrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_unbundled_lib_static_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libcamlrun_pic.a ;


################
# for native executable: name it lib<name>.so,
# and link against libasmrun_shared.so.
# user lib is libalpha.so, which makes it
# a runtime dep (its install name is embedded
# within libalpha_stubs.so)

libalpha_stubs_unbundled_lib_shared_asmrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_unbundled_lib_shared_asmrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so \
	$(LINKFORCE)`ocamlc -where`/libasmrun_shared.so ;

## unbundled foreign lib, static runtime
libalpha_stubs_unbundled_lib_static_asmrt.so: libalpha.so alpha_cstubs
	$(CC) -shared \
	-o $@ \
	$(INSTALL_NAME) \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libasmrun_pic.a \
	stub_int.o stub_str.o \
	../cclibs/libalpha.so;


# #NB: linking against a static runtime fails with undefined syms
# 	# -Wl,-force_load \
# 	# `ocamlc -where`/libasmrun_pic.a;
# # https://v2.ocaml.org/releases/5.1/htmlman/intfc.html#ss%3Ac-embedded-code
# # -output-obj cause[s] the ocamlc compiler to output a C object file (.o file, .obj under Windows) containing the bytecode for the OCaml part of the program, as well as a caml_startup function.
# # this allows us to create a dso depending on a static
# # runtime lib; however it will crash at runtime because:
# # "The caml_startup function must be called from the main C program in order to initialize the OCaml runtime and execute the OCaml initialization code."
# libalpha_stubs.crash: startup libalpha.so alpha_cstubs
# 	$(CC) -shared \
# 	-o libalpha_stubs.so \
# 	-install_name ../stublibs/libalpha_stubs.so \
# 	stub_int.o stub_str.o \
# 	startup.o \
# 	../cclibs/libalpha.so \
# 	`ocamlc -where`/libasmrun_pic.a;

# startup:
# 	ocamlopt -output-complete-obj -o startup.o dummy.ml

# user lib is static libalpha.a (or its *.o files)
# link using -ccopt "-L." and -cclib -lalpha_stubs

## bundled foreign lib, static runtime
libalpha_stubs_bundled_lib_shared_asmrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_bundled_lib_shared_asmrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/*.o \
	`ocamlc -where`/libasmrun_shared.so;

# same as above but links to libcamlrun
libalpha_libstubs_bundled_lib_shared_camlrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_bundled_lib_shared_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/libalpha.a \
	`ocamlc -where`/libcamlrun_shared.so;


libalpha_stubs_bundled_lib_static_asmrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_bundled_lib_static_asmrt.so \
	$(INSTALL_NAME) \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libasmrun_pic.a \
	stub_int.o stub_str.o \
	../cclibs/*.o;

libalpha_stubs_bundled_lib_static_camlrt.so: libalpha.a alpha_cstubs
	$(CC) -shared \
	-o libalpha_stubs_bundled_lib_static_camlrt.so \
	$(INSTALL_NAME) \
	stub_int.o stub_str.o \
	../cclibs/*.o \
	$(LINKFLAGS) \
	$(LINKFORCE)`ocamlc -where`/libcamlrun_pic.a ;

# or:	../cclibs/libalpha.a instead of ../cclibs/*o \

#linux: do we need --whole-archive/--no-whole-archive pair?
# (macos:  -all_load, -noall_load? -force_load?)


################
libalpha.a:
	$(MAKE) -C ../cclibs libalpha.a

libalpha.so:
	$(MAKE) -C ../cclibs libalpha.so

################################################################
clean:
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.so *.vm *.sys;
	@-rm -f oUnit*;
