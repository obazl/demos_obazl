
(define arg
  ;; "rules/with-stdout-to/cat/literal_deps"
  ;; "rules/with-stdout-to/cat/glob"
  ;; "rules/with-stdout-to/run"
  "rules/install/run"
  ;; "rules/install/run/mypgm"
  )

(define _wss
  (let* ((_ (load "starlark.scm"))
         (wss (load-dune arg)))
    wss))

(define @ws (assoc-val :@ _wss))

(define pkgs (car (assoc-val :pkgs @ws)))

;; (define pkg (hash-table-ref pkgs arg))

(define npkgs
  (begin
    (load "starlark.scm")
    (map (lambda (kv)
           (let ((mibl-pkg (dune-pkg->mibl :@ (cdr kv))))
             (hash-table-set! pkgs (car kv) mibl-pkg)))
         pkgs))
       ;; (car (assoc-val :pkgs (assoc-val :@ (load-dune arg))))
       )

;; (define mibl-pkg (dune-pkg->mibl :@ pkg))

;; (let ((exports-tbl (make-hash-table)))
;;   (hash-table-set! exports-tbl "foo" "bar"))

(begin
  (load "starlark.scm")
  (resolve-labels (assoc-val :@ -mibl-ws-table))
  (car (assoc-val :exports (assoc-val :@ _wss))))

(begin
  (load "starlark.scm")
  (for-each (lambda (kv)
              (mibl-pkg->starlark (cdr kv))
              )
            npkgs))

;; (begin
;;   (load "starlark.scm")
;;   (mibl-pkg->starlark mibl-pkg))


