Q13:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, 55:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-loy-ext.png
Gui, 55:-SysMenu -caption -Border %OnTopSetting%
Gui, 55:font, bold cE8EBF5 s12, Segoe UI
Gui, 55:Color, %BGColour%, 2b2e43
Gui, 55:Add, Text, x0 y55 w210 h50 Center, LOYSERV CREATOR
Gui, 55:font,
Gui, 55:Add, Button, x30 y146 w150 h30 Left gchemmart hwndLS1, % "   Terry White Chemmart"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left gchempro hwndLS2, % "   Chempro"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left gpharmacy hwndLS3, % "   Pharmacy"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left grestore hwndLS4, % "   Restore Rewards"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left gsoulpat hwndLS5, % "   Soul Pattinson"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left gpharmadvice hwndLS6, % "   Pharmacist Advice"
Gui, 55:Add, Button, x30 yp+40 w150 h30 Left gramsay hwndLS7, % "   Ramsay"
;Gui, 55:Add, Button, x30 y360 w150 h30 , &8 Independant

Gui, 55:font, bold 
Gui, 55:Add, Button, x30 yp+80 w150 h30 hwndLS8, RESET TEMPLATES
Gui, 55:font,
;Gui, 55:Add, Button, x30 y460 w70 h30 , &Back

Gui, 55:Add, Button, x12 y670 w184 h30 hwndLS9, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(LS1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS3, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS4, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS5, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS6, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS7, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS8, Opt1, Opt2, , , Opt5)
ImageButton.Create(LS9, Opt1, Opt2, , , Opt5)

Gui, 55:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

Return

55ButtonBack:
Gui, 55:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

55ButtonClose:
Gui, 55:Destroy
return

55ButtonRESETTEMPLATES:
Gui, Submit
FileRemoveDir, C:\AutoHotKey\Files\LOYSERV\, 1
FileCopyDir, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\, C:\AutoHotKey\Files\LOYSERV\
msgbox, 0, Reset Templates, Loyserv Templates have been reset to default,
gosub, Q13
return

#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\chemmart.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\chempro.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\pharmacy.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\restore.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\soulpat.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\pharmadvice.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyservs\ramsay.ahk