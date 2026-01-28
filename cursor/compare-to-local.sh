#!/usr/bin/env bash

# Compare settings.json using bcompare for different apps (Cursor, Code, Kiro) on macOS or Linux
# Usage: ./compare-to-local.sh [app]
#   app: Cursor (default), Code, or Kiro

app="${1:-Cursor}"

case "$app" in
    Cursor|cursor)
        mac_path="$HOME/Library/Application Support/Cursor/User/settings.json"
        linux_path="$HOME/.config/Cursor/User/settings.json"
        ;;
    Code|code|VSCode|vscode)
        mac_path="$HOME/Library/Application Support/Code/User/settings.json"
        linux_path="$HOME/.config/Code/User/settings.json"
        ;;
    Kiro|kiro)
        mac_path="$HOME/Library/Application Support/Kiro/User/settings.json"
        linux_path="$HOME/.config/Kiro/User/settings.json"
        ;;
    *)
        echo "Unknown app: $app"
        echo "Supported: Cursor, Code, Kiro"
        exit 1
        ;;
esac

if [[ "$(uname)" == "Darwin" ]]; then
    bcompare ./settings.json "$mac_path"
else
    bcompare ./settings.json "$linux_path"
fi
