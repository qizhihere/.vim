#!/usr/bin/env sh

PWD=$(realpath "$(dirname "$0")")
cd "$PWD" && {
    git pull origin master
    git subtree pull --squash --prefix=bundle/Vundle.vim \
        https://github.com/VundleVim/Vundle.vim master
    if [ "$(ls -1 bundle/ | grep -v Vundle.vim | wc -l)" -eq 0 ]; then
        vim +BundleInstall +qall
    fi 2>/dev/null

    [ "$PWD" != "$HOME/.vim" ] && {
        cmd="ln -s \"$PWD\" \"$HOME/.vim\""
        echo
        echo $cmd
        eval "$cmd"
    }
}

return 0
