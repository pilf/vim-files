#/bin/bash
basedir=$(cd "$(dirname "$0")/../.."; pwd)
echo "Using base dir: $basedir"
ln -s "$basedir/.vimrc" $HOME
ln -s "$basedir/vimfiles" $HOME
mv $HOME/vimfiles $HOME/.vim
cp $HOME/.bashrc $HOME/.bashrc~
echo "source \"$basedir/env/bash/bashrc-std.sh.inc\"" >> $HOME/.bashrc
if [[ ! -d $HOME/bin ]]; then
    mkdir $HOME/bin
fi
cp "$basedir/env/bash/today" "$HOME/bin"
