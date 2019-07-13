#!/usr/bin/env bash

set -e

perror() {
  echo "$@" >&2
}

for dependency in uglifyjs cleancss ; do
  hash $dependency >/dev/null 2>&1 || {
    perror "missing dependency '$dependency'"
    exit 1
  }
done

[[ $# -lt 1 ]] && {
  echo "Usage: $0 <jekyll-directory>"
  exit
}

j="$1"
[[ -d "$j" ]] || {
  perror "not a directory: '$j'"
  exit 1
}

js=(
  "$j/assets/jquery.min.js"
  "$j/assets/reconnecting-websocket.min.js"
  "$j/assets/ace/ace.js"
  "$j/assets/ace/theme-clouds.js"
  "$j/assets/ace/mode-hext.js"
  "$j/assets/ace/mode-html.js"
  "$j/assets/semantic/semantic.min.js"
  "$j/assets/script.js"
)

css=(
  "$j/assets/semantic/semantic.min.css"
  "$j/assets/style.css"
)

cat ${js[@]} | uglifyjs > "$j/assets/combined.min.js"
cat ${css[@]} | cleancss -o "$j/assets/combined.min.css"

