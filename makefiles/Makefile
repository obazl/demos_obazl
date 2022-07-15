default:
	$(MAKE) -C aliasing;
	$(MAKE) -i -C cdeps;
	$(MAKE) -C deps_sig;
	$(MAKE) -C deps_struct;
	$(MAKE) -C fixed_sig
	$(MAKE) -C fixed_struct
	$(MAKE) -C ldeps;
	$(MAKE) -C modules;
	$(MAKE) -C ns;
	$(MAKE) -C selection;
	$(MAKE) -C structs;

clean:
	$(MAKE) -C aliasing clean;
	$(MAKE) -C deps_sig clean;
	$(MAKE) -C deps_struct clean;
	$(MAKE) -C fixed_sig clean;
	$(MAKE) -C fixed_struct clean;
	$(MAKE) -C ldeps clean;
	$(MAKE) -C modules clean;
	$(MAKE) -C ns clean;
	$(MAKE) -C selection clean;
	$(MAKE) -C structs clean;
