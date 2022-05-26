# flat namespaces

In these two examples, we have hierarchical OCaml namespaces
implemented in a flat filesystem namespace. That is, all
implementation files are in the same directory; the namespace
hierarchy is encoded in the file names.

With -no-alias-deps, we get "lazy linking" - we do not need to list
the linkage deps of the namespacing (i.e. aliasing) modules on the
compile command line. Linking will be deferred.

Without -no-alias-deps, dependencies must be listed in the correct
order.

To use, `cd` to the directory and run `make`; then run `./Driver`.

Then run `make clean`.

## troubleshooting

**`Error: Unbound module`**

* Check the spelling of the file names, especially the underscores and capitalization.
* Check the spelling of the aliases in the files - if you rename a module, don't forget to rename it in alias expressions, as well as renaming its file.
* On the command line, dependencies must be listed in dependency-order.
  E.g. if Alpha.ml says `module Beta = Alpha__Beta`, then
  Alpha_Beta.cmo must precede Alpha.cmo in the command line.
