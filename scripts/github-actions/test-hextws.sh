#!/usr/bin/env bash

set -e
set -o pipefail

perror_exit() { echo "Error: $1" >&2 ; exit 1 ; }

HEXTD=$(mktemp -d)
git clone "https://github.com/html-extract/hext" "$HEXTD"

: ${WEBSOCAT:="websocat"}
$WEBSOCAT --version >/dev/null || perror_exit "cannot execute websocat (tried '$WEBSOCAT')"

cd "$HEXTD"
GIT_TAG="$(git describe --abbrev=0 --tags)"
git checkout "$GIT_TAG"
wget https://raw.githubusercontent.com/html-extract/hext-on-websockets/master/test/blackbox/blackbox.sh
chmod +x blackbox.sh

./blackbox.sh wss://hextws.thomastrapp.com:8080 test/case/*hext

