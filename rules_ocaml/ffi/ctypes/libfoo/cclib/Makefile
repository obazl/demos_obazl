CC=gcc
LIBTOOL=libtool
BIGFILES=-D_FILE_OFFSET_BITS=64
CFLAGS=-fpic -fPIC -Wall -Winline -O2 $(BIGFILES)
LDFLAGS := -lpthread

PHONY: libfoo.a dllfoo.so

default: libfoo.a libfoo.so

libfoo.a: foo.o
	$(LIBTOOL) -o libfoo.a foo.o

dllfoo.so: foo.o
	$(CC) -shared -o dllfoo.so foo.o

foo.o: foo.c
	cc $(CFLAGS) -c foo.c -o foo.o

clean:
	rm foo.o libfoo.a dllfoo.so
