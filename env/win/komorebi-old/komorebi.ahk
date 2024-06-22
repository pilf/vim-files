#SingleInstance Force

; Enable hot reloading of changes to this file
Run, komorebic.exe watch-configuration enable, , Hide

; Configure the invisible border dimensions
;Run, komorebic.exe invisible-borders 7 0 14 7, , Hide
Run, komorebic.exe invisible-borders 0 0 0 0, , Hide
Run, komorebic.exe invisible-borders 0 1 0 0, , Hide
Run, komorebic.exe invisible-borders 0 2 0 0, , Hide
Run, komorebic.exe invisible-borders 0 3 0 0, , Hide
Run, komorebic.exe invisible-borders 0 4 0 0, , Hide
Run, komorebic.exe invisible-borders 0 5 0 0, , Hide
Run, komorebic.exe invisible-borders 0 6 0 0, , Hide
Run, komorebic.exe invisible-borders 0 7 0 0, , Hide
Run, komorebic.exe invisible-borders 0 8 0 0, , Hide
Run, komorebic.exe invisible-borders 0 9 0 0, , Hide
Run, komorebic.exe invisible-borders 1 0 0 0, , Hide
Run, komorebic.exe invisible-borders 1 1 0 0, , Hide
Run, komorebic.exe invisible-borders 1 2 0 0, , Hide
Run, komorebic.exe invisible-borders 1 3 0 0, , Hide
Run, komorebic.exe invisible-borders 1 4 0 0, , Hide
Run, komorebic.exe invisible-borders 1 5 0 0, , Hide
Run, komorebic.exe invisible-borders 1 6 0 0, , Hide
Run, komorebic.exe invisible-borders 1 7 0 0, , Hide
Run, komorebic.exe invisible-borders 1 8 0 0, , Hide
Run, komorebic.exe invisible-borders 1 9 0 0, , Hide

Run, komorebic.exe container-padding 0 0 0, , Hide
Run, komorebic.exe container-padding 0 1 0, , Hide
Run, komorebic.exe container-padding 0 2 0, , Hide
Run, komorebic.exe container-padding 0 3 0, , Hide
Run, komorebic.exe container-padding 0 4 0, , Hide
Run, komorebic.exe container-padding 0 5 0, , Hide
Run, komorebic.exe container-padding 0 6 0, , Hide
Run, komorebic.exe container-padding 0 7 0, , Hide
Run, komorebic.exe container-padding 0 8 0, , Hide
Run, komorebic.exe container-padding 0 9 0, , Hide
Run, komorebic.exe container-padding 1 0 0, , Hide
Run, komorebic.exe container-padding 1 1 0, , Hide
Run, komorebic.exe container-padding 1 2 0, , Hide
Run, komorebic.exe container-padding 1 3 0, , Hide
Run, komorebic.exe container-padding 1 4 0, , Hide
Run, komorebic.exe container-padding 1 5 0, , Hide
Run, komorebic.exe container-padding 1 6 0, , Hide
Run, komorebic.exe container-padding 1 7 0, , Hide
Run, komorebic.exe container-padding 1 8 0, , Hide
Run, komorebic.exe container-padding 1 9 0, , Hide

; Enable focus follows mouse
Run, komorebic.exe focus-follows-mouse enable, , Hide

; Ensure there are 10 workspaces on each monitor
Run, komorebic.exe ensure-workspaces 0 10, , Hide
Run, komorebic.exe ensure-workspaces 1 10, , Hide

; Give the workspaces some optional names
;Run, komorebic.exe workspace-name 0 0 bsp, , Hide
;Run, komorebic.exe workspace-name 0 1 columns, , Hide
;Run, komorebic.exe workspace-name 0 2 thicc, , Hide
;Run, komorebic.exe workspace-name 0 3 matrix, , Hide
;Run, komorebic.exe workspace-name 0 4 floaty, , Hide

