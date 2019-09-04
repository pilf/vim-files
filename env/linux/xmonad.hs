import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

main = do
    xmonad $ defaultConfig `additionalKeysP` myKeys

modm = mod4Mask

-- See: https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Screens_are_in_wrong_order
myKeys =
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "wer" [1,0,2] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]
