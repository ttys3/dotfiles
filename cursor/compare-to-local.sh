#!/usr/bin/env bash

# Compare settings.json using bcompare on macOS or Linux

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    bcompare ./settings.json "$HOME/Library/Application Support/Cursor/User/settings.json"
else
    # Linux
    bcompare ./settings.json "$HOME/.config/Cursor/User/settings.json"
fi
