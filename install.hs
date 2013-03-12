{-# LANGUAGE OverloadedStrings #-}

import Shelly
import System.Environment

usage = "\
    \This will nuke your existing .vimrc and files, to be\n\
    \sure you really mean to do this add the parameter:\n\
    \   --ireallymeanit\n\
    \\n"

main = shelly $ do
    args <- liftIO $ getArgs
    case args of
        s | elem "--ireallymeanit" s -> echo "of course you do"
        otherwise -> echo usage
        
