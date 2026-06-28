#!/bin/sh
PAK_DIR="$(dirname "$0")"
PAK_NAME="$(basename "$PAK_DIR")"
PAK_NAME="${PAK_NAME%.*}"
rm -f "$LOGS_PATH/$PAK_NAME.txt"
exec >>"$LOGS_PATH/$PAK_NAME.txt"
exec 2>&1
cd "$PAK_DIR" || exit 1
export HOME="${SHARED_USERDATA_PATH:-$HOME}/StarForce"
mkdir -p "$HOME"
exec "./StarForce.elf" "$@"
