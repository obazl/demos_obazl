def cppo(name, src, out,
         defines = []):
    """Runs 'cppo'.

    Args:
        name: Name of the rule instance.
        src:  Name of source file (string).
        out:  Name of output file (string).
        defines: List of -D defines
    """
    if not type(src) == "string":
        fail("'src' arg must be a file name")
    if not type(out) == "string":
        fail("'out' arg must be a file name")

    if len(defines) > 0:
        defines = "-D 'foo'"
    else:
        defines = ""

    native.genrule(
        name    = name,
        srcs  = [src],
        outs  = [out],
        tools = ["@ocaml//tools:cppo"],
        cmd = "\n".join([
            "$(location @ocaml//tools:cppo) {defines} $< > $@".format(
                defines = defines
            )
        ]),
)
