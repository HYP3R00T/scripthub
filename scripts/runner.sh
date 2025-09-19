#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------
# Script Hub - Runner
# ------------------------------------------------------------------
# This module handles listing and executing scripts from the collection.
# Supports optional listing (--list) or interactive selection and execution.
# ------------------------------------------------------------------

# Base paths
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPTS_DIR="$BASE_DIR/collection"

# ------------------------------------------------------------------
# Extract the "name" metadata from a script
# Arguments:
#   $1 -> script file path
# Returns:
#   name string (or empty if not found)
# ------------------------------------------------------------------
get_script_name() {
	local file="$1"
	grep -m1 "^# *name:" "$file" | cut -d: -f2- | xargs || true
}

# ------------------------------------------------------------------
# Extract the "desc" metadata from a script
# Arguments:
#   $1 -> script file path
# Returns:
#   description string (or empty if not found)
# ------------------------------------------------------------------
get_script_desc() {
	local file="$1"
	grep -m1 "^# *desc:" "$file" | cut -d: -f2- | xargs || true
}

# ------------------------------------------------------------------
# Format a single script entry for display
# Arguments:
#   $1 -> relative path to script in collection
# Returns:
#   formatted string: [folder] name - description
# ------------------------------------------------------------------
format_script_entry() {
	local rel="$1"
	local abs="$SCRIPTS_DIR/$rel"

	local folder name desc
	folder="$(dirname "$rel")"
	[ "$folder" = "." ] && folder="root"

	name="$(get_script_name "$abs")"
	desc="$(get_script_desc "$abs")"

	[ -z "$name" ] && name="$(basename "$rel" .sh)"
	[ -z "$desc" ] && desc="(no description)"

	echo "[$folder] $name - $desc"
}

# ------------------------------------------------------------------
# List all scripts in the collection, formatted
# ------------------------------------------------------------------
list_scripts() {
	while IFS= read -r rel; do
		format_script_entry "$rel"
	done < <(cd "$SCRIPTS_DIR" && find . -type f -name '*.sh' -printf '%P\n' | sort)
}

# ------------------------------------------------------------------
# Pick a script interactively using gum filter
# Returns:
#   relative path to the selected script
# ------------------------------------------------------------------
pick_script() {
	local sel rel
	mapfile -t entries < <(cd "$SCRIPTS_DIR" && find . -type f -name '*.sh' -printf '%P\n' | sort)
	mapfile -t pretty < <(for e in "${entries[@]}"; do format_script_entry "$e"; done)

	sel=$(printf "%s\n" "${pretty[@]}" | gum filter --placeholder "Select script...") || return 1

	for i in "${!pretty[@]}"; do
		if [[ "${pretty[$i]}" == "$sel" ]]; then
			rel="${entries[$i]}"
			break
		fi
	done

	echo "$rel"
}

# ------------------------------------------------------------------
# Main runner function
# Handles commands:
#   list -> list all scripts
#   run  -> interactive selection and execution (default)
# ------------------------------------------------------------------
handle_runner() {
	case "${1:-}" in
	list)
		list_scripts
		;;
	run | "")
		local rel sel cmd
		rel="$(pick_script)" || return 1
		sel="$SCRIPTS_DIR/$rel"

		# Prompt for command, prefilled with script path
		read -r -e -i "$sel" -p "$ " cmd
		[ -z "$cmd" ] && return 0

		# Execute the selected command/script
		eval -- "$cmd"
		;;
	*)
		echo "❌ Unknown command for runner.sh: $1" >&2
		exit 1
		;;
	esac
}
