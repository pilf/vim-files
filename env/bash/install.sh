#/bin/bash
basedir=$(cd "$(dirname "$0")/../.."; pwd)
echo "Using base dir: $basedir"
ln -s "$basedir/.vimrc" $HOME
ln -s "$basedir/vimfiles" $HOME
ln -s "$basedir/.tmux.conf" $HOME
ln -s "$basedir/.editrc" $HOME
ln -s "$basedir/.inputrc" $HOME
mv $HOME/vimfiles $HOME/.vim
cp $HOME/.bashrc $HOME/.bashrc~
echo "source \"$basedir/env/bash/bashrc-std.sh.inc\"" >> $HOME/.bashrc
if [[ ! -d $HOME/bin ]]; then
    mkdir $HOME/bin
fi
ln -s "$basedir/env/bash/scripts" $HOME/bin
#cp "$basedir/env/bash/today" "$HOME/bin"

