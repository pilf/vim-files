#!/bin/sh

src_dir="$1"
exit "Untried!"

if [ -z "$src_dir" ]; then
    echo "*** ERROR: Must provide src dir name" 1>&2
    exit 1
fi

if [ ! -f "/src/__receiving/$src_dir.tar.gz" ]; then
    echo "*** ERROR: Expected to find /src/__receiving/$src_dir.tar.gz, but didn't :(" 1>&2
    exit 2
fi

top_level_count=$(tar --exclude '*/*' -tf impetus_umbrella.tar.gz | wc -l)
if [ $top_level_count -gt 1 ]; then
    echo "*** ERROR: Expected only one top level directory in tar.gz" 1>&2
    exit 3
fi

top_level_dir=$(tar -tf impetus_umbrella.tar.gz | grep -E '^[^\/]+\/$ ')
if [ -z "$top_level_dir" ]; then 
    echo "*** ERROR: Expected directory at top level of tar.gz" 1>&2
    exit 4
fi 

exit 0
cd /src
tar -xzvf __receiving/$src_dir.tar.gz
cd $src_dir/

# init new git repo if none exists, add everything
if [ ! -d ./.git ]; then
    git init
    git add -A
    git commit -m "Initial commit"
fi

cd ../$src_dir.git/
git config --bool core.bare true

rm -rf ../$src_dir
