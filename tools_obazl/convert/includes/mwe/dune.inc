;; test dune.inc

(library
 (name included-lib)
 (flags (:standard -open Foo
                   -open Bar
                   ))
 (libraries Foo Bar
            lwt
            re
            ))

(foo bar)