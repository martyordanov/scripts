#!/bin/bash

git clone --bare git@github.com:martyordanov/dotrc.git $HOME/.cfg
function dotrc {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
dotrc checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotrc checkout 2>&1 | egrep "\s+\." | awk {'print $1'} |\
        xargs -I{} mv {} .config-backup/{}
fi;
dotrc checkout
dotrc config status.showUntrackedFiles no
