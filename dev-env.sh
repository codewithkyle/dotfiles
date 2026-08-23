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

# Directories that Omarchy also installs into. These are merged instead of
# mirrored: rsync --delete here would wipe package-installed content this repo
# does not track (omarchy/extensions, omarchy/hooks, omarchy/themed, ...).
merge_dirs=("omarchy")

is_merge_dir() {
    local candidate=$1
    local merge_dir
    for merge_dir in "${merge_dirs[@]}"; do
        [[ $candidate == "$merge_dir" ]] && return 0
    done
    return 1
}

copy_dir() {
    from=$1
    to=$2

    mkdir -p "$to"

    pushd "$from" > /dev/null
    dirs=$(find . -mindepth 1 -maxdepth 1 -type d)
    for dir in $dirs; do
        dir_no_prefix=${dir#./}
        mkdir -p "$to/$dir_no_prefix"
        if is_merge_dir "$dir_no_prefix"; then
            execute rsync -a "$dir_no_prefix/" "$to/$dir_no_prefix/"
        else
            execute rsync -a --delete "$dir_no_prefix/" "$to/$dir_no_prefix/"
        fi
    done
    popd > /dev/null
}

copy_file() {
    from=$1
    to=$2
    name=$(basename $from)

    log "Copying: " $from " -> " $to/$name

    execute rm -f $to/$name
    mkdir -p $to
    execute cp $from $to/$name
}

copy_dir .config $HOME/.config
copy_dir .local $HOME/.local
# copy_dir only walks top-level directories, so loose files under .config/ need
# an explicit copy. Tracking mimeapps.list is what keeps Brave the default
# browser: the Quattro upgrade reset every browser handler in it to Chromium,
# and omarchy-launch-browser resolves the browser through these XDG handlers.
copy_file .config/mimeapps.list $HOME/.config
copy_file .zshrc $HOME
copy_file gruvbox.zsh-theme $HOME/.oh-my-zsh/custom/themes
# User backgrounds for a theme live here in Omarchy 4 (Quattro). The old target,
# ~/.local/share/omarchy/themes/, is now a symlink into root-owned
# /usr/share/omarchy and must never be written to.
# NOTE: copy_file takes a destination DIRECTORY and keeps the source filename.
copy_file ./backgrounds/1-gruvbox.png $HOME/.config/omarchy/backgrounds/gruvbox

log "Moving fonts..."

copy_file Comic-Mono/ComicMonoNerdFont-Regular.ttf $HOME/.local/share/fonts
copy_file Comic-Mono/ComicMonoNerdFont-Bold.ttf $HOME/.local/share/fonts

log "Comic Mono...Done!"

copy_file Berkeley-Mono/Berkeley-Mono-Variable.otf $HOME/.local/share/fonts

log "Berkeley Mono...Done!"
