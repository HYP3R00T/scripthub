#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------
# Script Hub - Add Script
# ------------------------------------------------------------------
# Handles adding new scripts to the collection.
# Validates file existence, destination folder, and optional metadata.
# ------------------------------------------------------------------

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COLLECTION_DIR="$BASE_DIR/collection"

# ------------------------------------------------------------------
# Validate that file exists
# ------------------------------------------------------------------
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

# ------------------------------------------------------------------
# Prepare destination folder in collection
# Creates folder if it does not exist
# ------------------------------------------------------------------
prepare_dest_dir() {
	local folder="$1"
	local dest="$COLLECTION_DIR"
	if [ -n "$folder" ]; then
		dest="$COLLECTION_DIR/$folder"
		mkdir -p "$dest"
	fi
	echo "$dest"
}

# ------------------------------------------------------------------
# Check metadata for name and description
# Prompts user if missing
# Returns: 0 to continue, 1 to abort
# ------------------------------------------------------------------
check_metadata() {
	local file="$1"

	local name desc missing_info
	name=$(grep -m1 "^# *name:" "$file" | cut -d: -f2- | xargs || true)
	desc=$(grep -m1 "^# *desc:" "$file" | cut -d: -f2- | xargs || true)

	missing_info=""
	[ -z "$name" ] && missing_info+="name "
	[ -z "$desc" ] && missing_info+="description "

	if [ -n "$missing_info" ]; then
		echo
		echo "Metadata missing in $file: $missing_info"
		echo
		echo "   Add it by including a line at the top of your script like:"
		[ -z "$name" ] && echo "     # name: My Script Name"
		[ -z "$desc" ] && echo "     # desc: A short description of what the script does"
		echo

		if ! gum confirm "Do you want to abort adding this script?"; then
			echo "⚠️ Proceeding without complete metadata"
		else
			echo "❌ Aborting"
			return 1
		fi
	fi

	return 0
}

# ------------------------------------------------------------------
# Copy script to destination folder
# ------------------------------------------------------------------
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

# ------------------------------------------------------------------
# Main handler for "add"
# Arguments:
#   $1 -> source file
#   $2 -> optional destination folder
# ------------------------------------------------------------------
handle_add() {
	local src_file="$1"
	local folder="${2:-}"

	validate_file "$src_file"

	# Check metadata before copying
	check_metadata "$src_file" || return 1

	local dest_dir
	dest_dir=$(prepare_dest_dir "$folder") # declare first, then assign

	copy_script "$src_file" "$dest_dir"
}
