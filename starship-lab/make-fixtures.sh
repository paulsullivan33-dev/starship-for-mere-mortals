#!/bin/sh
# Build the guide's practice folders from the fixtures in this folder.
# Usage: ./make-fixtures.sh [target-dir]   (default: ~/starship-lab)
set -eu
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
TARGET=${1:-"$HOME/starship-lab"}
mkdir -p "$TARGET/plain" "$TARGET/web-widget"
cp "$HERE/fixtures/web-widget/"* "$HERE/fixtures/web-widget/".nvmrc "$TARGET/web-widget/"
git init -q --bare "$TARGET/trailnotes-remote.git"
git clone -q "$TARGET/trailnotes-remote.git" "$TARGET/trailnotes"
cd "$TARGET/trailnotes"
git config user.name "Lab User"
git config user.email "lab@example.invalid"
git checkout -q -b main
cp "$HERE/fixtures/trailnotes/"* "$HERE/fixtures/trailnotes/".python-version .
git add -A
git commit -qm "First version of trailnotes"
git push -q -u origin main
echo "Lab built in $TARGET"
