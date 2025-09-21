#!/bin/bash
# name: catn
# desc: Concatenate files with filenames as headers, wrapped in Markdown code fences
# usage: ./catn.sh file1 file2 ...

# Function to guess language from file extension
guess_lang() {
	case "${1##*.}" in
	sh) echo "bash" ;;
	py) echo "python" ;;
	js) echo "javascript" ;;
	ts) echo "typescript" ;;
	java) echo "java" ;;
	c) echo "c" ;;
	cpp | cc | cxx) echo "cpp" ;;
	h | hpp) echo "cpp" ;;
	go) echo "go" ;;
	rs) echo "rust" ;;
	html | htm) echo "html" ;;
	css) echo "css" ;;
	json) echo "json" ;;
	yaml | yml) echo "yaml" ;;
	md) echo "markdown" ;;
	txt) echo "text" ;;
	*) echo "" ;; # unknown → no language hint
	esac
}

for f in "$@"; do
	if [[ -f "$f" ]]; then
		lang=$(guess_lang "$f")
		echo "- $f"
		echo "\`\`\`${lang}"
		cat "$f"
		echo
		echo "\`\`\`"
		echo
	else
		echo ">>> Skipped: $f (not a regular file)" >&2
	fi
done
