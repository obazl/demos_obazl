open Core
open Core_unix
open Lexing
open Lexer

let scan filename () =
  let inx = In_channel.create filename in
  let lexbuf = Lexing.from_channel inx in
  translate lexbuf;
  In_channel.close inx

let () =
  Command.basic_spec ~summary:"Parse and display JSON"
    Command.Spec.(empty +> anon ("filename" %: string))
    scan
  |> Command_unix.run
