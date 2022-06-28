OCAML=-O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -fno-common -fexcess-precision=standard -fno-tree-vrp -ffunction-sections  -Wl,-E

default: main
	$$(gcc -v $(OCAML) -L$(PWD) -Wl,-rpath=$(PWD) -Wall -o test main.o -lhello)

main: shared
	gcc $(OCAML) -Wall -c main.c


# move liblto_plugin.so out of linker's search path.
# then this will show you what ld tries to do:
LFLAGS=-v -Wl,-verbose
#-fno-use-linker-plugin 

# note: -fno-use-linker-plugin evidently does not cancel
# -fuse-linker-plugin but it does cause more info to be printed
# it prints info about the linker's search for libs, but it
# does not print info about searching for the plugin.

shared: o
	gcc $(LFLAGS) -shared -o libhello.so hello.o

o:
	gcc -c -Wall -Werror -fpic hello.c;

clean:
	@-rm -f test *.o *.so *~
