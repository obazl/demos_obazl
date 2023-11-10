load("@obazl_tools_cc//config:BASE.bzl",
     _BASE_COPTS    = "BASE_COPTS",
     _BASE_LINKOPTS = "BASE_LINKOPTS")

BASE_SRCS          = []
BASE_DEPS          = [] #_BASE_DEPS
BASE_INCLUDE_PATHS = [] #_BASE_INCLUDE_PATHS
BASE_COPTS         = _BASE_COPTS
BASE_LINKOPTS      = _BASE_LINKOPTS
BASE_DEFINES       = ["PROFILE_$(COMPILATION_MODE)"]
# BASE_DEFINES       = select({
#     "//config/profile:dev?": ["DEVBUILD"],
#     "//conditions:default": []
# }) + select({
#     "//config/trace:trace?": ["TRACING"],
#     "//conditions:default": []
# })
