Macros:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
IniRead, vMacro0, C:\AutoHotKey\settings.ini, MACROLIST, MACRO0
IniRead, vMacro1, C:\AutoHotKey\settings.ini, MACROLIST, MACRO1
IniRead, vMacro2, C:\AutoHotKey\settings.ini, MACROLIST, MACRO2
IniRead, vMacro3, C:\AutoHotKey\settings.ini, MACROLIST, MACRO3
IniRead, vMacro4, C:\AutoHotKey\settings.ini, MACROLIST, MACRO4
IniRead, vMacro5, C:\AutoHotKey\settings.ini, MACROLIST, MACRO5
IniRead, vMacro6, C:\AutoHotKey\settings.ini, MACROLIST, MACRO6
IniRead, vMacro7, C:\AutoHotKey\settings.ini, MACROLIST, MACRO7
IniRead, vMacro8, C:\AutoHotKey\settings.ini, MACROLIST, MACRO8
IniRead, vMacro9, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

Gui, 98:-SysMenu +Border
Gui, 98:Margin, 16, 16
Gui, 98:Color, 1d1f21, 383D46

Gui, 98:Font, s11 cc5c8c6 , Segoe UI
Gui, 98:Add, Text, x15 y15 h20 , ] 0
Gui, 98:Add, Text, yp+40 h20 , ] 1
Gui, 98:Add, Text, yp+40 h20 , ] 2
Gui, 98:Add, Text, yp+40 h20 , ] 3
Gui, 98:Add, Text, yp+40 h20 , ] 4
Gui, 98:Add, Text, yp+40 h20 , ] 5
Gui, 98:Add, Text, yp+40 h20 , ] 6
Gui, 98:Add, Text, yp+40 h20 , ] 7
Gui, 98:Add, Text, yp+40 h20 , ] 8
Gui, 98:Add, Text, yp+40 h20 , ] 9

Gui, 98:Font, s8 cc5c8c6, Segoe UI
Gui, 98:Add, Edit, x45 y10 w340 h32 -E0x200 vCTRL0, %vMacro0%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL1, %vMacro1%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL2, %vMacro2%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL3, %vMacro3%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL4, %vMacro4%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL5, %vMacro5%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL6, %vMacro6%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL7, %vMacro7%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL8, %vMacro8%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL9, %vMacro9%

Gui, 98:Font, S8 cc5c8c6, Segoe UI
Gui, 98:Add, Text, x12 y414 w160, For key functions, like entering a new line, type {ENTER}. To see more key shortcuts
Gui, 98:Font, S8 CAqua Underline
Gui, 98:Add, Text, yp+40 GLINK , check here.

Gui, 98:Font, 
Gui, 98:Font, bold
Gui, 98:Add, Button, x175 y410 w210 h30 , Save
Gui, 98:Font, 

Gui, 98:Add, Button, x175 y441 w104 h30, Back
Gui, 98:Add, Button, x281 y441 w104 h30 , Exit

Gui, 98:Show, w400 h480,%A_Space%
hCurs:=DllCall("LoadCursor","UInt",NULL,"Int",32649,"UInt") ;IDC_HAND
OnMessage(0x200,"WM_MOUSEMOVE")
return

WM_MOUSEMOVE(wParam,lParam)
{
Global hCurs
MouseGetPos,,,,ctrl
;Only change over certain controls, use Windows Spy to find them.
If ctrl in Static12.
DllCall("SetCursor","UInt",hCurs)
Return
}

LINK:
Run,https://autohotkey.com/docs/KeyList.htm
Return

98ButtonBack:
Gui, 98:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
Return

98ButtonSave:
Gui Submit
IniWrite %CTRL0%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO0
IniWrite %CTRL1%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO1
IniWrite %CTRL2%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO2
IniWrite %CTRL3%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO3
IniWrite %CTRL4%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO4
IniWrite %CTRL5%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO5
IniWrite %CTRL6%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO6
IniWrite %CTRL7%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO7
IniWrite %CTRL8%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO8
GoSub Macros
return

98ButtonExit:
Reload
return