UNAME := $(shell uname)

INSTALL_NAME=
LINKFLAGS=
LINKFORCE=

ifeq ($(UNAME), Linux)
endif
ifeq ($(UNAME), Darwin)
INSTALL_NAME=-install_name ../cclibs/libalpha.so
LINKFLAGS=-undefined dynamic_lookup -Wl,-no_compact_unwind
LINKFORCE=-Wl,-force_load,
endif

alpha:
	$(CC) -c -fPIC alpha.c

libalpha.a: alpha
	$(AR) -rcs libalpha.a alpha.o

libalpha.so: alpha
	$(CC) -shared \
	alpha.o \
	$(INSTALL_NAME) \
	-o libalpha.so;


################################################################
clean:
	@-rm -f *.o *.a *.so;
