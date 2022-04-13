COMPILER=ocamlc

pco: p c
	${COMPILER} -c printablecomparable.mli -open Comparable -open Printable

p:
	${COMPILER} -c printable.mli

c:
	${COMPILER} -c comparable.mli

clean:
	rm *.cmi *.cmo *.cmx

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
