# set200/case230

load(
    "@rules_ocaml//build:rules.bzl",
    "ocaml_module",
    "ocaml_ns_archive",
    "ocaml_ns_library",
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
        ":libColor", "@ounit2//:ounit2"],
)

#################
ocaml_ns_library(
#ocaml_ns_archive(
    name = "libColor",
    resolver   = ":Color",
    ns = "Color",
    submodules = [
        ":Red",
        ":Green",
        ":Blue",
        # ":Color"
    ],
)

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
    struct = "red.ml",
)

ocaml_module(
    name = "Green",
    struct = "green.ml",
)

ocaml_module(
    name = "Blue",
    struct = "blue.ml",
    # visibility = [
    #     ## this target is used by set400,  cases 415, 425
    #     "//ns/obazl/set400:__subpackages__",
    # ],
)
