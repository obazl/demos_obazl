ALL = Amod.cmo Amod_Bmod.cmo Amod_Bmod_Hello.cmo

default: driver
	./driver.exe

driver: Amod_Bmod_Hello.cmo
	ocamlc ${ALL} driver.ml -o driver.exe

Amod.cmo:
	ocamlc -w -49 -c -no-alias-deps Amod.ml

Amod_Bmod.cmo: Amod.cmo
	ocamlc -w -49 -c -no-alias-deps Amod_Bmod.ml

Amod_Bmod_Hello.cmo: Amod_Bmod.cmo
	ocamlc -c -no-alias-deps Amod_Bmod_Hello.ml

clean:
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
