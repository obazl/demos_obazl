# to make build targets independent, each depends on clean
.PHONY: clean

# We have 2*2*2 = eight build methods for each target (vm, sys).
# Two methods for listing deps (directly or using -cclib/-ccopt),
# Two methods for building the C stublib (with or without
# embedding the foreign lib (libalpha.a).
# And then we have two possibilities for the foreign lib
# itself: libalpha.a and libalpha.so

## direct deps (w/o -ccopt, -cclib) ##
# link with both libalpha_stubs.a and libalpha.a
vm: clean
	$(MAKE) -f VM.mk alpha.vm

# link with libalpha_stubs_bundled.a (embeds libalpha.a)
vm.bundled: clean
	$(MAKE) -f VM.mk alpha.vm.bundled

## using -ccopt, --cclib ##
# link with both libalpha_stubs.a and libalpha.a
vm.cclib: clean
	$(MAKE) -f VM.mk alpha.vm.cclib

# link with libalpha_stubs_bundled.a (embeds libalpha.a)
vm.cclib.bundled: clean
	$(MAKE) -f VM.mk alpha.vm.cclib.bundled

sys: clean
	$(MAKE) -f Native.mk alpha.sys

sys.bundled: clean
	$(MAKE) -f Native.mk alpha.sys.bundled

sys.cclib: clean
	$(MAKE) -f Native.mk alpha.sys.cclib

sys.cclib.bundled: clean
	$(MAKE) -f Native.mk alpha.sys.cclib.bundled

sys.cclib.x: clean
	$(MAKE) -f Native.mk alpha.sys.cclib.x

################################################################
clean:
	$(MAKE) -C cclibs clean
	$(MAKE) -C stublibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.so *.vm *.sys;
	@-rm -f oUnit*;
