# to make build targets independent, each depends on clean
.PHONY: clean

vm.bundled.shared: clean
	$(MAKE) -f VM.mk alpha.vm.bundled.shared
vm.bundled.shared.dllib: clean
	$(MAKE) -f VM.mk alpha.vm.bundled.shared.dllib

vm.bundled.static: clean
	$(MAKE) -f VM.mk alpha.vm.bundled.static
vm.bundled.static.dllib: clean
	$(MAKE) -f VM.mk alpha.vm.bundled.static.dllib

vm.unbundled.shared: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled.shared
vm.unbundled.shared.dllib: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled.shared.dllib

vm.unbundled.static: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled.static
vm.unbundled.static.dllib: clean
	$(MAKE) -f VM.mk alpha.vm.unbundled.static.dllib

################
sys.bundled.shared: clean
	$(MAKE) -f Native.mk alpha.sys.bundled.shared

sys.bundled.static: clean
	$(MAKE) -f Native.mk alpha.sys.bundled.static

sys.unbundled.shared: clean
	$(MAKE) -f Native.mk alpha.sys.unbundled.shared

sys.unbundled.static: clean
	$(MAKE) -f Native.mk alpha.sys.unbundled.static

sys.broken:
	$(MAKE) clean;
	$(MAKE) -f Native.mk alpha.sys.broken

################################################################
clean:
	$(MAKE) -C ../cclibs clean
	$(MAKE) -C ../stublibs clean
	@-rm -f *.cmx *.cmo *.o *.cmi
	@-rm -f *.exe *.out *.a *.vm *.sys;
	@-rm -f *.so;
	@-rm -f oUnit*;
