let bazel () =
  (* NB: ';' is the sequence operator (forces ordering); if we use ','
     instead the order of eval may differ *)
  (* let bwsdir = Sys.getenv "BUILD_WORKSPACE_DIRECTORY" in *)
  (* print_string ("bwsdir: " ^ bwsdir ^ "\n"); *)
  let bwdir =
    try Sys.getenv "BUILD_WORKING_DIRECTORY" with
      Not_found -> "" in
  (* print_string ("bwdir: " ^ bwdir ^ "\n"); *)
  (* let cwdir = Sys.getcwd () in *)
  (* print_string ("cwdir: " ^ cwdir ^ "\n"); *)
  if (String.length bwdir) > 0 then Sys.chdir bwdir;
  (* let cwdir = Sys.getcwd () in *)
  (* print_string ("CWDIR: " ^ cwdir ^ "\n") *)
