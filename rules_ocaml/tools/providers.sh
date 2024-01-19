#!/bin/sh

bazel cquery $1 --output=starlark --starlark:expr="providers(target)"
