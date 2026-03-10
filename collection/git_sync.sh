#!/bin/bash
# name: git_sync
# desc: Sync fork to upstream repo

# Usage: ./git_sync.sh

set -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Syncing branch: $BRANCH"

git fetch upstream
git merge upstream/"$BRANCH"
git push origin "$BRANCH"

echo "Done."
