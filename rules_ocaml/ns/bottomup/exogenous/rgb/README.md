Demonstrates use of the `modules` attribute of the `ocaml_ns`
rule, to embed exogenous non-namespaced modules (i.e. modules not
submodules) in a namespace. "Exogenous" meaning they are targets in a
different package.

A module is "embedded in a namespace" if the resolver has an aliasing
equation for it. Such an equation makes the module accessible by
namespace qualification. Using filename prefixes to prevent name
collisions is a separate issue.

In this demo, we embed exogenous non-namespaced modules R, G, and B in
our `Color` namespace, so they can be referenced as `Color.R`, for
example. Since aliases can be arbitrary, this example also
demonstrates name mapping, e.g. we alias Green to G, Blue to B.

In summary: our namespace `Color` maps `R` to `//mwe/rgb:R`, which
produces `R.cmx` (and `R.cmi`, `R.o`), and similar for `Green` and
`Blue`.

You can see what the module targets produce by running

`$ bazel build mwe/rgb:R --output_groups=fileset`
