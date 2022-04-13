# ns separator

These simple examples demonstrate that the standard ns separator,
double underscore `__`, is optional. The only requirement is that the
module name be legal. The [syntax](http://caml.inria.fr/pub/docs/manual-ocaml/names.html#module-name) is:

```
capitalized-ident	::=	 (A … Z) { letter ∣  0 … 9 ∣  _ ∣  ' }
```

Note that all three examples implement the same OCaml namespace
structure: `Amod.Bmod.Hello`. So the driver files is identical across
all three demos. The only difference among the demos is the way the
filesystem (that is, file naming) is used to support OCaml
namespacing.

These demos also show how ns modules can be chained.

To run, cd to the subdirectory, run `make`, then run `./driver`.
