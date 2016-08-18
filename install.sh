#!/usr/bin/env sh

PWD=$(dirname "$0")
cd "$PWD" && {
    git submodule update --init --recursive &&
    if [ "$(ls -1 bundle/ | grep -v vundle | wc -l)" -eq 0 ]; then
        vim +BundleInstall +qall
    fi 2>/dev/null
}
