Tries to compile an .ml file without first compiling it's companion
.mli file. It will fail, demonstrating that the compiler always looks
for the .mli file and if it finds it, expects to find the
corresponding .cmi file.
