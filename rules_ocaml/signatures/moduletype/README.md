
a1-a3, b1-b3 demonstrate sig composition using explicit module types

c demonstrates binding two different composite sigs (A1, A2) to the same structfile (A1, copied to A2)

d demonstrates a variant, again using 'module type'

https://ocaml.org/manual/moduleexamples.html#s%3Aseparate-compilation

"Note that only top-level structures can be mapped to
separately-compiled files, but neither functors nor module types.
However, all module-class objects can appear as components of a
structure, so the solution is to put the functor or module type inside
a structure, which can then be mapped to a file."

It's hard to tell exactly what this is meant to convey, but it is not
true, at least wrt module types. Every module determines a module
type, and we can use the "module type of" extension (a kind of
elimination rule) to obtain it for any .mli file. In other words, it
is *not* the case that only modtypes explicitly constructed using
'module type' are usable.

See the demos in the contraction subdir.
