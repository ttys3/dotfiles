#!/usr/bin/env bash

# Compare settings.json using bcompare on macOS or Linux

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    bcompare ./settings.json "$HOME/Library/Application Support/Code/User/settings.json"
else
    # Linux
    bcompare ./settings.json "$HOME/.config/Code/User/settings.json"
fi
