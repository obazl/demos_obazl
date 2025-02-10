load("@rules_ocaml//providers:ocaml.bzl",
     "OcamlModuleMarker",
     "OcamlProvider",
     "OCamlSignatureProvider",
     "OcamlNsResolverProvider")

debug = False

def _impl(ctx):
    if debug:
        print(ctx.attr.selection)
        print("ct: %s" % len(ctx.attr.selection))
    for s in ctx.attr.selection:
        if debug:
            print("DefaultInfo: %s" % s[DefaultInfo])
            if OCamlSignatureProvider in s:
                print("OCamlSignatureProvider: %s" % s[OCamlSignatureProvider])

    s = ctx.attr.selection[0]
    if OcamlProvider in s:
        providers.append(s[OcamlProvider])
        if OCamlSignatureProvider in s:
            providers.append(s[OCamlSignatureProvider])
            providers.append(s[DefaultInfo])
    else:
        ## input is a source file
        providers = [DefaultInfo(files = s.files, executable = None)]

    return providers

_selection_proxy = rule(
    implementation = _impl,
    doc = "Workaround for using transitions with selectable attributes",
    attrs = dict(
        selection = attr.label_list(
            allow_files = True
        )
    ),
    executable = False
)

def selection_proxy(name, selectors, no_match_error_msg):

    # if no_match_error:
    #     selectors = "select({sel}),no_match_error = \"{nomatch}\")".format(
    #         sel = selectors, nomatch = no_match_error)
    # else:
    #     selectors = "select({sel})".format(
    #         sel = selectors, nomatch = no_match_error)

    if no_match_error_msg:
        _selection_proxy(
            name = name,
            selection = select(
                selectors,
                no_match_error=no_match_error_msg
            )
        )
    else:
        _selection_proxy(
            name = name,
            selection = select(selectors, no_match_error="foo")
        )
