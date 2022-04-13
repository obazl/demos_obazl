These examples show how to implement basic namespacing directly using
prefixed filenames and hard-coded module aliases in a resolver module.

These examples do not use any of OBazl's specialized namespacing
support; they are intended for study, not emulation. The demos in
ns/bottomup and ns/topdown show the preferred way to go.

Demo resolver/a demonstrates a namespace whose submodules are mutually
independent.

Demo resolver/b demonstrates a namespace whose submodules are
interdependent. In order for a depending module (e.g. Red) to use a
field in another module (e.g. Green.v), it must depend on the resolver
module.

Demo resolver/c demonstrates a namespace containing "exogenous"
submodules - submodules located in different packages. So the only
source code in the package itself is for the resolver module and one
submodule, 'Grue'.

To run: from the `rules_ocaml` directory run

`$ bazel test namespaces/basic/resolver:test`
