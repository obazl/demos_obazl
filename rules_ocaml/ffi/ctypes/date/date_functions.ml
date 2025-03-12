open Ctypes
open PosixTypes

module Types = DateTypes

module DateFunctions (F : Ctypes.FOREIGN) = struct
  open F

  let time = foreign "time" (ptr time_t @-> returning time_t)

  let asctime = foreign "asctime" (ptr Types.tm @-> returning string)

  let localtime = foreign "localtime" (ptr time_t @-> returning (ptr Types.tm))
end

(* module DateFunctions = DateFunctionsModule *)
