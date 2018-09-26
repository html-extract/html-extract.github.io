#!/usr/bin/env bash

# Copyright 2016 Thomas Trapp
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


script_name=$(basename "$0")


htmlext="htmlext"
"$htmlext" --help > /dev/null 2>&1 \
  || { echo >&2 "$script_name: error: cannot execute $htmlext"; exit 1; }
curl="curl"
"$curl" --help > /dev/null 2>&1 \
  || { echo >&2 "$script_name: error: cannot execute $curl"; exit 1; }


print_usage()
{
  echo "Usage: $script_name <url> <asset-type>"
  echo "       Print content of all assets of type <asset-type>"
  echo "       referenced in the HTML document at <url>."
  echo "       Valid <asset-type> is either 'js' or 'css'."
  echo "       Base-hrefs are ignored."
}


[ $# -eq 2 ] || { print_usage ; exit 0; }
url="$1"
asset_type="$2"


# Save contents of $url into a temporary
tmp=$(mktemp)
[ -f "$tmp" ] || {
  echo >&2 "$script_name: error: cannot create temporary"
  exit 1
}
trap 'rm "$tmp"' EXIT
"$curl" -f -sS -o "$tmp" "$url" || {
  echo >&2 "$script_name: error: $curl failed for $url"
  exit 1
}


# Collect the assets from the saved HTML document
case "$asset_type" in
  "js")
    hext='<script src:x />'
    ;;
  "css")
    hext='<link rel="stylesheet" href:x />'
    ;;
  *)
    echo >&2 "$script_name: error: <asset-type> must be either js or css"
    print_usage >&2
    exit 1
    ;;
esac
mapfile -t assets < <("$htmlext" -f x -s "$hext" -i "$tmp")


# Download and print all assets to stdout
for asset in "${assets[@]}" ; do
  "$curl" -f -sS "$url$asset" || {
    echo >&2 "$script_name: error: $curl failed for $url$asset"
    exit 1
  }
  echo
done

