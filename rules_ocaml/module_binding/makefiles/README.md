Demonstrates rules of the standard compilers.

The make target in `proper/` tries to compile an .ml file without
first compiling it's companion .mli file. It will fail, demonstrating
that the compiler always looks for the .mli file and if it finds it,
expects to find the corresponding .cmi file.

The examples in `split/` demonstrate what happens if we try to finesse
the compiler by putting our .mli file in a different directory and
exposing it using the `-I` option: nothing. The compiler will not
search beyond the directory containing the .ml file, so if it does not
find the .mli file there, it will infer it from the .ml file.

The examples in `badsplit` demonstrate what can go wrong if you use
the same names in different directories. OBazl eliminates this class
of problems, because all inputs must be explicitly listed. A build
will never pick up an artifact inadvertently, just because it is in a
search path.

