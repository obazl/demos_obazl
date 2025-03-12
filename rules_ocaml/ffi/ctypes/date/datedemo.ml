open Ctypes
open PosixTypes
module F = Date_stubs.Functions
module T = Date_stubs.Types

let () = begin
  let timep = allocate_n ~count:1 time_t in
  let time = F.time timep in
  assert (time = !@timep);
  let tm = F.localtime timep in
  Printf.printf "tm.tm_mon  = %d\n" (getf !@tm T.tm_mon);
  Printf.printf "tm.tm_year = %d\n" (getf !@tm DateTypes.tm_year);
  print_endline (F.asctime tm)
end
