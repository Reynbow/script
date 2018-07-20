﻿CardOrders:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

list1 = 500|1000|2000|5000
Gui, 30:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, 30:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-loy-ext.png
Gui, 30:Color, %BGColour%, 2b2e43 
Gui, 30:-SysMenu -caption -Border %OnTopSetting%
Gui, 30:font, s12 bold cE8EBF5, Segoe UI
Gui, 30:Add, Text, Center x0 y160 w210 h50, CARD ORDERS
Gui, 30:font,
Gui, 30:font, s8 cE8EBF5, Segoe UI
Gui, 30:Add, Text, x30 yp+50 w180 h50, Was the proof approved by the client?
Gui, 30:Add, Radio, x54 yp+45 vRadio1, YES
Gui, 30:Add, Radio, x114 yp+0 vRadio2, NO
Gui, 30:Add, Text,
Gui, 30:Add, Text, x30 yp+50 h15, How many cards for the order?
Gui, 30:Add, Radio, x55 yp+30 v500, 500
Gui, 30:Add, Radio, x55 yp+20 v1000, 1000
Gui, 30:Add, Radio, x55 yp+20 v2000, 2000
Gui, 30:Add, Radio, x55 yp+20 v5000, 5000
;Gui, 30:Add, DropDownList, x30 w150 vChoiceCO, %list1%

Gui, 30:Add, Button, x12 y625 w184 h30 hwndCard1, Confirm
Gui, 30:Add, Button, x12 y670 w184 h30 hwndCard2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(Card1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Card2, Opt1, Opt2, , , Opt5)

Gui, 30:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%
Return

30ButtonConfirm:
Gui, Submit, NoHide

If(Radio1=1)
	GuiControlGet, Radio_1,, Radio1, Text
If(Radio2=1)
	GuiControlGet, Radio_2,, Radio2, Text
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Card Order - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
Clipboard =%Time% - #CARDORDER - %500%%1000%%2000%%5000% x card order sent - Proof approved by client: %Radio_1%%Radio_2%
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

reload
Return

30ButtonClose:
Gui, 30:Destroy
Return