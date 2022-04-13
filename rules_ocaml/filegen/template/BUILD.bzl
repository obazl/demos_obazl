load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")

def _demo_config_impl(ctx):
    ## To output a new file, you must notify Bazel so it can put it in the dependency graph.
    ## Do this by registering a `declare_file` action:
    outfile = ctx.actions.declare_file("config.ml")
    runfiles = ctx.runfiles(files = [outfile])
    ctx.actions.expand_template(
        output = outfile,
        template = ctx.file.template,
        substitutions = {
            ## The syntax of the keys here is unrestricted, it just
            ## needs to match whatever is in the template file. E.g.
            ## we could use "{{RED}}", or "<RED>", etc.
            "{COLORIZE}": str( ctx.attr.colorize[BuildSettingInfo].value ).lower(),
            "{RED}": str( ctx.attr.red[BuildSettingInfo].value ),
            "{GREEN}": str( ctx.attr.green[BuildSettingInfo].value ),
            "{BLUE}": str( ctx.attr.blue ),
        },
    )
    return [DefaultInfo(files = depset([outfile]), runfiles=runfiles)]

demo_config = rule(
    implementation = _demo_config_impl,
    attrs = {
        ## IMPORTANT: Only label-valued attributes can be set from the command line.
        ## Notice that we set the defaults to labels that resolve to build setting rules.
        "colorize": attr.label( default = ":colorize" ),
        "red":      attr.label( default = ":red" ),
        ## Here we use a fully qualified label, instead of `:green`:
        "green":    attr.label( default = "//filegen/template:green" ),
        ## NOTE: for demo purpose we use an int-valued attribute for
        ## 'blue'. It cannot be set from the command line.
        "blue":     attr.int( default = 0 ),

        "template": attr.label(
            allow_single_file = True,
            mandatory = True
        )
    },
)
