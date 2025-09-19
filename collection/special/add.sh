#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COLLECTION_DIR="$BASE_DIR/collection"

validate_file() {
	local file="$1"
	if [ -z "$file" ]; then
		echo "❌ No file specified"
		exit 1
	fi
	if [ ! -f "$file" ]; then
		echo "❌ File not found: $file"
		exit 1
	fi
}

prepare_dest_dir() {
	local folder="$1"
	local dest="$COLLECTION_DIR"
	if [ -n "$folder" ]; then
		dest="$COLLECTION_DIR/$folder"
		mkdir -p "$dest"
	fi
	echo "$dest"
}

copy_script() {
	local src="$1"
	local dest_dir="$2"

	local dest
	dest="$dest_dir/$(basename "$src")"

	if [ -e "$dest" ]; then
		echo "❌ Script already exists: $dest"
		exit 1
	fi

	cp "$src" "$dest"
	chmod +x "$dest"
	echo "✅ Added script: $dest"
}

handle_add() {
	local src_file="$1"
	local folder="${2:-}"

	validate_file "$src_file"
	local dest_dir
	dest_dir=$(prepare_dest_dir "$folder") # declare first, then assign
	copy_script "$src_file" "$dest_dir"
}
