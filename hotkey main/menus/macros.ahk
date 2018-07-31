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

Gui, 98:-SysMenu -caption -Border %OnTopSetting%
Gui, 98:Add, Text, x0 y0 w652 h25 Center GuiMove,
Gui, 98:Color, %BGColour%, 2b2e43
Gui, 98:font, s24 bold cE8EBF5, Segoe UI

Gui, 98:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup.png

Gui, 98:Add, Text, x15 y15 w450, MACROS

Gui, 98:Font,
Gui, 98:Font, s11 cc5c8c6 , Segoe UI
Gui, 98:Add, Text, yp+50 w400,  This window enables you to type any length of text in the fields next to a numbered Macro. Once saved, you can then type ]# to output the information you have saved.

Gui, 98:Add, Text, x15 y156 h20 , ] 0
Gui, 98:Add, Text, yp+45 h20 , ] 1
Gui, 98:Add, Text, yp+45 h20 , ] 2
Gui, 98:Add, Text, yp+45 h20 , ] 3
Gui, 98:Add, Text, yp+45 h20 , ] 4
Gui, 98:Add, Text, yp+45 h20 , ] 5
Gui, 98:Add, Text, yp+45 h20 , ] 6
Gui, 98:Add, Text, yp+45 h20 , ] 7
Gui, 98:Add, Text, yp+45 h20 , ] 8
Gui, 98:Add, Text, yp+45 h20 , ] 9

Gui, 98:Font, s8 cc5c8c6, Segoe UI
Gui, 98:Add, Edit, x45 y150 w390 h37 -E0x200 vCTRL0, %vMacro0%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL1, %vMacro1%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL2, %vMacro2%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL3, %vMacro3%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL4, %vMacro4%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL5, %vMacro5%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL6, %vMacro6%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL7, %vMacro7%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL8, %vMacro8%
Gui, 98:Add, Edit, yp+45 w390 h37 -E0x200 vCTRL9, %vMacro9%

Gui, 98:Font, S8 cc5c8c6, Segoe UI
Gui, 98:Add, Text, x8 y620 h50 w188 
Gui, 98:Add, Text, x12 yp+4 w180 , For key functions, like entering a new line, type {ENTER}. To see more key shortcuts
Gui, 98:Font, S8 CAqua Underline
Gui, 98:Add, Text, xp+72 yp+26 BackgroundTrans GLINK , check here.

Gui, 98:Font, 
Gui, 98:Font, bold 
Gui, 98:Add, Button, x206 y620 w230 h35 hwndMac1, Save
Gui, 98:Font, 

;Gui, 98:Add, Button, x175 y701 w104 h30, Back
Gui, 98:Add, Button, x206 yp+45 w230 h35 hwndMac2, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(Mac1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Mac2, Opt1, Opt2, , , Opt5)


Gui, 98:Show, %Gui_Cord% w450 h715,
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