; Set the padding of the different workspaces
Run, komorebic.exe workspace-padding 0 0 10, , Hide
Run, komorebic.exe workspace-padding 0 0 5, , Hide
Run, komorebic.exe workspace-padding 0 2 0, , Hide
Run, komorebic.exe workspace-padding 0 3 0, , Hide
Run, komorebic.exe workspace-padding 0 4 0, , Hide
Run, komorebic.exe workspace-padding 0 5 10, , Hide
Run, komorebic.exe workspace-padding 0 5 5, , Hide
Run, komorebic.exe workspace-padding 0 7 0, , Hide
Run, komorebic.exe workspace-padding 0 8 0, , Hide
Run, komorebic.exe workspace-padding 0 9 0, , Hide
Run, komorebic.exe workspace-padding 1 0 10, , Hide
Run, komorebic.exe workspace-padding 1 1 0, , Hide
Run, komorebic.exe workspace-padding 1 2 0, , Hide
Run, komorebic.exe workspace-padding 1 3 0, , Hide
Run, komorebic.exe workspace-padding 1 4 0, , Hide
Run, komorebic.exe workspace-padding 1 5 10, , Hide
Run, komorebic.exe workspace-padding 1 6 0, , Hide
Run, komorebic.exe workspace-padding 1 7 0, , Hide
Run, komorebic.exe workspace-padding 1 8 0, , Hide
Run, komorebic.exe workspace-padding 1 9 0, , Hide

; Set the layouts of different workspaces
Run, komorebic.exe workspace-layout 0 1 columns, , Hide

; Set the floaty layout to not tile any windows
Run, komorebic.exe workspace-tiling 0 4 disable, , Hide

; Always show chat apps on the second workspace
Run, komorebic.exe workspace-rule exe slack.exe 0 1, , Hide
Run, komorebic.exe workspace-rule exe Discord.exe 0 1, , Hide

; Always float IntelliJ popups, matching on class
Run, komorebic.exe float-rule class SunAwtDialog, , Hide
; Always float Control Panel, matching on title
Run, komorebic.exe float-rule title "Control Panel", , Hide
; Always float Task Manager, matching on class
Run, komorebic.exe float-rule class TaskManagerWindow, , Hide
; Always float Wally, matching on executable name
Run, komorebic.exe float-rule exe Wally.exe, , Hide
Run, komorebic.exe float-rule exe wincompose.exe, , Hide
; Always float Calculator app, matching on window title
Run, komorebic.exe float-rule title Calculator, , Hide
Run, komorebic.exe float-rule exe 1Password.exe, , Hide

; Always manage forcibly these applications that don't automatically get picked up by komorebi
Run, komorebic.exe manage-rule exe TIM.exe, , Hide

; Identify applications that close to the tray
Run, komorebic.exe identify-tray-application exe Discord.exe, , Hide

; Identify applications that have overflowing borders
Run, komorebic.exe identify-border-overflow exe Discord.exe, , Hide

; Change the focused window, Alt + Vim direction keys
!h::
Run, komorebic.exe focus left, , Hide
return

!j::
Run, komorebic.exe focus down, , Hide
return

!k::
Run, komorebic.exe focus up, , Hide
return

!l::
Run, komorebic.exe focus right, , Hide
return

; Move the focused window in a given direction, Alt + Shift + Vim direction keys
!+h::
Run, komorebic.exe move left, , Hide
return

!+j::
Run, komorebic.exe move down, , Hide
return

!+k::
Run, komorebic.exe move up, , Hide
return

!+l::
Run, komorebic.exe move right, , Hide
return

; Stack the focused window in a given direction, Alt + Shift + direction keys
!+Left::
Run, komorebic.exe stack left, , Hide
return

!+Down::
Run, komorebic.exe stack down, , Hide
return

!+Up::
Run, komorebic.exe stack up, , Hide
return

!+Right::
Run, komorebic.exe stack right, , Hide
return

!]::
Run, komorebic.exe cycle-stack next, , Hide
return

