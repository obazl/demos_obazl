## run `make clean` after each make.

## default: byte compile and link executable 'a.out'
hello_bytecode_out:
	ocamlc hello.ml

## native compile and link executable 'a.out'
hello_native_out:
	ocamlopt hello.ml

## -o sets output name, in this case, for executable, not .cmx
hello_rename_out:
	ocamlopt hello.ml -o foo.cmx

## -c means compile only; -o sets name for all outputs: .cmi, .cmx, .o
hello_rename_cmx:
	ocamlopt -c hello.ml -o foo

## extract .mli file from .ml file
hello_sigfile:
	ocamlc -i hello.ml > hello.mli

## fails if the hello_binding.mli not already compiled:
hello_binding_fail:
	ocamlopt hello_binding.ml

# compile-only, .cmi
hello_binding_cmi:
	ocamlopt -c hello_binding.mli

# compile-only, .cmx
hello_binding_cmx: hello_binding_cmi
	ocamlopt -c hello_binding.ml

## default: compile both mli and ml and link executable 'a.out'
hello_binding_out: hello_binding_cmi
	ocamlopt hello_binding.ml

## compile-only, both mli and ml with one command

## NB: -o cannot be used with multiple files, so the outputs will have
## same names as inputs, excepting extensions.
# output: hello_binding.[cmi, cmx, o] and the cmi file is used to
# compile the cmx and o files.
hello_binding_both:
	ocamlopt -c hello_binding.mli hello_binding.ml

# if we pass mli and ml file with different names, both will be
# compiled, but independently; the cmi from the mli file will NOT be
# used to compile the ml file; instead, the compiler will extract an
# mli file from the ml file, and use it to generate the cmi file.
# so this produces: hello_csig.cmi, hello_c.cmi, hello_c.cmx, hello_c.o
# and the hello_c* files have no connection to hello_csig.cmi
hello_c:
	ocamlopt -c hello_csig.mli hello_c.ml

## default: compile both mli and ml and link executable 'a.out'
hello_binding_both_out:
	ocamlopt hello_binding.mli hello_binding.ml

clean:
	$(RM) *.cmx *.cmo *.cmi *.o *.out hello.mli
