let () = print_endline "Calling Amod.Bmod.Hello.msg()" ;;
Amod.Bmod.Hello.msg() ;;

open Amod ;;
let () = print_endline "Calling Bmod.Hello.msg() after opening Amod" ;;
Bmod.Hello.msg() ;;

open Amod.Bmod ;;
let () = print_endline "Calling Hello.msg() after opening Amod.Bmod" ;;
Hello.msg() ;;

open Amod.Bmod.Hello ;;
let () = print_endline "Calling msg() after opening Amod.Bmod.Hello" ;;
msg() ;;
