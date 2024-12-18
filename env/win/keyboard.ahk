#Requires AutoHotkey v2.0

; Swap § for `
;::§::
;{
;}
;::``::
;{
    ;Send "§"
;}
;
;` Up::
;{ 
    ;Send "``"
;}
;§ Up::
;{ 
    ;Send "``"
;}

SC056::Send "``"
SC029::Send "§"
;`::Send "§"
;``::Send "§"
;` Up::Send "``"
;SC056 Up::Send "§"
