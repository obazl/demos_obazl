load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

OBAZL_BRANCH = "dev"

all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

def fetch_repos():

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        ],
    )

    maybe(
        git_repository,
        name = "libs7",
        remote = "https://github.com/obazl/libs7",
        branch = OBAZL_BRANCH
    )

    ## logc vendored
#     maybe(
#         http_archive,
#         name = "logc",
#         url  = "https://github.com/rxi/log.c/archive/refs/heads/master.zip",
#         sha256 = "4839147fb0674bcfb4b3ede3d1db055546d12315d2f7592862293dfd1c065f83",
#         strip_prefix = "log.c-master",
#         build_file_content = """
# cc_library(
#     name  = 'logc',
#     linkstatic = 1,
#     alwayslink = 1,
#     srcs  = ['src/log.c'],
#     hdrs = ['src/log.h'],
#     copts = [
#         '-std=c11',
#         # '-g',
#     ],
#     local_defines = ['LOG_USE_COLOR'],
#     visibility = ['//visibility:public']
# )
# """,
#         # sha256 = "33a5690733c5cc2ede39cb62ebf89e751f2448e27f20c8b2fbbc7d136b166804",
#     )

    ######
    maybe(
        http_archive,
        name = "re2c",
        urls = [
            "https://github.com/skvadrik/re2c/archive/refs/tags/3.0.zip",
        ],
        strip_prefix = "re2c-3.0",
        sha256 = "5824ec24047b43beac19d9976c99d4761bdc9aaebef6e32a96c88d36bb28c9dd",
        build_file = "//vendored/re2c:BUILD.bazel"
    )
    # "https://github.com/skvadrik/re2c/archive/refs/tags/2.1.1.zip"
    # strip_prefix = "re2c-2.1.1",
    # sha256 = "080931d214943ea021fa9360a4694e824674e5c0f2e880153e8cb41982453aa6",


    maybe( ## for re2c
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
        strip_prefix = "rules_foreign_cc-0.9.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
        )

    ######
    maybe(
        git_repository,
        name = "makeheaders",
        remote = "https://github.com/obazl/makeheaders",
        # branch = "main"
        commit = "bb528f3edac6c00953010e28d51e4a52da7555aa",
        shallow_since = "1618495335 -0500"
        # http_archive,
        # name = "makeheaders",
        # urls = [
        #     "https://github.com/obazl/makeheaders/archive/57bae6cc7e88783b060acf711bc21f99d8380ca5.tar.gz"
        # ],
        # strip_prefix = "makeheaders-57bae6cc7e88783b060acf711bc21f99d8380ca5",
        # sha256 = "83ef79d69c02348efd1f52a85fa10e9bd57333e89a23c2fe66a9b298c055d164"
    )

    ######
    maybe(
        http_archive,
        name = "uthash",
        build_file_content = """
filegroup(name = "include", srcs = glob(["include/*.h"]), visibility = ["//visibility:public"])
    """,
        urls = [
            "https://github.com/troydhanson/uthash/archive/refs/tags/v2.3.0.tar.gz"
        ],
        strip_prefix = "uthash-2.3.0",
        sha256 = "e10382ab75518bad8319eb922ad04f907cb20cccb451a3aa980c9d005e661acc"
    )

    ######
#     maybe(
#         http_archive,
#         name = "libinih",
#         # build_file_content = "exports_files(['ini.c', 'ini.h'])",
#     build_file_content = """
# filegroup(name = "srcs", srcs = ["ini.c", "ini.h"], visibility = ["//visibility:public"])
# filegroup(name = "hdrs", srcs = ["ini.h"], visibility = ["//visibility:public"])""",
#         urls = [
#             "https://github.com/benhoyt/inih/archive/cb55f57d87ae840bd0f65dbe6bd22fa021a873a7.tar.gz"
#         ],
#         strip_prefix = "inih-cb55f57d87ae840bd0f65dbe6bd22fa021a873a7",
#         sha256 = "26d05999033eef9e3abca2d4dbf3dc2e4a24335df51231b6faa093be06bb19d7"
#     )

    # Unit testing framework for C
    # http://www.throwtheswitch.org/unity
    maybe(
        http_archive,
        name = "unity",
        urls = [
            "https://github.com/ThrowTheSwitch/Unity/archive/refs/tags/v2.5.2.zip",
        ],
        strip_prefix = "v2.5.2",
        build_file_content = all_content,
        workspace_file_content = "workspace( name = \"unity\" )"
    )

