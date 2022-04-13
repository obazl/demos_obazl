# Aggregators

* [Archives](archives)
* [Libraries](#libraries)
* [NS Archives](#nsarchives)
* [NS Libraries](#nslibraries)
* [PPX Archives](#ppxarchives)
* [PPX Libraries](#ppxlibraries)

## <a name="archives">Archives</a>

* case 110: simple `ocaml_archive`
* case 114: two (independent) archives in one package

* case 118: chained archives, one depending on the other

**EXPECTED FAIL** One archive file cannot contain another.

* case 120: simple archive (same as 110), with a module that depends on it, with executable

* case 124: two archives (same as 114), with a module that depends on them, with executable

* case 128: two archives, one depending on the other (same as 118),
  with a module that depends on them, with executable

**EXPECTED FAIL** One archive file cannot contain another.

TODO: archives whose components have cc deps

## <a name="libs">Libraries</a>

* case 210: simple `ocaml_library`

* case 214: two simple (independent) libraries in one package

* case 218: two libraries in one package, one depending on the other

* case 220: same as archives/case120, using `ocaml_library` instead of `ocaml_archive`

* case 224: same as archives/case124, using `ocaml_library` instead of `ocaml_archive`

* case 228: same as archives/case128, using `ocaml_library` instead of `ocaml_archive`

## <a name="nsarchives">Ns Archives</a>

See the demos under [demos/namespaces/obazl](../namespaces/obazl/readme.md)

TODO: ns archives whose submodules have cc deps

## <a name="nslibs">Ns Libraries</a>

See the demos under [demos/namespaces/obazl](../namespaces/obazl/readme.md)

## <a name="ppxarchives">PPX Archives</a>

PPX archive demos use [ppxlib](https://github.com/ocaml-ppx/ppxlib).

**WARNING** If you use ppx archives, you must include a "driver": some
  code to explicitly load the ppx modules. That's because merely
  depending on an archive (to build an executable) is not sufficient
  to load the modules contained in the archive. You have to tell OCaml
  which modules you want. By contrast, if your executable depends on a
  `ppx_library`, then each component module of the library will be
  added to the command line as an explicit dependency, which means it
  will be included in the executable, and any top-level definitions it
  contains will be evaluated at runtime (initialization). In that
  case, a top-level definition like `let () =
  Driver.register_transformation ...` will be evaluated, which will
  enable your PPX handler. If the same module is included an archive
  file instead, it will not automatically be added in this way; you
  need to include some "driver" code that depends on the module, so
  that the compiler will know to pull it out of the archive. One way
  to do that is to change the top-level just cited to something like:
  `let register = Driver.register_transformation ...`, and then
  evaluate that `register` in your driver code. Compare these
  `ppx_archive` demos with the `ppx_library` demos to see the
  diffference.

> Note: the "driver" just mentioned should not be confused with the
     "runner" used in the executable, which is sometimes refered to as
     a "driver".

* case 310: one ppx archive of three ppx_module submodules

* case 314: two independent ppx archives of three ppx_module submodules each. each archive has a driver.

* case 318: two ppx archives of three ppx_module submodules each, one
  depending on the other; each archive has a driver.

## <a name="ppxlibs">PPX Libraries</a>

PPX library demos use [ppxlib](https://github.com/ocaml-ppx/ppxlib).

* case 410: one ppx library of three ppx_module submodules

* case 414: two independent ppx libraries of three ppx_module submodules each

* case 418: two ppx libraries of three ppx_module submodules each, one depending on the other

* case 420: same as ocaml_libraries/case120, using `ppx_library` instead of `ocaml_library`

* case 424: same as ocaml_libraries/case124, using `ppx_library` instead of `ocaml_library`

* case 428: same as ocaml_libraries/case128, using `ppx_library` instead of `ocaml_library`


