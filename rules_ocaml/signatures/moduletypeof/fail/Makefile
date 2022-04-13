COMPILER=ocamlc

amod: asig
	${COMPILER} -c a.ml

asig: bsig
	${COMPILER} -c a.mli

bsig:
	${COMPILER} -c b.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
