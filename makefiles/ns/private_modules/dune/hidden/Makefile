default:
	ocamlfind ocamlc \
	-w @1..3@5..28@31..39@43@46..47@49..57@61..62@67@69-40 \
	-strict-sequence -strict-formats -short-paths -keep-locs \
	-g -bin-annot \
	-linkpkg -package ounit2 \
	-I _build/default/test/.test_hidden.eobjs/byte \
	-I _build/default/lib/.hidden.objs/byte \
	-I test \
	_build/defaul/lib/hidden.cma \
	-no-alias-deps -opaque -o test/Test_hidden.cmo \
	-c -impl test/test_hidden.ml
