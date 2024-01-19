# Emulating namespaces with OBazl

>    **WARNING** this documentation is outdated but currently undergoing revision.

* [Overview](#overview)
* [Set 100](#set100) Basic modules used as deps by other demos
* [Set 200](#set200) Basic namespaces, where the resolver module is generated or user-provided; the latter may use OCaml `include`
* [Set 300](#set300) Namespacing
* [Set 400](#set400) Exogenous submodules
* [Set 450](#set450) Exogenous ns submodules
* [Set 500](#set500) Mixing endogenous and exogenous submodules
* [Set 600](#set600) Chaining namespaces
* [Set 700](#set700) Miscellany


## <a name="overview">Overview</a>

Run one test: `$ bazel test namespaces/obazl/set300/case310:test`

Run all tests: `$ bazel test test`

Run all tests in one set: `$ bazel test namespaces/obazl/set200:test`

Some of the tests print lines to stdout. To see them you can inspect
the test log, or you can use the Bazel `run` command to run tests,
e.g. `$ bazel run namespaces/obazl/set200/case210:test`

To see what gets built for an `ocaml_ns_library`, use the `build`
command, e.g. `$ bazel build namespaces/obazl/set400/case410:color`.

"Resolver" modules are named with suffix `0Resolver`.

You can print build commands, inputs, and outputs without executing
the build by using the `aquery` command:
`$ bazel aquery namespaces/obazl/set400/case410:color`.

## <a name="set100">Set 100: Basic module builds.

These cases build some modules that are used as deps by other cases.


* case 110: No namespacing, just builds some modules that will be deps
  of other demos.

* case 130: Similar to case110, but with explicitly namespaced
  module/file names (this will become consequential when
  we also use aliases).

* case 132: Similar to case130

* case 134: Similar to case130, case132

## <a name="set200">Set 200 - elementary namespacing</a>

<!-- outdated doc: -->
<!-- Pure "aliasing" involves the use of aliasing equations (i.e. -->
<!--  [type-level module -->
<!--  aliases](https://caml.inria.fr/pub/docs/manual-ocaml/modulealias.html)) -->
<!--  without module renaming. It follows that only pseudo-recursive -->
<!--  aliasing equations can be used in this way. This allows you to use -->
<!--  module paths to refer to your modules, e.g. `A.B`, but without the -->
<!--  protection against name clashes afforded by renaming. -->

<!-- In OBazl, you can do this by using rule `ocaml_ns_library` but not -->
<!-- macro `ns_env` (equivalently, rule `ocaml_ns_env`). -->

<!-- None of the demos in this set use renaming (ns_env). They demonstrate -->
<!-- (among other things) that renaming and aliasing are orthogonal. -->

<!-- > **NOTE**: if you use aliasing without renaming, the aliasing -->
<!--        equations, whether generated or provided by you, will often be -->
<!--        pseudo-recursive, that is, of form "module M = M". -->

* case 210: Demonstrates use of an `ocaml_ns_library` rule to generate a
  main ns module containing pseudo-recursive aliasing equations.

    In this example, the submodules contain no inter-dependencies, so
    they may be compiled separately, e.g. `bazel build
    namespaces/obazl/set200/case210:_Red` should succeed.

* case 220: User-provided ns main module `color.ml`. OBazl will use
  the user file as main ns module instead of generating one. Since
  this example does not use renaming, nothing more is needed.

>        **IMPORTANT**: User-provided 'main' must include an aliasing
>        equation, of form "module X = Y", for each submodule X. Often
>        these will be pseudo-recursive equations, of form "module X = X".
         It may include additional code, but it must include the aliasing
>        equations for resolution to work.

* case 230: Same as case220, but the designated main has a different
  name ("color_main") than the ocaml_ns_library "color"). OBazl will
  copy the user-provided file to the ns name.

* case 240: Includes. User provides an include module "color_include",
  and OBazl will add "include Color_include" to the resolver, below
  the aliasing equations.

## <a name="set300">Set 300: Namespacing

Namespacing combines renaming and aliasing.  So things get a bit trickier.

The ns libraries in these examples all use _endogenous_ submodules -
submodules defined in the same (Bazel) package as the ns library.
Exogenous submodules are also supported - see demos below.

* case310: Minimal renaming, without intramural deps, with main ns
  module aliasing but no ns_env resolver. Compiling without an ns_env
  resolver means that intramural references cannot be resolved.

* case311: Same as case 310 but uses `ocaml_ns_archive` instead of `ocaml_ns_library`.

* case 316: same as case310, but with ns_env resolver supporting intramural deps.

To enable intramural deps, we specify an `aliases` list for our
ns_env. That is what enables compilation of submodules with
interdependencies: the ns_env generates a "resolver" module containing
the needed aliasing equations, which is used with `-open` and
`-no-alias-deps` to compile the submodules in the namespace lib.

>    **IMPORTANT** The query facility is useful to explore structure:

```
$ bazel query 'deps(namespaces/obazl/set300/case316:_Red)' --output graph --noimplicit_deps
digraph mygraph {
  node [shape=box];
  "//ns/obazl/set300/case316:_Red"
  "//ns/obazl/set300/case316:_Red" -> "//ns/obazl/set300/case316:_ns_env"
  "//ns/obazl/set300/case316:_Red" -> "//ns/obazl/set300/case316:red.ml"
  "//ns/obazl/set300/case316:_Red" -> "//ns/obazl/set300/case316:_Blue"
  "//ns/obazl/set300/case316:_Blue"
  "//ns/obazl/set300/case316:_Blue" -> "//ns/obazl/set300/case316:_ns_env"
  "//ns/obazl/set300/case316:_Blue" -> "//ns/obazl/set300/case316:blue.ml"
  "//ns/obazl/set300/case316:_ns_env"
  "//ns/obazl/set300/case316:_ns_env" -> "//ns/obazl/set300/case316:blue.ml"
  "//ns/obazl/set300/case316:_ns_env" -> "//ns/obazl/set300/case316:green.ml\n//ns/obazl/set300/case316:test.ml"
  "//ns/obazl/set300/case316:_ns_env" -> "//ns/obazl/set300/case316:red.ml"
  "//ns/obazl/set300/case316:red.ml"
  "//ns/obazl/set300/case316:green.ml\n//ns/obazl/set300/case316:test.ml"
  "//ns/obazl/set300/case316:blue.ml"
}
```

* case 317: same as case 316, but uses `ocaml_ns_archive` instead of `ocaml_ns_library`

* case 345: Add an 'include X' statement to the resolver. The build
  rule for the included module must be coordinated with the `ns_env`
  rule.

* case 360: basic ns library with 'include' module

* case 375: combining module remapping and multiple ns environments.
  Uses both macro `ns_env` and rule `ocaml_ns_library`.



## <a name="set400">Set 400: Exogenous submodules</a>

A namespace can contain "exogenous" submodules - submodules defined
elsewhere in the filesystem. Note that in these cases we do not need
to call ns() to set up an ns resolver (unless we also include
endogenous submodules, see Class03 below), since exogenous submodules
have their ns resolvers.

* case 05: generated main ns module with submodules from class01/case01.

* case 06: user-provided main ns module, same name as ns, with submodules from class01/case01.

* case 07: user-provided main ns module, different name than ns name,
  with submodules from class01, cases 01, 02, 03.

* case 08: generated main ns module with user-supplied footer, with
  submodules from class01, cases 01, 02, 03.

## <a name="set450">Set 450: Exogenous ns submodules</a>

## <a name="set500">Set 500: Mixing endogenous and exogenous submodules</a>

* case 09: generated main ns module, one endogenous submodule and three exogenous submodules

* case 10: same as case09, except with a user-provided main ns module

## <a name="set600">Set 600: Chaining namespaces</a>

Demonstrating how to construct multi-segment module paths like
`A.B.C.D` by including ns modules as submodules.

* case 21: generated main ns module containing two exogenous ns submodules defined in subdirectories

* case 22: user-provided main ns module containing two exogenous ns submodules defined in subdirectories

* case 23: generated main ns module containing a variety of submodules: ns and non-ns, local and exogenous

* case 24: defines A.Color in one package (directory). Main ns module is A, submodule Color is defined endogenously (in same package as A).  Also demonstrates use of alternative name (label) for ns resolver.

## <a name="set700">Set 700: Miscellany</a>

* case 31: demonstrates submodule interdependencies, sticky deps, mulitiple namespaces in on package, decoupling of submodule names and filenames.


## <a name="troubleshooting">Troubleshooting</a>

### Missing alias

```
File "bazel-out/darwin-fastbuild/bin/namespaces/obazl/case11/cmy/_obazl_/Demos_namespaces_obazl_case11_cmy__Cyan.ml", line 3, characters 84-93:
3 | let () = print_endline ("Hello from module CMY.Cyan. Cmy.Magenta: " ^ string_of_int Magenta.v) ;;
                                                                                        ^^^^^^^^^
Error: The module Magenta is an alias for module Demos_namespaces_obazl_case11_cmy__Magenta, which is missing
```

Intra-ns dependencies must be explicitly listed on by the depending
submodules. In this case, the Cyan submodule has a dependency on the
Magenta submodule, but it was not listed in the `ocaml_module` rule
for Cyan. Adding `":Magenta"` to the `deps` attribute resolved the problem.
