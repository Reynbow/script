Q13:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 55:Add, Picture, x-181 y342 , C:\AutoHotKey\Files\back-right.png

Gui, 55:font, bold cE8EBF5 s12, Segoe UI
Gui, 55:Color, 1d1f21, 383D46
Gui, 55:Add, Text, x0 y32 w210 h50 Center, LOYSERV CREATOR
Gui, 55:font,
Gui, 55:Add, Button, x30 y80 w150 h30 gchemmart, &1 TerryWhiteChemmart
Gui, 55:Add, Button, x30 y120 w150 h30 gchempro , &2 Chempro
Gui, 55:Add, Button, x30 y160 w150 h30 gpharmacy, &3 Pharmacy
Gui, 55:Add, Button, x30 y200 w150 h30 grestore, &4 Restore Rewards
Gui, 55:Add, Button, x30 y240 w150 h30 gsoulpat, &5 Soul Pattinson
Gui, 55:Add, Button, x30 y280 w150 h30 gpharmadvice, &6 Pharmacist Advice
Gui, 55:Add, Button, x30 y320 w150 h30 gramsay, &7 Ramsay
;Gui, 55:Add, Button, x30 y360 w150 h30 , &8 Independant

Gui, 55:font, bold 
Gui, 55:Add, Button, x30 y420 w150 h30 , RESET TEMPLATES
Gui, 55:font,
;Gui, 55:Add, Button, x30 y460 w70 h30 , &Back

Gui, 55:Add, Button, x12 y680 w184 h30 , &Close

Gui, 55:Show, x%gui_x% y%gui_y% w210 h725, %A_Space%

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