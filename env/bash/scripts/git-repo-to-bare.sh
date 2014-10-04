#!/bin/bash
# The process of making a pre exisitng git repo into a bare one is common
# enough I want to encode it in a script somehow.  This has not yet been done.
echo "not yet finished"
exit 1

 2007  tar -czvf impetus.tar.gz impetus
 2008  mv impetus.tar.gz `today`
 2009  ls
 2010  sudo impetus.tar.gz `today`
 2011  sudo ./impetus.tar.gz `today`
 2012  sudo mv ./impetus.tar.gz `today`
 2013  ls
 2014  cd impetus
 2015  ls
 2016  mv .git ../impetus.git
 2017  cd ../impetus.git/
 2018  git config --bool core.bare true
