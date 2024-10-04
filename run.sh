#!/bin/bash
if [[ $2 == *"iscriptevaluator.exe"* ]]; then
	echo "ignoring iscriptevaluator.exe"
	exit 0
fi

set -e

COMPAT_DIR=$(dirname "${BASH_SOURCE[0]}")
GODOT_EXE=$(basename "$2" .exe)

rm -f "$GODOT_EXE"
cp "$COMPAT_DIR/godot" "$GODOT_EXE" 

shift # skip "waitforexitandrun"
shift # skip .exe path

"./$GODOT_EXE" $@