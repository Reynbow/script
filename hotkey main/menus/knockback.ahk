DeclinedConnection:
list1 = #DATAOUT|#INSTALL

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, 21:-SysMenu -caption -Border %OnTopSetting%
Gui, 21:Add, Text, x0 y0 w652 h25 Center GuiMove,
Gui, 21:Color, %BGColour%, 2b2e43
Gui, 21:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png
Gui, 21:font, s12 bold cE8EBF5, Segoe UI
Gui, 21:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 21:Add, Text, Center x0 y24 w210, KNOCKBACK
Gui, 21:font,
Gui, 21:font, cE8EBF5, Segeo UI
Gui, 21:Add, Text, x28 y82 h30, Reason `nfor the call:
Gui, 21:Add, Radio, x100 y73 h20 vRadio1, Data Outage
Gui, 21:Add, Radio, x100 y98 h20 vRadio2, Installation
Gui, 21:Add, Text, x12 y144 h30, Spoke to:
Gui, 21:Add, Text, x12 y174 h30, SITE CODE:
Gui, 21:Add, Edit, -E0x200 x78 y140 w122 vSpoke,
Gui, 21:Add, Edit, -E0x200 x118 y170 w82 vSCODE,
Gui, 21:Add, Text, x12 y200 w220 , What was the reason for being declined?
Gui, 21:Add, Edit, -E0x200 x12 y225 w186 h50 -VScroll vBox2KB,

Gui, 21:Add, GroupBox, yp+100 w184 h110, Preview
Gui, 21:Add, Text, xp+2 yp+20 w20 h88, 
Gui, 21:Add, Text, xp+8 yp+0 w172 h88 vPreview, 

;Gui, 21:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 21:Add, Button, x12 y625 w184 h30 hwndknock1, Confirm
Gui, 21:Add, Button, x12 y670 w184 h30 hwndknock2 , Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(knock1, Opt1, Opt2, , , Opt5)
ImageButton.Create(knock2, Opt1, Opt2, , , Opt5)

Gui, 21:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

loop
{
    Gui, 21:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 21:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	Radio1 := Radio1 ? " Data Outage " : ""
	Radio2 := Radio2 ? " Installation " : ""

	Spoke := Spoke ? " •• SPOKE TO: " Spoke : ""
	Box2KB := Box2KB ? " •• ADDITIONALLY: " Box2KB : ""

	msgText = % Time " - #OUT" Radio1 Radio2 Spoke " - #KNOCKBACK" Box2KB

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 21:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

21ButtonClose:
	Gui, 21:Destroy
return

21ButtonConfirm:
Gui, Submit, NoHide

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM

	Radio_1 := Radio1 ? "#DATAOUT" : ""
	Radio_2 := Radio2 ? "#INSTALL" : ""

Clipboard = % msgText
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Knockback`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
Reload
return