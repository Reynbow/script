<<<<<<< HEAD
﻿#SingleInstance Force

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
=======
﻿#Persistent
#SingleInstance Force
#NoEnv

|::
CoordMode, Mouse, Screen
MouseGetPos, xpos, ypos 
Gui, Color, 1d1f21, 383D46, 282a2e
Gui, -SysMenu -caption +Border +AlwaysOnTop
Gui, Font, s12, Segoe UI
Gui, Add, Text, x10 y10 w20 cc5c8c6 -E0x200 , √(
Gui, Add, Edit, x30 y12 w40 h22 cc5c8c6 -E0x200 vFirst, 
Gui, Add, Text, x75 y10 w50 cc5c8c6 -E0x200 , &&
Gui, Add, Edit, x95 y12 w40 h22 cc5c8c6 -E0x200 vSecond, 
Gui, Add, Text, x140 y10 w50 cc5c8c6 -E0x200 , )
Gui, Font, s9, Segoe UI
Gui, Add, Button, x160 y12 h22 w26 cc5c8c6 -E0x200 gOK , OK
Gui, Show, X%xpos% Y%ypos% w196
Return

OK:
Gui, Submit
SendInput, √(%First%
Send, {Tab}
SendInput, %Second%
Send, {Tab}
Send, )%A_Space%
Return

Esc::Reload
+ESC::ExitApp
>>>>>>> 2715912b55a7449c2ac64f44d4f3393aa5ad8d0b
