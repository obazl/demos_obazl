COMPILER=ocamlc

test: amod
	${COMPILER} -o test a.cmo test.ml

amod: asig
	${COMPILER} -c a.ml

asig: bsig
	${COMPILER} -c a.mli

bsig:
	${COMPILER} -c b.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
	-rm -f test
