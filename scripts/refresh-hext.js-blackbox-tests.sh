#!/usr/bin/env bash

set -e

perror() {
  echo "error: $@" >&2
}

for dependency in jq ; do
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
[[ -w "$j" ]] || {
  perror "not writable: '$j'"
  exit 1
}

htest="$j/hext.js-test"
[ -d "$htest" ] || {
  perror "directory missing: '$htest'"
  exit 1
}

latest_tag=$(curl -s https://api.github.com/repos/html-extract/hext/tags \
  | jq -r '.[0].name')

hext=$(mktemp -d)
trap "rm -rf $hext" EXIT

git clone https://github.com/html-extract/hext "$hext"
( cd "$hext" && git checkout "tags/$latest_tag" )

( cd "$hext/test/case" && \
  echo "const hext_blackbox_tests = $(\
    for i in *.hext ; do \
      i="${i%.*}"
      jq -c -n \
        --arg name "$i" \
        --rawfile hext "$i.hext" \
        --rawfile html "$i.html" \
        --slurpfile expected "$i.expected" \
        '{name: $name, hext: $hext, html: $html, expected: $expected}'
    done \
    | jq -sc);" \
) > "$htest/blackbox.tests.js"

