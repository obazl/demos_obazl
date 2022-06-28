default: shared
	gcc -L$(PWD) -Wl,-rpath=$(PWD) -Wall -o test main.c -lhello

# move liblto_plugin.so out of linker's search path.
# then this will show you what ld tries to do:
LFLAGS=-v -Wl,-verbose
#-fno-use-linker-plugin 

# note: -fno-use-linker-plugin evidently does not cancel
# -fuse-linker-plugin but it does cause more info to be printed
# it prints info about the linker's search for libs, but it
# does not print info about searching for the plugin.

shared:
	gcc -c -Wall -Werror -fpic hello.c;
	gcc $(LFLAGS) -shared -o libhello.so hello.o

clean:
	@-rm -f test *.o *.so *~
