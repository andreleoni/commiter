#!/bin/sh

echo "starting setup..."

echo "Adding the relative path: $(pwd). Do NOT change this repository path! It will NOT work anymore!"

echo "\n" >> ~/.bashrc

echo "#### Alias to the commiter script https://github.com/andreleoni/commiter" >> ~/.bashrc
echo "alias commit-ctx=\". $(pwd)/commit_setctx.sh\"" >> ~/.bashrc
echo "alias commit=\"ruby $(pwd)/commiter.rb\"" >> ~/.bashrc
echo "####" >> ~/.bashrc

echo "setup finished!"
