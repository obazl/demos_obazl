# namespaces/direct/hashnames demo

The only requirement for naming namespace modules submodules is that
their names must be legal OCaml module names.

This somewhat perverse example demostrates use of a hash function to
name submodules.

You probably don't want to do this in real code. For one thing, every
time you change the source of a submodule, the build will generate a
new namespaced file for it, since its hash will change. On the other
hand, if you really had a use for this, you could use a fixed naming
convention during development and switch to hashed names for
production builds.

To run: cd to the subdir, run `make`, then `./test.byte`. Inspect the generated file `color.ml`:

module Red   = MD5_8d30595d20978446afadefa2ea0269a3
module Green = MD5_0c57214774ed4b5c4f13c802c488e578
module Blue  = MD5_c0711142a86d96f2836ab0db6b2050d5


Then `make clean`
