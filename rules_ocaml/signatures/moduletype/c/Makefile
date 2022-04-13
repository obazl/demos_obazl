COMPILER=ocamlc

test: a1mod a2mod
	${COMPILER} -o test a1.cmo a2.cmo test.ml

a1mod: a1sig
	cp a.ml a1.ml
	${COMPILER} -c a1.ml

a1sig: bsig csig
	${COMPILER} -c a1.mli

## Here we must explicitly copy the src file. OBazl does this automatically.
a2mod: a2sig
	cp a.ml a2.ml
	${COMPILER} -c a2.ml

a2sig: bsig csig
	${COMPILER} -c a2.mli -open B -open C

bsig:
	${COMPILER} -c b.mli

csig:
	${COMPILER} -c c.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
	-rm -f a1.ml a2.ml
	-rm -f test
