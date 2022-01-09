#!/usr/bin/env bash

set -e
set -o pipefail

perror_exit() { echo "Error: $1" >&2 ; exit 1 ; }

latest_tag=$(curl -s https://api.github.com/repos/html-extract/hext/tags \
  | jq -r '.[0].name')

site="https://hext.thomastrapp.com/download"
page_content=$(curl -fs "$site" || perror_exit "curl failed for $site")
lines=$(echo "$page_content" \
        | grep -Eo 'https://github.com/html-extract/hext/archive/.*$' \
        || perror_exit "no versions found on $site")
for i in $lines ; do
  echo "$i" \
    | grep "$latest_tag" >/dev/null \
    || perror_exit "version on $site does not match latest hext tag ($latest_tag, $i)"
done
