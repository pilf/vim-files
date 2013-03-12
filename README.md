Required:

    GHC
    Shelly: cabal install shelly shelly-extra

    Also, worth noting to try stuff out in Shelly in ghci you must enabled overloaded strings:
        
        ghci -XOverloadedStrings
        ... (in ghci) ...
        Prelude> import Shelly
        Prelude Shelly> shelly $ run "ls" []
        
