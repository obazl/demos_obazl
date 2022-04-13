COMPILER=ocamlc

mtype: strmod
	${COMPILER} -c mtype.ml

mtypesig:
	${COMPILER} -c mtype.mli

strmod: strsig
	${COMPILER} -c string_id.ml

strsig:
	${COMPILER} -c string_id.mli

test: amod
	${COMPILER} -o test a.cmo test.ml

amod: asig
	${COMPILER} -c a.ml

asig: bsig csig
	${COMPILER} -c a.mli

bsig:
	${COMPILER} -c b.mli

csig:
	${COMPILER} -c c.mli

clean:
	-rm -f *.cmi *.cmo *.cmx || true
	-rm -f a2.ml
	-rm -f test

# without the -open options:

# $ make
# ocamlopt -c printable.mli
# ocamlopt -c comparable.mli
# ocamlopt -c -I ./ printablecomparable.mli
# File "printablecomparable.mli", line 1, characters 8-17:
# 1 | include Printable
#             ^^^^^^^^^
# Error: Unbound module type Printable
# Hint: There is a module named Printable, but modules are not module types
# make: *** [pc] Error 2
