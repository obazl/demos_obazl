module Types (T : Ctypes.TYPE) = struct

  let foo_version = T.constant "FOO_VERSION" T.int
end
