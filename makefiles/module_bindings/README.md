Demonstrates rules of the standard compilers.

The examples in `badsplit` demonstrate what can go wrong if you use
the same names in different directories. OBazl eliminates this class
of problems, because all inputs must be explicitly listed. A build
will never pick up an artifact inadvertently, just because it is in a
search path.

