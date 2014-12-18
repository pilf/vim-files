#/bin/bash
basedir=$(cd "$(dirname "$0")/../.."; pwd)
echo "Using base dir: $basedir"
ln -s "$basedir/.vimrc" $HOME
rm $HOME/.vim && ln -s "$basedir/.vim" $HOME
ln -s "$basedir/.tmux.conf" $HOME
ln -s "$basedir/.tmux-osx.conf" $HOME
ln -s "$basedir/.tmux-linux.conf" $HOME
ln -s "$basedir/.editrc" $HOME
ln -s "$basedir/.inputrc" $HOME
ln -s "$basedir/.iex.exs" $HOME
ln -s "$basedir/.irssi" $HOME

if [[ -f $HOME/.gitconfig ]]; then
    echo "Moving pre-exisitng ~/.gitconfig to ~/.gitconfig.old"
    mv $HOME/.gitconfig $HOME/.gitconfig.old
    ln -s "$basedir/.gitconfig" $HOME
fi

if ! grep "bashrc-std.sh.inc" ~/.bashrc; then 
    cp $HOME/.bashrc $HOME/.bashrc~
    echo "source \"$basedir/env/bash/bashrc-std.sh.inc\"" >> $HOME/.bashrc
fi

if [[ ! -d $HOME/bin ]]; then
    mkdir $HOME/bin
fi
ln -s "$basedir/env/bash/scripts" $HOME/bin
