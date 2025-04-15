a: b
	$(COMPILER) $(OPAQUE) -c a.ml; # emits a.cmi, a.cmx, a.o
	rm b.cmi;
	rm ../dep/b.cmi;
b:
	$(MAKE) -C ../dep;
	ln -fs ../dep/b.cmi .;

clean:
	@-rm -f *.cmx *.o *.cmi *.cmxa *.a *.exe;
	@-rm -f oUnit-suite*;
