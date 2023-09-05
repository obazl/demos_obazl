;; projects

(define _wss
  (let* ((_   (load "dune.scm"))
       (arg
        "multilibs/mwe"
        )
       (wss (mibl-load-project arg))
       ;; (pkgs (cadr (assoc-in '(@ pkgs) wss)))
       ;; (pkg (hash-table-ref pkgs arg))
       ;; (nzs (dune-pkg->mibl pkg))
       )
    wss))

(define @ws (assoc-val '@ _wss))

(let* ((_ (format #t "alist? ~A~%" (alist? @ws)))
       (name (assoc 'name @ws))
       (_ (format #t "name ~A~%" name))
       (path (assoc 'path @ws))
       (_ (format #t "path ~A~%" path))
       (exports (assoc 'exports @ws))
       (_ (format #t "exports ~A~%" exports))
       (pkgs (car (assoc-val 'pkgs @ws))))
  '())

;; (define exports (car (assoc-val 'exports (assoc-val '@ *mibl-project*))))
;; (fill! exports #f)

(define _pkgs (car (assoc-val 'pkgs @ws)))

;; convert to mibl
(let* ((_ (load "starlark.scm"))
       (exports (car (assoc-val 'exports (assoc-val '@ *mibl-project*)))))
  (map (lambda (kv)
         (let ((mibl-pkg (dune-pkg->mibl (cdr kv) exports)))
           (hash-table-set! _pkgs (car kv) mibl-pkg)))
       _pkgs)
  exports)

;; now resolve target cross-references
(let* ((_   (load "starlark.scm")))
  (resolve-labels @ws)
  ;; (for-each (lambda (kv)
  ;;             (format #t "k: ~A\n" (car kv))
  ;;             ;; (format #t "v: ~A\n" (cdr kv)))
  ;;             )
  ;;           _pkgs)
  ())

;; now write build files
(for-each (lambda (kv)
            (mibl-pkg->starlark (cdr kv))
            )
          _pkgs)


(let* ((_   (load "dune.scm"))
       (root_ws (assoc-val '@ _wss))
       (_ (format #t "alist? ~A~%" (alist? root_ws)))
       (name (assoc 'name root_ws))
       (_ (format #t "name ~A~%" name))
       (path (assoc 'path root_ws))
       (_ (format #t "path ~A~%" path))
       (exports (assoc 'exports root_ws))
       (_ (format #t "exports ~A~%" exports))
       (pkgs (car (assoc-val 'pkgs root_ws)))
       (_ (format #t "(alist? pkgs) ~A~%" (alist? pkgs)))
       (_ (format #t "(hash-table? pkgs) ~A~%" (hash-table? pkgs)))
       (_ (format #t "(type-of pkgs) ~A~%" (type-of pkgs)))
       (keys (hash-table-keys pkgs))
       (_ (format #t "pkgs keys:~%~{    ~A~%~}" keys))
       )
  '())


(define _pkg
  (let* ((_   (load "dune.scm"))
       ;; WARNING: arg to mibl-load-project is relative to cwd,
       ;; but arg to hash-table-ref below is relative to ws root,
       ;; which may not be the same.
       (arg
        ;; "multilibs/mwe/a"
        ;; "multilibs/mwe/bin"
        "multilibs/mwe"
        )
       ;; (wss (mibl-load-project arg))
       (pkgs (cadr (assoc-in '(@ pkgs) wss)))
       (pkg (hash-table-ref pkgs arg))
       (nzs (dune-pkg->mibl pkg))
       )
    nzs))

(let* ((_   (load "starlark.scm")))
  (mibl-pkg->starlark _pkg)
  )

       ;; (pkgs (cadr (assoc-in '(@ pkgs) _wss)))
       ;; (pkg (hash-table-ref pkgs arg))
       ;; (nzs (dune-pkg->mibl pkg))

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
