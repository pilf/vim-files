import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.Fullscreen
import XMonad.Hooks.SetWMName

main = do
    xmonad 
    $ defaultConfig { modMask = mod4Mask, startupHook = setWMName "LG3D" }  `additionalKeysP` myKeys

-- See: https://wiki.haskell.org/Xmonad/Frequently_asked_questions#Screens_are_in_wrong_order
myKeys =
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "wer" [1,0,2] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]

