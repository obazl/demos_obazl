Uses two composite sigs, A1 and A2, with a single implementation file
a.ml.

This requires that a.ml be copied (or linked) to a1.ml and a2.ml. With
a makefile this must be done explicitly. The OBazl build rules can
infer that it must be done, since they take the module name from the
signature file, and they create a symlink rather than copying the
file.

Note that the symlinks Bazel makes is not written to the source tree;
it remains sequestered in Bazel's work area.
