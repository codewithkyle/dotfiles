#!/usr/bin/env bash

script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
dry="0"

while [[ $# > 0 ]]; do
    if [[ $1 == "--dry" ]]; then
        dry="1"
    fi
    shift
done

log() {
    if [[ $dry == "1" ]]; then
        echo "[DRY RUN]: $@"
    else
        echo "$@"
    fi
}

execute() {
    log "execute $@"
    if [[ $dry == "1" ]]; then
        return
    fi

    "$@"
}

log "---------- dev env ----------"

cd $script_dir

copy_dir() {
    from=$1
    to=$2

    pushd $from > /dev/null
    dirs=$(find . -mindepth 1 -maxdepth 1 -type d)
    for dir in $dirs; do
        execute rm -rf $to/$dir
        execute cp -r $dir $to/$dir
    done
    popd > /dev/null
}

copy_file() {
    from=$1
    to=$2
    name=$(basename $from)

    execute rm $to/$name
    execute cp $from $to/$name
}

copy_dir .config $HOME/.config
copy_file .zshrc $HOME
copy_file gruvbox.zsh-theme $HOME/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
copy_file Comic-Mono/ComicMonoNerdFont-Regular.ttf $HOME/.local/share/fonts/ComicMonoNerdFont-Regular.ttf
copy_file Comic-Mono/ComicMonoNerdFont-Bold.ttf $HOME/.local/share/fonts/ComicMonoNerdFont-Bold.ttf
copy_file config $HOME/.config/i3/config
