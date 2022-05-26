print_endline "Hello from Driver" ;;

(* test hierarchy using open stmts *)

Alpha.Beta1.Gamma.Hello.msg() ;;

print_endline "Testing 'open Alpha'" ;;
open Alpha ;;
Beta1.Gamma.Hello.msg() ;;
Beta1.Gamma.Goodbye.msg() ;;
Beta2.Gamma.Hola.msg() ;;
Beta2.Gamma.Adios.msg() ;;

open Alpha.Beta1 ;;
Gamma.Hello.msg() ;;
Gamma.Goodbye.msg() ;;

open Alpha.Beta1.Gamma ;;
Hello.msg() ;;
Goodbye.msg() ;;

(* **************** *)
print_endline "Testing 'open Alpha.Beta2'" ;;

open Alpha.Beta2 ;;
Gamma.Hola.msg() ;;
Gamma.Adios.msg() ;;

print_endline "Testing Alpha.Beta2.Gamma" ;;
open Alpha.Beta2.Gamma ;;
Hola.msg() ;;
Adios.msg() ;;

(* **************** *)
Alpha.Gamma.Howdy.msg() ;;

open Alpha.Gamma ;;
Howdy.msg()

open Alpha.Gamma.Howdy ;;
msg()

