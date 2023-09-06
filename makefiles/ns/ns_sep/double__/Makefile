ALL = Amod.cmo Amod__Bmod.cmo Amod__Bmod__Hello.cmo

default: driver
	./Driver.exe

driver: Amod__Bmod__Hello.cmo
	ocamlc ${ALL} driver.ml -o driver.exe

Amod.cmo:
	ocamlc -w -49 -c -no-alias-deps Amod.ml

Amod__Bmod.cmo: Amod.cmo
	ocamlc -w -49 -c -no-alias-deps Amod__Bmod.ml

Amod__Bmod__Hello.cmo: Amod__Bmod.cmo
	ocamlc -c -no-alias-deps Amod__Bmod__Hello.ml

clean:
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
