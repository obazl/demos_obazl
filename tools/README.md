# tools

* Source `tools/aliases`. This will give you an alias `bzlog` that
  will browse the command log.

* If you are using `bazelisk` you can pin a particular version of
  Bazel by copying `bazelversion` to `rules_ocaml/.bazelversion` and
  editing to taste. Alternatively, you can use `.bazeliskrc`. See
  https://github.com/bazelbuild/bazelisk for more information.

* Copy `user.bazelrc` to `rules_ocaml/.config`. It will be loaded by
  `rules_ocaml/.bazelrc`. Anything in `.config/` is gitignored by default; do not put `user.bazelrc` under version control.

* `tools/lsws` is a simple shell script that will
   list workspaces.

* `tools/wss` is a simple shell script that will
  print the `external` directory that Bazel uses to store external
  repositories.
