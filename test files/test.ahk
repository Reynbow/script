#Persistent
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