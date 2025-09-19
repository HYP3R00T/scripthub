#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPTS_DIR="$BASE_DIR/collection"

handle_add() {
  local file="$1" dest

  if [ -z "${file:-}" ]; then
    echo "❌ No file specified"
    exit 1
  fi

  if [ ! -f "$file" ]; then
    echo "❌ File not found: $file" >&2
    exit 1
  fi

  dest="$SCRIPTS_DIR/$(basename "$file")"
  if [ -e "$dest" ]; then
    echo "❌ Script already exists: $dest" >&2
    exit 1
  fi

  cp "$file" "$dest"
  chmod +x "$dest"

  echo "✅ Added script: $dest"
}
