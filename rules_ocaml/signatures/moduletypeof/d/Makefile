COMPILER=ocamlc

mtype: strsig
	${COMPILER} -o test test.ml

strsig:
	${COMPILER} -c string_id.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
	-rm -f test
