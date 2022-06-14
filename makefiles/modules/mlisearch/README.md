# searchcmi

Demonstrates that -I does not affect search for .mli file.

If we try to finesse the compiler by putting our .mli file in a
different directory and exposing it using the `-I` option, the
compiler will not search beyond the directory containing the .ml file,
so it will not find badsig/hello.mli,"; it will then infer hello.mli
from hello.ml".
