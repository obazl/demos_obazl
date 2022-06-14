# modules and module bindings

The examples in this directory are intended to demonstrate OCaml's
module concept, independent of build system considerations.

Terminology:

* Orphan or orphaned structfile: a structfile without a corresponding
  sigfile

* Dyad or dyadic module: both structfile and sigfile present. This is
  a build concept, not a language concept. In the language modules are
  always dyadic insofar as they are composed of both a struct and a
  signature. But in the build system, which is based on the file
  system, a module may be represented by a single structfile, which
  OBazl calls an "orphan".

** local dyad: both structfile and sigfile in the same directory

** local synthetic dyad: both structfile and sigfile in the same directory, but under different names

** Split dyad: structfile and sigfile in different directories
