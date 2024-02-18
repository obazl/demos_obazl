# to make build targets independent, each depends on clean
.PHONY: clean

# We have 2*2*2 = eight build methods for each target (vm, sys).
# Two methods for listing deps (directly or using -cclib/-ccopt),
# Two methods for building the C stublib (with or without
# embedding the foreign lib (libalpha.a).
# And then we have two possibilities for the foreign lib
# itself: libalpha.a and libalpha.so

# link with libalpha_stubs_bundled.a (embeds libalpha.a)
vm.bundled: clean
	$(MAKE) -f VM.mk alpha.vm.bundled

## using -ccopt, --cclib ##
# link with both libalpha_stubs.a and libalpha.a
vm.bundled.cclib: clean
	$(MAKE) -f VM.mk alpha.vm.bundled.cclib

## direct deps (w/o -ccopt, -cclib) ##
# link with both libalpha_stubs.a and libalpha.a
vm.unbundled: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled

# link with libalpha_stubs_bundled.a (embeds libalpha.a)
vm.unbundled.cclib: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled.cclib

sys.unbundled: clean
	$(MAKE) -f Native.mk alpha.sys.unbundled
sys.unbundled.cclib: clean
	$(MAKE) -f Native.mk alpha.sys.unbundled.cclib

sys.bundled: clean
	$(MAKE) -f Native.mk alpha.sys.bundled
sys.bundled.cclib: clean
	$(MAKE) -f Native.mk alpha.sys.bundled.cclib

sys.cclib.x: clean
	$(MAKE) -f Native.mk alpha.sys.cclib.x

################################################################
clean:
	$(MAKE) -C ../cclibs clean
	$(MAKE) -C ../stublibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.so *.vm *.sys;
	@-rm -f oUnit*;
