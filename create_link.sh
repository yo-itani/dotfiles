#!/bin/bash

SCRIPTDIR=$(dirname $0)
create_symlink() {
    ABSPATH="$(cd $(dirname $1) && pwd)"
    SRC="$ABSPATH/$(basename $1)"
    ABSPATH="$(cd $(dirname $2) && pwd)"
    DST="$ABSPATH/$(basename $2)"
    if [ -L "$DST" ]; then
        #echo $(ls -la `dirname $2` | grep "`basename $2`")
        while :
        do
            echo -n "$DST symlink exists. overwrite ? [Y/n]: "
            read YESNO
            if [ "$YESNO" = "Y" ]; then
                rm "$DST"
                ln -s -v "$SRC" "$DST"
                break
            elif [ "$YESNO" = "n" ]; then
                break
            fi
        done
    elif [ -e "$DST" ]; then
        #diff -u $1 $2
        while :
        do
            echo "$2 exists. overwrite ? [Y/n]"
            read YESNO
            if [ "$YESNO" = "Y" ]; then
                BACKUPFILE=$DST.$(date +%Y%m%d)
                cp $DST $BACKUPFILE
                echo "backup file($BACKUPFILE) created"
                rm "$DST"
                ln -s -v "$SRC" "$DST"
                break
            elif [ "$YESNO" = "n" ]; then
                break
            fi
        done
    else
        ln -s -v "$SRC" "$DST"
    fi
}

SCRIPTDIR="$(cd $(dirname $0) && pwd)"
VUNDLEDIR="$SCRIPTDIR/.vim/bundle/Vundle.vim"
if ! [ -e "$VUNDLEDIR" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLEDIR
fi
# .bashrcのシンボリックリンク化をやめる
# create_symlink "$SCRIPTDIR/.bashrc" ~/.bashrc
create_symlink "$SCRIPTDIR/.vim" ~/.vim
create_symlink "$SCRIPTDIR/.vimrc" ~/.vimrc
