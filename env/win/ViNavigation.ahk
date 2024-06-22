
; ahk-vim-navigation.ahk
; Written by Jongbin Jung
;
; Incorporated some script from Model_Vim.ahk
; Written by Rich Alesi
; and Modified for AHK_L by Andrej Mitrovic
; (http://www.autohotkey.com/board/topic/41206-modal-vim/)
; 
; Update (08/16/2014)
; Simplified script to take modifiers into account
; (see, http://www.autohotkey.com/board/topic/83755
; -using-an-arbitrary-key-as-a-modifier-without-sacrificing-it/)

; REMOVED: #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Global variables
inputNumber := " "
global oGui90

; Notification GUI {{{
notify(text, time := 2000)
{
    if WinExist("VIM-Mode commands") {
        resetGUI()
    }
    ; Set the flags for OSD
    global oGui90 := Gui()
    oGui90.Opt("+AlwaysOnTop -Caption +ToolWindow +Disabled -SysMenu +Owner")
    ; Add and set the OSD Text
    oGui90.SetFont("s10 bold")
    oGui90.Add("Text", "cAA0000", text)
    ; OSD Background Color (Black)
    oGui90.BackColor := "000000"
    oGui90.Title := "VIM-Mode commands"
    oGui90.Show("NoActivate xCenter yCenter")
    Sleep(time)
    oGui90.Destroy()
    return
} ;}}}

; HotKey to Initiate VI-mode with Double-tap of Esc {{{
CapsLock::
        ; Set the flags for OSD
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
        oGui99 := Gui()
        oGui99.Opt("+AlwaysOnTop -Caption +ToolWindow +Disabled -SysMenu +Owner")
        ; Add and set the OSD Text
        oGui99.SetFont("s15 bold")
        oGui99.Add("Text", "cAA0000", "VI-Mode Activated (Esc to Exit)")
        ; OSD Background Color (Black)
        oGui99.BackColor := "000000"
        oGui99.Title := "VIM-Mode Activated"
        oGui99.Show("NoActivate x0 y10")
	HotIfWinExist "VIM-Mode Activated"
	Return ; }}}
} ; V1toV2: Added bracket in the end

#HotIf WinExist("VIM-Mode Activated") ; {{{

    ; ESC ends VIM-mode
    CapsLock:: 
    {
        if (inputNumber != " ")
        {
            resetInputNumber()
            return
        }
        else
        {
            endVIM()
            return
        }
    }

    ; i(nput) end VIM-mode
    i::
    {
        endVIM()
        return
    }

    ; Other input modes ...
    +i:: 
    {
        SendInput("{Home}")
        endVIM()
        return
    }
    a::
    {
        SendInput("{Right}")
        endVIM()
        return
    }
    +a::
    {
        SendInput("{End}")
        endVIM()
        return
    }

    ; cursor movements
    h:: 
    {
        SendInput("{Left" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    j:: 
    {
        SendInput("{Down" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    k:: 
    {
        SendInput("{Up" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    l:: 
    {
        SendInput("{Right" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }

    ; page movements
    w:: 
    {
        SendInput("^{Right" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    b:: 
    {
        SendInput("^{Left" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    x:: 
    {
        SendInput("{Delete" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    0:: ; Add to the inputNumber if inputNumber != null, otherwise HOME
    {
    	global inputNumber
        if (inputNumber != " ")
        {
            inputNumber := inputNumber . "0"
            normalize(0)
            notify(inputNumber)
            return
        }
        else
        {
            SendInput("{Home}")
            resetInputNumber()
            return
        }
    }
    -:: 
    {
        SendInput("{End}")
        resetInputNumber()
        return
    }
    $:: 
    {
        SendInput("{End}")
        resetInputNumber()
        return
    }

    ; selection movements with Shift
    +h:: 
    {
        SendInput("+{Left" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +j:: 
    {
        SendInput("+{Down" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +k:: 
    {
        SendInput("+{Up" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +l::
    {
        SendInput("+{Right" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +w:: 
    {
        SendInput("+^{Right" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +b:: 
    {
        SendInput("+^{Left" . RTrim(inputNumber) . "}")
        resetInputNumber()
        return
    }
    +x:: 
    {
        SendInput("+{Delete}")
        resetInputNumber()
        return
    }
    ):: 
    {
        SendInput("+{Home}")
        resetInputNumber()
        return
    }
    _:: 
    {
        SendInput("+{End}")
        resetInputNumber()
        return
    }

    ; Copy (Yank) / Cut (Delete) / Paste (Put)
    y:: 
    {
        SendInput("^c")
        resetInputNumber()
        return
    }
    p:: 
    {
        SendInput("^v")
        resetInputNumber()
        return
    }
    d:: 
    {
        SendInput("^x")
        resetInputNumber()
        return
    }

    ; Search with /
    /::
    {
        SendInput("^f")
        resetInputNumber()
        return
    }

    ; HotKey to VIM maps
    u:: 
    {
        SendInput("^z")
        resetInputNumber()
        return
    }

    ; Catch numbers to repeat commands
    $1::
    {
       global inputNumber := inputNumber . "1"
       normalize(1)
       notify(inputNumber)
       return
    }

    $2::
    {
       global inputNumber := inputNumber . "2"
       normalize(2)
       notify(inputNumber)
       return
    }

    $3::
    {
       global inputNumber := inputNumber . "3"
       normalize(3)
       notify(inputNumber)
       return
    }

    $4::
    {
       global inputNumber := inputNumber . "4"
       normalize(4)
       notify(inputNumber)
       return
    }

    $5::
    {
       global inputNumber := inputNumber . "5"
       normalize(5)
       notify(inputNumber)
       return
    }

    $6::
    {
       global inputNumber := inputNumber . "6"
       normalize(6)
       notify(inputNumber)
       return
    }

    $7::
    {
       global inputNumber := inputNumber . "7"
       normalize(7)
       notify(inputNumber)
       return
    }

    $8::
    {
       global inputNumber := inputNumber . "8"
       normalize(8)
       notify(inputNumber)
       return
    }

    $9::
    {
       global inputNumber := inputNumber . "9"
       normalize(9)
       notify(inputNumber)
       return
    }
        
#HotIf


; Validate the inputNumber and make sure that it's less than 500 {{{
normalize(resetNumber)
{
    global inputNumber
    if (inputNumber > 500)
    {
        inputNumber := resetNumber
    }
} ;}}}

; Reset the inputNumber to " "
resetInputNumber()
{              
   global
   resetGUI()
   inputNumber := " "
   return
}

resetGUI()
{
    global oGui90
    if isSet(oGui90) {
        oGui90.Destroy()
    }
    return
}
endVIM()
{
    oGui99.Destroy()
    resetInputNumber()
    return
}

