#! /bin/sh

# based on tezos
# lib_protocol_compiler/test, proto_demo_noops/lib_protocol/dune.inc

protocol_compiler="$1"
base_protocol="$2"

if ! [ -x "$protocol_compiler" ] ; then
    say "erroneous protocol-compiler, should be an executable"
    usage
    exit 2
fi
if ! [ -f "$base_protocol" ] ; then
    say "erroneous base-protocol"
    usage
    exit 2
fi
if ! [ -f "$(dirname $base_protocol)/main.ml" ] ; then
    say "wrong base-protocol: it needs to have a main.ml: $(dirname $base_protocol)/main.ml"
    usage
    exit 2
fi

try_compile () {
    tmp_out=$(mktemp -d /tmp/pcout-XXXXX)
    say "Trying $*"
    $protocol_compiler -no-hash-check -static -build-dir "$tmp_out" "$@"
}

should_fail () {
    say "$* SHOULD HAVE FAILED"
    exit 4
}

try_compile "$(dirname $base_protocol)/"
