#!/usr/bin/env sh

PWD=$(dirname "$0")
cd "$PWD" && {
    git subtree pull --prefix=bundle/Vundle.vim vundle master
    if [ "$(ls -1 bundle/ | grep -v vundle | wc -l)" -eq 0 ]; then
        vim +BundleInstall +qall
    fi 2>/dev/null
}
