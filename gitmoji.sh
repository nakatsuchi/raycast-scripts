#!/bin/bash

# Dependency: gitmoji (https://github.com/carloscuesta/gitmoji-cli)

# @raycast.title Gitmoji
# @raycast.description Search for emojis defined by Gitmoji related to input.

# @raycast.icon 📙
# @raycast.mode fullOutput
# @raycast.packageName Communication
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "Search for...", "optional": true }

if ! command -v gitmoji &> /dev/null; then
	echo "gitmoji command is required (https://github.com/carloscuesta/gitmoji-cli).";
	exit 1;
fi

emojis=$(gitmoji -s "$1")

if [ -z "$emojis" ]; then
	echo "No emojis found for \"${1}\""
	exit 0
fi

echo "Emojis found for \"$1\":"
echo ""
echo "$emojis"
echo ""
