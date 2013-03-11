{-# LANGUAGE OverloadedStrings #-}

import Shelly

main = shelly $ do
    run "ls" []
