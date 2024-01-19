let runtime_begin _ ts phase =
    Printf.printf "Begin\t%s\t%Ld\n"
        (Runtime_events.runtime_phase_name phase)
        (Runtime_events.Timestamp.to_int64 ts)

let runtime_end _ ts phase =
    Printf.printf "End\t%s\t%Ld\n"
        (Runtime_events.runtime_phase_name phase)
        (Runtime_events.Timestamp.to_int64 ts)

let () =
    Runtime_events.start ();
    let cursor = Runtime_events.create_cursor None in
    let callbacks = Runtime_events.Callbacks.create ~runtime_begin ~runtime_end ()
    in
    while true do
        let list_ref = ref [] in (* for later fake GC work *)
        for _ = 1 to 100 do
            (* here we do some fake GC work *)
            list_ref := [];
            for _ = 1 to 10 do
                list_ref := (Sys.opaque_identity(ref 42)) :: !list_ref
            done;
            Gc.full_major ();
        done;
        ignore(Runtime_events.read_poll cursor callbacks None);
        Unix.sleep 1
    done
