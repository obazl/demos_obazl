# opaque deps

Module A depends on module B, whose sigfile is compiled with
`-opaque`. Then when `b.ml` changes it is recompiled, but this does
not trigger a recompile of `a.ml`.


