# set200/case220

load(
    "@rules_ocaml//build:rules.bzl",
    "ocaml_library",
    "ocaml_module",
    "ocaml_ns_resolver",
    "ocaml_test",
)

ocaml_test(
    name = "test",
    main = "Test",
    # deps = [":color"]
)

ocaml_module(
    name   = "Test",
    struct = "test.ml",
    opts = [
        "-w", "-27",  ## Error (warning 27): unused variable test_ctxt.
    ],
    deps = [
        ":Color", "@opam.ounit2//lib"],
)

ocaml_library(
    name = "libcolor",
    manifest = [
        # ":Red",
        # ":Green",
        # ":Blue",
        ":Color"
    ],
    visibility = ["//visibility:public"],
)

#################
# ocaml_ns_resolver(
#     name = "color_ns",
#     resolver   = ":Color",
#     ns = "Color",
#     manifest = [
#         ":Red",
#         ":Green",
#         ":Blue",
#         ":Color"
#     ],
# )

ocaml_module(
    name = "Color",
    struct = "color.ml",
    deps   = [
        ":Red",
        ":Green",
        ":Blue"
    ]
)

ocaml_module(
    name = "Red",
    ns_resolver = ":Color",
    struct = "red.ml",
)

ocaml_module(
    name = "Green",
    ns_resolver = ":Color",
    struct = "green.ml",
)

ocaml_module(
    name = "Blue",
    ns_resolver = ":Color",
    struct = "blue.ml",
    visibility = [
        ## this target is used by set400,  cases 415, 425
        "//ns/obazl/set400:__subpackages__",
    ],
)
