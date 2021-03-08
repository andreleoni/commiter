#!/bin/sh

DEFAULT_SHELL=$(basename $SHELL)
CONFIG_FILE="$HOME/.bashrc"
if [ "$DEFAULT_SHELL" = "zsh" ]; then
    CONFIG_FILE="$HOME/.zshrc"
fi

echo "starting setup..."

echo "Adding the relative path: $(pwd). Do NOT change this repository path! It will NOT work anymore!"

echo "\n" >> "$CONFIG_FILE"

echo "#### Alias to the commiter script https://github.com/andreleoni/commiter" >> "$CONFIG_FILE"
echo "alias commit-ctx=\". $(pwd)/commit_setctx.sh\"" >> "$CONFIG_FILE"
echo "alias commit=\"ruby $(pwd)/commiter.rb\"" >> "$CONFIG_FILE"
echo "####" >> "$CONFIG_FILE"

echo "setup finished!"
