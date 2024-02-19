# to make build targets independent, each depends on clean
.PHONY: clean

# infixed .libtublib. means: build libfoo.so not dllfoo.so
# infixed .dlstublib. means: build dllfoo.so not libfoo.so
# suffix .dllib means: link with -dllib
# no .dllib suffix means: link directly w/o -dllib

vm.libstublib.bundled.shared: clean
	$(MAKE) -f VM.mk libalpha.vm.libstublib.bundled.shared
vm.dlstublib.bundled.shared: clean
	$(MAKE) -f VM.mk dllalpha.vm.bundled.shared
vm.dlstublib.bundled.shared.dllib: clean
	$(MAKE) -f VM.mk dllalpha.vm.bundled.shared.dllib

vm.libstublib.bundled.static: clean
	$(MAKE) -f VM.mk libalpha.vm.bundled.static
vm.dlstublib.bundled.static: clean
	$(MAKE) -f VM.mk dllalpha.vm.bundled.static
vm.dlstublib.bundled.static.dllib: clean
	$(MAKE) -f VM.mk dllalpha.vm.bundled.static.dllib

vm.libstublib.unbundled.shared: clean
	$(MAKE) -f VM.mk libalpha.vm.unbundled.shared
vm.dlstublib.unbundled.shared: clean
	$(MAKE) -f VM.mk dllalpha.vm.unbundled.shared
vm.dlstublib.unbundled.shared.dllib: clean
	$(MAKE) -f VM.mk dllalpha.vm.unbundled.shared.dllib

vm.libstublib.unbundled.static: clean
	$(MAKE) -f VM.mk libalpha.vm.unbundled.static
vm.dlstublib.unbundled.static: clean
	$(MAKE) -f VM.mk dllalpha.vm.unbundled.static
vm.dlstublib.unbundled.static.dllib: clean
	$(MAKE) -f VM.mk dllalpha.vm.unbundled.static.dllib

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
