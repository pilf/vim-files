#!/usr/bin/env bash
# The process of making a pre exisitng git repo into a bare one is common
# enough I want to encode it in a script somehow.  This has not yet been done.
echo "not yet finished"
exit 1

# to follow allong at home set $mysource to name of repo

# (optional) - clone from some other source, e.g. 
git clone me@mymachine:/src/$mysource

#backup
tar -czvf `today`/$mysource.tar.gz $mysource

# strip working and rename directory
mv ./$mysource/.git ./$mysource.git && rm -rf ./$mysource

# init git as bare
cd ./$mysource.git && git config --bool core.bare true

# If cloned from original you'll want to add this as the remote
echo "Use the following command to add this remote to original repo:"
echo "$ git remote add origin git@grasslands.no-ip.org:/src/$mysource"
echo "$ git fetch origin"
echo "$ git branch --set-upstream-to=origin/master"

#
# 2007  tar -czvf impetus.tar.gz impetus
# 2012  sudo mv ./impetus.tar.gz `today`
# 2014  cd impetus
# 2016  mv .git ../impetus.git
# 2017  cd ../impetus.git/
# 2018  git config --bool core.bare true

# *** SEE: init-new-repo.sh 
