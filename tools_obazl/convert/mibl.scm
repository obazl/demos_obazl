;; (format #t "loading ./mibl.scm~%")

(define arg
  "deps/literals/cwd"
  ;; "rules/with-stdout-to/cat/literal_deps"
  ;; "rules/with-stdout-to/cat/glob"
  ;; "rules/with-stdout-to/run"

  ;; "rules/install/run"
  ;; "rules/install/run/mypgm"
  )

(define (-list-pkgs ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws)))
         )
    (format #t "~A: ~A~%" (yellow "pkg ct") (length pkgs))
    (for-each (lambda (k)
                (format #t "~A: ~A~%" (blue "pkg") k))
              (sort! (hash-table-keys pkgs) string<?))
    pkgs))

(define (-dump-pkgs ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws)))
         )
    (for-each (lambda (k)
                (let ((pkg (hash-table-ref pkgs k)))
                  (format #t "~A: ~A => ~A~%" (bggreen "pkg") (green k) pkg)
                  (format #t "~A: ~A~%" (ugreen "pkg-modules") (assoc-val :modules pkg))
                  (format #t "~A: ~A~%" (ugreen "pkg-structures") (assoc-val :structures pkg))
                  (format #t "~A: ~A~%" (ugreen "pkg-signatures") (assoc-val :signatures pkg))
                  (format #t "~A: ~A~%" (ugreen "pkg-files") (assoc-val :files pkg))
                  (if-let ((dune (assoc :dune pkg)))
                          (for-each (lambda (stanza)
                                      (format #t "~A: ~A~%" (ucyan "stanza") stanza))
                                    (cdr dune)))))
              (sort! (hash-table-keys pkgs) string<?))
    pkgs))

(define (-dump-exports ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (exports (car (assoc-val :exports @ws))))
    (format #t "~A: ~A~%" (red "exports keys") (hash-table-keys exports))
    (format #t "~A: ~A~%" (red "exports table") exports)))

(define (-dump-filegroups ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (filegroups (car (assoc-val :filegroups @ws))))
    (format #t "~A: ~A~%" (red "filegroups table") filegroups)))

;;;;;;;;;;;;;;;;;;;;;;;;;
(define (-mibl-load-project path)
  (format #t "~A: ~A (~A)~%" (blue "-mibl-load-project") path (type-of path))
  (format #t "pwd: ~A~%" (pwd))
  (let* ((_wss  (if path (mibl-load-project #|(pwd)|# path)
                    (mibl-load-project)))
         ;; (_ (format #t "~A: ~A~%" (green "_wss") _wss))
         )
    _wss))

(define (-miblize ws)
  (if #t ;; *debugging*
      (format #t "~A: ~A~%" (blue "-miblize") ws))
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws)))
         (mpkg-alist (map (lambda (kv)
                            ;; (format #t "~A: ~A~%" (red "pkg") (cdr kv))
                            (if (assoc 'dune (cdr kv))
                                (let ((mibl-pkg (dune-pkg->mibl :@ (cdr kv))))
                                  ;; (format #t "~A: ~A~%" (red "miblized") mibl-pkg)
                                  (hash-table-set! pkgs (car kv) mibl-pkg)
                                  mibl-pkg)
                                (begin
                                  ;; (format #t "~A: ~A~%" (red "miblize: no dune file") kv)
                                  (cdr kv))
                                ))
                         pkgs)))
        ;; (_ (format #t "~A: ~A~%" (blue "mpkg-alist")
        ;;            mpkg-alist))
        ;; (_ (for-each (lambda (k)
        ;;                (format #t "~A: ~A~%" (blue "pkg") k))
        ;;              (sort! (hash-table-keys pkgs) string<?)))
    (if #t ;; *debugging*
        (format #t "~A: ~A~%" (blue "mpkg ct") (length mpkg-alist)))
    mpkg-alist))

(define (-resolve-labels ws)
  (resolve-labels! (assoc-val ws *mibl-project*)))

(define (-miblarkize ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws))))

    (for-each (lambda (kv)
                (format #t "~A: ~A~%" (blue "miblarkizing") kv)
                ;; dir may have dune-project but no dune file:
                (if (not (null? (cdr kv)))
                    (mibl-pkg->miblark (cdr kv)))
                )
              pkgs)))

(define (-emit-mibl ws)
  (format #t "~A: ~A~%" (blue "-emit-mibl") ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws))))

    (for-each (lambda (kv)
                (format #t "~A: ~A~%" (blue "-emit-mibl pkg") (cdr kv))
                (if (not (null? (cdr kv)))
                    (emit-mibl-pkg (cdr kv)))
                )
              pkgs)))

(define (-emit-starlark ws)
  (format #t "~A: ~A~%" (blue "-emit-starlark") ws)
  (let* ((@ws (assoc-val ws *mibl-project*))
         (pkgs (car (assoc-val :pkgs @ws))))

    (for-each (lambda (kv)
                (format #t "~A: ~A~%" (blue "emitting") (car kv))
                (if (not (null? (cdr kv)))
                    (mibl-pkg->build-bazel ws (cdr kv))
                    (format #t "~A: ~A~%" (blue "skipping") (car kv)))
                )
              pkgs)))

(define* (x-main root-path path)
  (format #t "mibl.scm::-main: ~A~%" path)
  ;; (format #t "*mibl-project*: ~A~%" *mibl-project*)
  ;; (format #t "BYE~%"))

  (set! *build-dyads* #f)
  ;; (set! *wrapped-libs-to-ns-archives* #f)
  ;; (set! *unwrapped-libs-to-archives* #f)

  (let* ((_wss (-mibl-load-project path))
         (_ (debug-print-pkgs :@))

         (mpkgs (-miblize :@))
         (mpkgs (add-filegroups-to-pkgs :@))
         (mpkgs (normalize-manifests! :@))
         (mpkgs (normalize-rule-deps! :@))

         (miblarkize :@)
         (resolve-pkg-file-deps :@)

         (resolve-labels! :@)

         (handle-shared-ppx :@)

         (if *shared-deps*
             (begin
               (handle-shared-deps :@)
               (handle-shared-opts :@)
               ))

         ;; (_ (debug-print-pkgs :@))

         ;; (_ (format #t "XXXXXXXXXXXXXXXX~%"))
         ;; (_ (resolve-labels! :@))

         ;; (_ (resolve-pkg-file-deps :@))

         ;; (_ (-miblarkize :@))

         ;; (_ (-emit-starlark :@))

         (_ (format #t "~A~%" (red "PKG DUMP")))
         (_ (-dump-pkgs :@))
         (_ (-dump-exports :@))
         (_ (-dump-filegroups :@))

         )
    '()))

(define (-main root path)
  (display "hello from ./mibl.scm")
  (newline))
