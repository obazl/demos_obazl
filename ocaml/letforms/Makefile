COMPILER=ocamlopt
LINKALL=

default:
	$(MAKE) -C closures;
	$(MAKE) -C destructuring;
	$(MAKE) -C expressions;
	$(MAKE) -C letrec;
	$(MAKE) -C progn;
	$(MAKE) -C statements;

################################################################
clean:
	@$(MAKE) -C closures clean;
	@$(MAKE) -C destructuring clean;
	@$(MAKE) -C expressions clean;
	@$(MAKE) -C letrec clean;
	@$(MAKE) -C progn clean;
	@$(MAKE) -C statements clean;
