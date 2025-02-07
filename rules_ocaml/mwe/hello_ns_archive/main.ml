let () = print_endline "Hello from Main!"

let msg () = "msg from Main"

let () = print_endline ("Main printing msgs from deps:");
         print_endline(LibHello.Simple.msg());
         print_endline LibHello.Easy.msg;
