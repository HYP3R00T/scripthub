#!/bin/bash
# name: catn
# desc: Concatenate files with filenames as headers

# Usage: ./catn.sh file1 file2 ...

for f in "$@"; do
	if [[ -f "$f" ]]; then
		echo "===== $f ====="
		cat "$f"
		echo
	else
		echo ">>> Skipped: $f (not a regular file)" >&2
	fi
done
