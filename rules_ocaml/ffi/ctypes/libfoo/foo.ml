open Ctypes

module Types (F : Ctypes.TYPE) = struct
  open F

  let foo_version = constant "FOO_VERSION" int
end

module FooTypes = FooTypesModule

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  let foo_init = foreign "foo_init" (void @-> returning int)

  let foo_fnubar = foreign "foo_fnubar" (string @-> returning void)

  let foo_exit = foreign "foo_exit" (void @-> returning void)
end

module FooFunctions = FooFunctionsModule
