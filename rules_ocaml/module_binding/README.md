# modules and module bindings

Terminology:

* Dyadic module: both structfile and sigfile present. This is a build
  concept, not a language concept. In the language modules are always
  dyadic insofar as they are composed of both a struct and a
  signature. But in the build system, which is based on the file
  system, a module may be represented by a single structfile, which
  OBazl calls an "orphan".
* Orphaned structfile: a structfile without a corresponding sigfile
* Split module: structfile and sigfile are in different directories
