#!/usr/bin/env sh

PWD="$(dirname "$0")"
if [ "$(ls -1 ${PWD}/bundle/ | grep -v vundle | wc -l)" -eq 0 ]; then
    vim +BundleInstall +qall
fi 2>/dev/null
