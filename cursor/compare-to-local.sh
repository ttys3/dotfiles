#!/usr/bin/env bash

# Compare settings.json using bcompare for different apps (Cursor, Code, Kiro) on macOS or Linux
# Usage: ./compare-to-local.sh [app]
#   app: Cursor (default), Code, or Kiro


app="${1:-Cursor}"
app_name=$(echo "$app" | awk '{print tolower($0)}')
case $app_name in
    cursor|code|kiro) ;;
    vscode) app_name=code ;;
    *)
        echo "Unknown app: $app"
        echo "Supported: Cursor, Code, Kiro"
        exit 1
        ;;
esac
app_capitalized="${app_name^}"

if [[ "$(uname)" == "Darwin" ]]; then
    local_path="$HOME/Library/Application Support/${app_capitalized}/User/settings.json"
else
    local_path="$HOME/.config/${app_capitalized}/User/settings.json"
fi

bcompare ./settings.json "$local_path"
