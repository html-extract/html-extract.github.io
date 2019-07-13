#!/usr/bin/env bash

set -e
set -x

perror() {
  echo "error: $@" >&2
}

for dependency in git doxygen grep ; do
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

doc="$j/libhext-documentation"
[ -d "$doc" -o -f "$doc" ] && {
  perror "output directory already exists: '$doc'"
  exit 1
}

hext=$(mktemp -d)
trap "rm -rf $hext" EXIT

git clone https://github.com/html-extract/hext "$hext"
hext_version=$(grep 'Hext VERSION' "$hext/libhext/CMakeLists.txt" | grep -Eo '([0-9\.]+)')
hext_git_version=$(git -C "$hext" rev-parse --short HEAD)
(
  set -e
  cd "$hext/libhext/doc/doxygen"
  cat doxyfile <(echo "PROJECT_NUMBER=$hext_version-$hext_git_version") | doxygen -
)

cp -R "$hext/libhext/doc/doxygen/output/html" "$doc"

