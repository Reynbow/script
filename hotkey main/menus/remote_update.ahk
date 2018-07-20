RemoteReset:
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, RR:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, RR:-SysMenu -caption -Border %OnTopSetting%
Gui, RR:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png
Gui, RR:Color, %BGColour%, 2b2e43
Gui, RR:font, s14 bold cE8EBF5, Segoe UI
Gui, RR:Add, Text, Center x0 y24 w210, REMOTE`nUPDATE
Gui, RR:font,
Gui, RR:font, cE8EBF5, Segeo UI
Gui, RR:Add, Text, x12 yp+80 h40 w150 vPreviewCODE, 
Gui, RR:Add, Text, yp+60 h30, SITE CODE:
Gui, RR:Add, Edit, -E0x200 xp+70 yp-3 w114 h20 vSCODE,
Gui, RR:Add, DropDownList, xp-70 yp+33 w185 vrepkam, POSX RESET|DISPX RESET|CRON UPDATE|POSX FILE|DISPX FILE|SEND ANY FILE|GET ANY FILE
Gui, RR:Add, Text, yp+50 w220 , Additional Notes:
Gui, RR:Add, Edit, -E0x200 yp+20 w184 h50 -VScroll vNote,

Gui, RR:Add, GroupBox, yp+70 w184 h110, Preview
Gui, RR:Add, Text, xp+2 yp+20 w20 h88 , 
Gui, RR:Add, Text, xp+8 yp+0 w172 h88 vPreview, 

Gui, RR:Add, Button, x12 y625 w184 h30 hwndRR1, Confirm
Gui, RR:Add, Button, x12 y670 w184 h30 hwndRR2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(RR1, Opt1, Opt2, , , Opt5)
ImageButton.Create(RR2, Opt1, Opt2, , , Opt5)

Gui, RR:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

loop
{
    Gui, RR:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, RR:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	Note := Note ? " •• " Note "" : ""

	msgText = % Time " •• REMOTE Send Update Complete: " repkam Note

    if NOT (msgText == oldMsgText)
    {
       GuiControl, RR:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return


RRButtonClose:
	Gui, RR:Destroy
return

RRButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - REMOTE UPDATE`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

Reload
return