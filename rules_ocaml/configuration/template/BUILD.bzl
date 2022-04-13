load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")

def _demo_config_impl(ctx):
    outfile = ctx.actions.declare_file("config.ml")
    runfiles = ctx.runfiles(files = [outfile])
    ctx.actions.expand_template(
        output = outfile,
        template = ctx.file.template,
        substitutions = {
            "{COLORIZE}": str( ctx.attr.colorize[BuildSettingInfo].value ).lower(),
            "{RED}": str( ctx.attr.red[BuildSettingInfo].value ),
            "{GREEN}": str( ctx.attr.green[BuildSettingInfo].value ),
            "{BLUE}": str( ctx.attr.blue[BuildSettingInfo].value ),
        },
    )
    return [DefaultInfo(files = depset([outfile]), runfiles=runfiles)]

demo_config = rule(
    implementation = _demo_config_impl,
    attrs = {
        "colorize": attr.label( default = ":colorize" ),
        "red":      attr.label( default = ":red" ),
        "green":    attr.label( default = ":green" ),
        "blue":     attr.label( default = ":blue" ),

        "template": attr.label(
            allow_single_file = True,
            mandatory = True
        )
    },
)
