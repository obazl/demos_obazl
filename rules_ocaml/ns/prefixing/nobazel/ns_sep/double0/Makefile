driver: Amod00Bmod00Hello.cmo
	ocamlc *.cmo driver.ml -o driver.exe

Amod.cmo:
	ocamlc -w -49 -c -no-alias-deps Amod.ml

Amod00Bmod.cmo: Amod.cmo
	ocamlc -w -49 -c -no-alias-deps Amod00Bmod.ml

Amod00Bmod00Hello.cmo: Amod00Bmod.cmo
	ocamlc -c -no-alias-deps Amod00Bmod00Hello.ml

clean:
	-rm *.exe 2>/dev/null || true;
	-rm *.cmi 2>/dev/null || true;
	-rm *.cmo 2>/dev/null || true;
