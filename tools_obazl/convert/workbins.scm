;; executable stanzas

(define _pkg
  (let* ((_   (load "dune.scm"))
       ;; WARNING: arg to mibl-load-project is relative to cwd,
       ;; but arg to hash-table-ref below is relative to ws root,
       ;; which may not be the same.
       (arg
        "multilibs/mwe/bin"
        )
       (wss (mibl-load-project arg))
       (pkgs (cadr (assoc-in '(@ pkgs) wss)))
       (pkg (hash-table-ref pkgs arg))
       (nzs (dune-pkg->mibl pkg))
       )
    nzs))

(let* ((_   (load "starlark.scm")))
  (mibl-pkg->starlark _pkg)
  )

       ;; (pkg-path (car (assoc-val :pkg-path pkg)))
       ;; (build.mibl (string-append pkg-path "/BUILD.mibl"))
    ;; (let ((outp (open-output-file build.mibl)))
    ;;   ;;(write nzs outp)
    ;;   (pretty-print nzs outp)
    ;;   (close-output-port outp))
    ;; (pretty-print nzs (current-output-port))
