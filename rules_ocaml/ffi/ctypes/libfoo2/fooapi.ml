module Types (T : Ctypes.TYPE) = struct

  let foo_version = T.constant "FOO_VERSION" T.int
end

(* module GTypes = Types_generated *)

module Functions (F : Ctypes.FOREIGN) = struct

  let foo_init = F.foreign "foo_init"
                   (F.(@->) Ctypes.void (F.returning Ctypes.int))

  let foo_fnubar = F.foreign "foo_fnubar"
                     (F.(@->) Ctypes.string (F.returning Ctypes.void))

  let foo_exit = F.foreign "foo_exit"
                   (F.(@->) Ctypes.void  (F.returning Ctypes.void))
end
