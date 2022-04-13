(* src: https://www2.lib.uchicago.edu/keith/ocaml-class/apps.html#:~:text=A%20Command%2DLine%2DBased%20Application,function%20from%20some%20pages%20back. *)

let cat filename =
  let chan = open_in filename in
  let size = 4 * 1024 in
  let buffer = Bytes.create size in
  let eof = ref false in
    while not !eof do
      let len = input chan buffer 0 size in
	if len > 0
	then print_string (Bytes.sub_string buffer 0 len)
	else eof := true
    done

(* let config () =
 *   (\* NB: ';' is the sequence operator (forces ordering); if we use ','
 *      instead the order of eval may differ *\)
 *   let bwsdir = Sys.getenv "BUILD_WORKSPACE_DIRECTORY" in
 *   print_string ("bwsdir: " ^ bwsdir ^ "\n");
 *   let bwdir = Sys.getenv "BUILD_WORKING_DIRECTORY" in
 *   print_string ("bwdir: " ^ bwdir ^ "\n");
 *   let cwdir = Sys.getcwd () in
 *   print_string ("cwdir: " ^ cwdir ^ "\n");
 *   Sys.chdir bwdir;
 *   let cwdir = Sys.getcwd () in
 *   print_string ("CWDIR: " ^ cwdir ^ "\n") *)

let main () =
  let () = Config.bazel () in
  let len = (Array.length Sys.argv) in
  let argv = (Array.sub Sys.argv 1 (len-1)) in (* skip argv0 *)
  Array.iter cat argv
  (* for i = 0 to Array.length Sys.argv - 1 do
   *   Printf.printf "[%i] %s\n" i Sys.argv.(i);
   * done *)

let () = main ()
