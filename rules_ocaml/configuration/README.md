# Configuration

Demonstrates use of Starlark (a/k/a user-defined) "build settings".

See [User-defined build settings](https://docs.bazel.build/versions/master/skylark/config.html#user-defined-build-settings)

We use some flags predefined by Skylib, a starlark library; see
[Common build setting rules](https://github.com/bazelbuild/bazel-skylib/blob/master/rules/common_settings.bzl)

See also [demos/interop/ffi](../interop/ffi)

## opam  OBSOLETE

Various ways to configure opam

## Options

How to use OBazl's built-in config rules.

## Template

Shows how to write a custom rule and template that can be configured
at the command line to generate a source file.

## TODO

Demo all of the predefined config rules: --@ocaml//verbose, etc.
