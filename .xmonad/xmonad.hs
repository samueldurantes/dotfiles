-- Configuration based on:
-- https://gitlab.com/eflinux/xmonad/-/blob/master/xmonad.hs

import XMonad
import Data.Monoid
import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth = 2

myModMask = mod4Mask

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myNormalBorderColor = "#dddddd"
myFocusedBorderColor = "#5b45ff"

myKeys conf@(XConfig { XMonad.modMask = modm }) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_d), spawn "dmenu_run")
    , ((modm, xK_Print), spawn "flameshot gui")
    , ((modm .|. shiftMask, xK_q), kill)
    , ((modm, xK_space ), sendMessage NextLayout)
    , ((modm, xK_Tab), windows W.focusDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm .|. shiftMask, xK_e), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

myEventHook = mempty
myLogHook = return ()
myStartupHook = return ()

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults

defaults = def 
  { terminal = myTerminal
  , focusFollowsMouse = myFocusFollowsMouse
  , clickJustFocuses = myClickJustFocuses
  , borderWidth = myBorderWidth
  , modMask = myModMask
  , workspaces = myWorkspaces
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , keys = myKeys
  , layoutHook = myLayout
  , handleEventHook = myEventHook
  , logHook = myLogHook
  , startupHook = myStartupHook
  }
