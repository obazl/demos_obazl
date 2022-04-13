COMPILER=ocamlc

test: amod
	${COMPILER} -o test a.cmo test.ml

amod: asig
	${COMPILER} -c a.ml

asig: bsig csig
	${COMPILER} -c a.mli -open B -open C

bsig:
	${COMPILER} -c b.mli

csig:
	${COMPILER} -c c.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
	-rm -f a2.ml
	-rm -f test

