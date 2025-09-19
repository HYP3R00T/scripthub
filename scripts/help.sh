#!/usr/bin/env bash
set -euo pipefail

# ---------- ANSI Colors ----------
GREEN='\033[0;32m'
BOLD='\033[1m'
RESET='\033[0m'

SCRIPT_BANNER=$(
	cat <<'EOF'
███████╗ ██████╗██████╗ ██╗██████╗ ████████╗██╗  ██╗██╗   ██╗██████╗
██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██║  ██║██║   ██║██╔══██╗
███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████║██║   ██║██████╔╝
╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ██╔══██║██║   ██║██╔══██╗
███████║╚██████╗██║  ██║██║██║        ██║   ██║  ██║╚██████╔╝██████╔╝
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝
EOF
)

show_help() {
	# Banner
	printf "%b%s%b\n\n" "$GREEN$BOLD" "$SCRIPT_BANNER" "$RESET"

	# Script title
	printf "%b%s%b\n\n" "$BOLD" "With ♥️ from HYP3R00T" "$RESET"

	# Metadata links
	printf "%bGitHub:%b       https://github.com/HYP3R00T\n" "$GREEN" "$RESET"
	# printf "%bDocumentation:%b https://example.com\n\n" "$GREEN" "$RESET"

	# Commands
	printf "%bCommands:%b\n" "$BOLD" "$RESET"
	printf "  run       - Run a script from your collection\n"
	printf "  list      - List all scripts in your collection\n"
	printf "  add       - Add a new script to your collection\n"
	printf "  help      - Show this help page\n\n"

	# Examples
	printf "%bExamples:%b\n" "$BOLD" "$RESET"
	printf "  scripthub run\n"
	printf "  scripthub list\n"
	printf "  scripthub add ./path/to/script.sh\n"
	printf "  scripthub add ./path/to/script.sh folder_name\n"
	printf "  scripthub help\n"
}

# ---------- main function ----------
handle_help() {
	show_help
}
