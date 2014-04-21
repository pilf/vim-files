#/bin/bash
basedir=$(cd "$(dirname "$0")/../.."; pwd)
echo "Using base dir: $basedir"
ln -s "$basedir/private.xml" $HOME/Library/Application\ Support/KeyRemap4MacBook
