COMPILER=ocamlopt

sig:
	$(COMPILER) -c a.mli; # emits a.cmi

cmti:
	$(COMPILER) -bin-annot -c test/a.mli; # emits a.cmi, a.cmti

# with -intf
cmtix:
	$(COMPILER) -bin-annot -c -intf a.mli; # emits a.cmi

cmti1:
	$(COMPILER) \
	-keep-locs \
	-short-paths \
	-strict-formats \
	-strict-sequence \
	-bin-annot \
	-w \
	@1..3@5..28@30..39@43@46..47@49..57@61..62-40 \
	-c -intf test/a.mli; # emits a.cmi

################################################################
clean:
	@-rm -f *.cmi *.cmti
