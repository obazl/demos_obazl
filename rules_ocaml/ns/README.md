# namespacing

IMPORTANT: There are two orthogonal kinds of namespace involved, the
OCaml namespaces (determined by module names), and filesystem
namespaces (determined by filename prefixes). Module aliasing can
involve one or both. Writing and aliasing equation for a module puts
it into an OCaml namespace (whose name is derived from the file
containing the equation). Optionally, the alias can involve a
namespacing prefix.

For example, if we want to put B in namespace A without using a
namespace prefix, we can add this to a.ml:

` module B = B`

If we want to avoid name collisions with other B modules, then we can
instead write

` module B = A__B`

and (automatically) rename b.ml to a__b.ml.

OBazl rules afford complete control of such aliasing and prefixing.
