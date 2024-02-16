alpha:
	$(CC) -c alpha.c

libalpha.a: alpha
	$(AR) -rcs libalpha.a alpha.o

libalpha.so: alpha
	$(CC) -shared \
	alpha.o \
	-install_name ../cclibs/libalpha.so \
	-o libalpha.so;


################################################################
clean:
	@-rm -f *.o *.a *.so;
