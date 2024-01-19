COMPILER=ocamlopt

test: test.ml data functions
	ocamlfind $(COMPILER) -w -49 $(LINKALL) -linkpkg -package ounit2 \
	data.cmx \
	functions.cmx \
	-o test.exe test.ml;
	./test.exe;

data: data.ml
	$(COMPILER) -c data.ml;

	# $(COMPILER) -o data.out data.ml;
	# ./data.out

functions: functions.ml
	$(COMPILER) -c functions.ml;

	# $(COMPILER) -o functions.out functions.ml;
	# ./functions.out

################################################################
clean:
	@-rm -f *.cmi *.cmx *.o *.cmo *.exe *.log *.cache