![::
Run, komorebic.exe cycle-stack previous, , Hide
return

; Unstack the focused window, Alt + Shift + D
!+d::
Run, komorebic.exe unstack, , Hide
return

; Promote the focused window to the top of the tree, Alt + Shift + Enter
!+Enter::
Run, komorebic.exe promote, , Hide
return

; Switch to an equal-width, max-height column layout on the main workspace, Alt + Shift + C
!+c::
Run, komorebic.exe workspace-layout 0 0 columns, , Hide
return

; Switch to the default bsp tiling layout on the main workspace, Alt + Shift + T
!+t::
Run, komorebic.exe workspace-layout 0 0 bsp, , Hide
return

; Toggle the Monocle layout for the focused window, Alt + Shift + F
!+f::
Run, komorebic.exe toggle-monocle, , Hide
return

; Toggle native maximize for the focused window, Alt + Shift + =
!+=::
Run, komorebic.exe toggle-maximize, , Hide
return

; Flip horizontally, Alt + X
!x::
Run, komorebic.exe flip-layout horizontal, , Hide
return

; Flip vertically, Alt + Y
!y::
Run, komorebic.exe flip-layout vertical, , Hide
return

; Force a retile if things get janky, Alt + Shift + R
!+r::
Run, komorebic.exe retile, , Hide
return

; Float the focused window, Alt + F
!f::
Run, komorebic.exe toggle-float, , Hide
return

; Reload ~/komorebi.ahk, Alt + O
!o::
Run, komorebic.exe reload-configuration, , Hide
return

; Pause responding to any window events or komorebic commands, Alt + P
;!p::
;Run, komorebic.exe toggle-pause, , Hide
;return

; Switch to workspace
!1::
Send !
Run, komorebic.exe focus-workspace 0, , Hide
return

!2::
Send !
Run, komorebic.exe focus-workspace 1, , Hide
return

!3::
Send !
Run, komorebic.exe focus-workspace 2, , Hide
return

!4::
Send !
Run, komorebic.exe focus-workspace 3, , Hide
return

!5::
Send !
Run, komorebic.exe focus-workspace 4, , Hide
return

!6::
Send !
Run, komorebic.exe focus-workspace 5, , Hide
return

!7::
Send !
Run, komorebic.exe focus-workspace 6, , Hide
return

!8::
Send !
Run, komorebic.exe focus-workspace 7, , Hide
return

!9::
Send !
Run, komorebic.exe focus-workspace 8, , Hide
return

!0::
Send !
Run, komorebic.exe focus-workspace 9, , Hide
return

; Move window to workspace
!+1::
Run, komorebic.exe move-to-workspace 0, , Hide
return

!+2::
Run, komorebic.exe move-to-workspace 1, , Hide
return

!+3::
Run, komorebic.exe move-to-workspace 2, , Hide
return

!+4::
Run, komorebic.exe move-to-workspace 3, , Hide
return

!+5::
Run, komorebic.exe move-to-workspace 4, , Hide
return

!+6::
Run, komorebic.exe move-to-workspace 5, , Hide
return

!+7::
Run, komorebic.exe move-to-workspace 6, , Hide
return

!+8::
Run, komorebic.exe move-to-workspace 7, , Hide
return

!+9::
Run, komorebic.exe move-to-workspace 8, , Hide
return

!+0::
Run, komorebic.exe move-to-workspace 9, , Hide
return

!e::
Run, komorebic.exe focus-monitor 0, , Hide
return

!+e::
Run, komorebic.exe move-to-monitor 0, , Hide
return

!w::
Run, komorebic.exe focus-monitor 1, , Hide
return

!+w::
Run, komorebic.exe move-to-monitor 1, , Hide
return

!m::
Run, komorebic.exe manage, , Hide
return



; App specific overrides

; Google Chrome
; If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
Run, komorebic.exe identify-tray-application exe "chrome.exe", , Hide

; Targets JetBrains IDE popups and floating windows
Run, komorebic.exe float-rule class "SunAwtDialog", , Hide

; Microsoft Outlook
Run, komorebic.exe identify-border-overflow-application exe "OUTLOOK.EXE", , Hide
Run, komorebic.exe identify-layered-application exe "OUTLOOK.EXE", , Hide
; If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
Run, komorebic.exe identify-tray-application exe "OUTLOOK.EXE", , Hide

; Microsoft Teams
; Target Teams pop-up notification windows
Run, komorebic.exe float-rule title "Microsoft Teams Notification", , Hide

; Mozilla Firefox
Run, komorebic.exe identify-object-name-change-application exe "firefox.exe", , Hide
; If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
Run, komorebic.exe identify-tray-application exe "firefox.exe", , Hide

; Spotify
Run, komorebic.exe identify-border-overflow-application exe "Spotify.exe", , Hide
; If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
Run, komorebic.exe identify-tray-application exe "Spotify.exe", , Hide

; Windows Explorer
; Targets copy/move operation windows
Run, komorebic.exe float-rule class "OperationStatusWindow", , Hide
Run, komorebic.exe float-rule title "Control Panel", , Hide

; Zoom
Run, komorebic.exe float-rule exe "Zoom.exe", , Hide
