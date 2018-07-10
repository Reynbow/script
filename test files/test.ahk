#SingleInstance Force

FileList =
Loop, M:\*.mp3
    FileList = %FileList%%A_LoopFileName%`n
Sort, FileList, U
MsgBox % FileList
Clipboard := FileList
GoSub, Gui2
Return

Gui2:
Gui,1:+Disabled
Gui,2:+Owner
Name2=GUI-2
Gui,2:Font,, FixedSys
Gui,2:Add,Edit, x10  y10 h500 w800 vE2,
Gui,2:Show, x295 y20 h520 w820, %name2%
StringReplace, clipboard, clipboard, .mp3, .mp3`r`n, All 
Sleep, 100
Send, ^v
Return