#!/usr/bin/env bash

[[ -z "$1" ]] && exec /bin/bash

BIN="/usr/local/bin/$1"
[[ ! -x ${BIN} && -x "/usr/local/bin/atlas-$1" ]] && BIN="/usr/local/bin/atlas-$1"
shift
exec ${BIN} "$@"
