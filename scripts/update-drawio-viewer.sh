#!/usr/bin/env bash
# Vendors the draw.io viewer (https://github.com/jgraph/drawio) into public/drawio/.
# Usage: npm run drawio:update [-- <tag>]   e.g. npm run drawio:update -- v32.5.5
set -euo pipefail

TAG="${1:-v32.5.5}"
BASE="https://raw.githubusercontent.com/jgraph/drawio/${TAG}"
OUT="$(dirname "$0")/../public/drawio"

mkdir -p "$OUT"
curl -fsSL -o "$OUT/viewer-static.min.js" "$BASE/src/main/webapp/js/viewer-static.min.js"
curl -fsSL -o "$OUT/LICENSE" "$BASE/LICENSE"
echo "$TAG" > "$OUT/VERSION"
echo "draw.io viewer ${TAG} -> public/drawio/"
