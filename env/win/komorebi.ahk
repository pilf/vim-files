#SingleInstance Force

; Change the focused window, Alt + Vim direction keys
!h::
{
	RunWait "komorebic.exe focus left", ,"Hide"
}

!j::
{
	RunWait "komorebic.exe focus down", , "Hide"
}

!k::
{
	RunWait "komorebic.exe focus up", , "Hide"
}

!l::
{
	RunWait "komorebic.exe focus right", , "Hide"
}

; Move the focused window in a given direction, Alt + Shift + Vim direction keys
!+h::
{
	RunWait "komorebic.exe move left", , "Hide"
}

!+j::
{
	RunWait "komorebic.exe move down", , "Hide"
}

!+k::
{
	RunWait "komorebic.exe move up", , "Hide"
}

!+l::
{
	RunWait "komorebic.exe move right", , "Hide"
}

; Stack the focused window in a given direction, Alt + Shift + direction keys
!+Left::
{
	RunWait "komorebic.exe stack left", , "Hide"
}

!+Down::
{
	RunWait "komorebic.exe stack down", , "Hide"
}

!+Up::
{
	RunWait "komorebic.exe stack up", , "Hide"
}

!+Right::
{
	RunWait "komorebic.exe stack right", , "Hide"
}

!]::
{
	RunWait "komorebic.exe cycle-stack next", , "Hide"
}

![::
{
	RunWait "komorebic.exe cycle-stack previous", , "Hide"
}

; Unstack the focused window, Alt + Shift + D
!+d::
{
	RunWait "komorebic.exe unstack", , "Hide"
}

; Promote the focused window to the top of the tree, Alt + Shift + Enter
!+Enter::
{
	RunWait "komorebic.exe promote", , "Hide"
}

; Switch to an equal-width, max-height column layout on the main workspace, Alt + Shift + C
!+c::
{
	RunWait "komorebic.exe workspace-layout 0 0 columns", , "Hide"
}

; Switch to the default bsp tiling layout on the main workspace, Alt + Shift + T
!+t::
{
	RunWait "komorebic.exe workspace-layout 0 0 bsp", , "Hide"
}

; Toggle the Monocle layout for the focused window, Alt + Shift + F
!+f::
{
	RunWait "komorebic.exe toggle-monocle", , "Hide"
}

; Toggle native maximize for the focused window, Alt + Shift + =
!+=::
{
	RunWait "komorebic.exe toggle-maximize", , "Hide"
}

; Flip horizontally, Alt + X
!x::
{
	RunWait "komorebic.exe flip-layout horizontal", , "Hide"
}

; Flip vertically, Alt + Y
!y::
{
	RunWait "komorebic.exe flip-layout vertical", , "Hide"
}

; Force a retile if things get janky, Alt + Shift + R
!+r::
{
	RunWait "komorebic.exe retile", , "Hide"
}

; Float the focused window, Alt + F
!f::
{
	RunWait "komorebic.exe toggle-float", , "Hide"
}

; Reload ~/komorebi.ahk, Alt + Shift + O
!+o::
{
	RunWait "komorebic.exe reload-configuration", , "Hide"
}

; Pause responding to any window events or komorebic commands, Alt + P
;!p::
;RunWait "komorebic.exe toggle-pause", , "Hide"
;return

; Switch to workspace
!1::
{
	RunWait "komorebic.exe focus-workspace 0", , "Hide"
}

!2::
{
	RunWait "komorebic.exe focus-workspace 1", , "Hide"
}

!3::
{
	RunWait "komorebic.exe focus-workspace 2", , "Hide"
}

!4::
{
	RunWait "komorebic.exe focus-workspace 3", , "Hide"
}

!5::
{
	RunWait "komorebic.exe focus-workspace 4", , "Hide"
}

!6::
{
	RunWait "komorebic.exe focus-workspace 5", , "Hide"
}

!7::
{
	RunWait "komorebic.exe focus-workspace 6", , "Hide"
}

!8::
{
	RunWait "komorebic.exe focus-workspace 7", , "Hide"
}

!9::
{
	RunWait "komorebic.exe focus-workspace 8", , "Hide"
}

!0::
{
	RunWait "komorebic.exe focus-workspace 9", , "Hide"
}

; Move window to workspace
!+1::
{
	RunWait "komorebic.exe move-to-workspace 0", , "Hide"
}

!+2::
{
	RunWait "komorebic.exe move-to-workspace 1", , "Hide"
}

!+3::
{
	RunWait "komorebic.exe move-to-workspace 2", , "Hide"
}

!+4::
{
	RunWait "komorebic.exe move-to-workspace 3", , "Hide"
}

!+5::
{
	RunWait "komorebic.exe move-to-workspace 4", , "Hide"
}

!+6::
{
	RunWait "komorebic.exe move-to-workspace 5", , "Hide"
}

!+7::
{
	RunWait "komorebic.exe move-to-workspace 6", , "Hide"
}

!+8::
{
	RunWait "komorebic.exe move-to-workspace 7", , "Hide"
}

!+9::
{
	RunWait "komorebic.exe move-to-workspace 8", , "Hide"
}

!+0::
{
	RunWait "komorebic.exe move-to-workspace 9", , "Hide"
}

!e::
{
	RunWait "komorebic.exe focus-monitor 0", , "Hide"
}

!+e::
{
	RunWait "komorebic.exe move-to-monitor 0", , "Hide"
}

!w::
{
	RunWait "komorebic.exe focus-monitor 1", , "Hide"
}

!+w::
{
	RunWait "komorebic.exe move-to-monitor 1", , "Hide"
}

!m::
{
	RunWait "komorebic.exe manage", , "Hide"
}



