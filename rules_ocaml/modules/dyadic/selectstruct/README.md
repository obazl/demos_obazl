These cases demonstrate methods for selecting a struct to bind to a
fixed signature.

In each case we have a fixed signature but variant structs. We select
a struct based on platform (Linux or MacOS) and language (English or
French).

Selection is controlled by the Bazel-provided `@platforms`
configuration plus a user-defined configuration rule `//bzl:lang`. The
platform configuration is automatically set by Bazel to
`@platforms//os:linux` or `@platforms//os:macos`. The `//bzl:lang`
option can be set by passing a command-line option: `--//bzl:lang=en`
(the default) or `--//bzl:lang=fr`.

The configurations controlling selection of build rule inputs are
defined by `config_setting` targets in
`bzl/BUILD.bazel`. See the comments in that file.

Two platforms and two languages give us four distinct struct files.
All must support the signature declared by `hello.mli`, but each has a
different implementation. In this toy case that's just a different
message string, e.g "Hello, Linux!".

The cases also demonstrate options for organizing the source code. To
have four different structfiles we have two options:

* give them all the same name and store them in distinct directories
  (`macos/en/hello.ml`, `macos/fr/hello.ml`, etc.); or
* store them all in the same directory and give them distinct
  filenames (`macos_en_hello.ml`, `macos_fr_hello.ml`, etc.)

We can also put the fixed sigfile wherever we please, and furthermore
with the `ocaml_module` rule we have the option of passing it either a
compiled signature or a source file. This gives us the following
options for the `ocaml_module` target that binds the sig to the
struct:

* demo `dir_prefix/a`: depend on a sig source file located in the same
  package: `sig=":hello.mli"`

* demo `dir_prefix/b`: depend on a compiled sig located in the same
  package: `sig=":Hello_cmi"`

* demo `dir_prefix/c`: depend on a compiled sig located in a different
  package: `sig="//modules/fixedsig:Hello_cmi"`

* demo `dir_prefix/d`: depend on a sig source file located in a
  different package: `sig="//modules/fixedsig:hello.mli"`

