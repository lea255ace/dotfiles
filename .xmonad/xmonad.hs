import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Actions.SpawnOn

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/leef/.xmobarrc"
    xmonad $ defaultConfig
        { borderWidth         = 2
        , terminal            = "xterm"
        , normalBorderColor   = "#888888"
        , focusedBorderColor  = "#9900ff"
        , focusFollowsMouse   = False
        , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP $ xmobarPP -- TODO: configure this to give a more useful window list
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        , ppHiddenNoWindows = xmobarColor "grey" ""
                        }
        , modMask = mod4Mask
        , workspaces = myWorkspaces
        } `additionalKeys` myKeys

myWorkspaces = ["main","chat","mail","web","work","6","music","admin","hide"]

myKeys = [ -- TODO: add bindings to cycle workspaces with CycleWS
        ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
      , ((mod4Mask,               xK_p), spawn "dmenu_run -fn 'Astro-16'")
      , ((0, xK_Print), spawn "rhythmbox-client --no-start --previous")
      , ((0, xK_Scroll_Lock),  spawn "rhythmbox-client --no-start --play-pause")
      , ((0, xK_Pause), spawn "rhythmbox-client --no-start --next")
    ] ++
    [
      ((m .|. mod4Mask, k), windows $ f i)
          | (i, k) <- zip myWorkspaces [xK_1 ..xK_9]
          , (f, m) <- [(W.view, 0), (W.shift, shiftMask)] -- TODO: try replacing view w/ greedyView
    ] ++
    [
      ((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
          | (key, sc) <- zip [xK_w, xK_e] [0,1]
          , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

myManageHook = composeAll
  [
      className =? "Iceweasel"  --> doShift "web"
    , className =? "Icedove"    --> doShift "mail"
    , className =? "Rhythmbox"  --> doShift "music"
    , className =? "Pidgin"     --> doShift "chat"

    , title =? "chat"         --> doShift "chat"
    , title =? "leefmail"     --> doShift "mail"
    , title =? "mickmail"     --> doShift "mail"

    , className =? "Pinentry"   --> doFloat
    , className =? "Gimp"       --> doFloat
  ]
