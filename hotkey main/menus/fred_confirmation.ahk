﻿FredConf:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

list1FC = Yes|No
;Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 25:-SysMenu -caption -Border %OnTopSetting%
Gui, 25:font, cE8EBF5

Gui, 25:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png

Gui, 25:Color, %BGColour%, 2b2e43
Gui, 25:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,

Gui, 25:font, s12 bold cE8EBF5, Segoe UI
Gui, 25:Add, Text, center x0 y24 w210 , FRED CONFIRMATION

Gui, 25:font, 
Gui, 25:font, cE8EBF5, Segoe UI
Gui, 25:Add, Text, x12 yp+50 h30, Who did you speak to?
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox1FC
Gui, 25:Add, Text, yp+40 w170 , Confirmed they are using STOPS?
Gui, 25:Add, DropDownList, yp+20 w184 vChoice1FC, %list1FC%

Gui, 25:font, 
Gui, 25:font, s12 bold cE8EBF5, Segoe UI
Gui, 25:Add, Text, center x0 yp+40 w210 , Required Names
Gui, 25:font, 
Gui, 25:font, cE8EBF5, Segoe UI

Gui, 25:Add, Text, x12 yp+40 , First point of contact:
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox2FC

Gui, 25:Add, Text, yp+40 , Second point of contact:
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox3FC

Gui, 25:Add, GroupBox, yp+40 h140 w184 , Preview
Gui, 25:Add, Text, xp+2 yp+20 h118 w20 , 
Gui, 25:Add, Text, xp+8 h118 w172 vFredConPre, 

;Gui, 25:Add, Picture, x56 y510 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 25:Add, Button, x12 y625 w184 h30 hwndFredC1, Confirm
Gui, 25:Add, Button, x12 y670 w184 h30 hwndFredC2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(FredC1, Opt1, Opt2, , , Opt5)
ImageButton.Create(FredC2, Opt1, Opt2, , , Opt5)

Gui, 25:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

loop
{
    Gui, 25:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    msgText = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box1FC% (confirmed using STOPS - %Choice1FC%) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box2FC% 2. %Box3FC%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 25:Text, FredConPre, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

25ButtonConfirm:
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
	Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box1FC% (confirmed using STOPS - %Choice1FC%) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box2FC% 2. %Box3FC%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Fred Confirmation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
return

25ButtonClose:
	Gui, 25:Destroy
return