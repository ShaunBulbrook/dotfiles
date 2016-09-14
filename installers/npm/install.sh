#!/usr/bin/env bash

mkdir -p ~/.npm-global
grep -q "js" ~/.dotfiles/bash/settings.sh || echo "Add js optional to settings.sh"
