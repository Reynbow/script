QAPass:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, QAP:-SysMenu -caption -Border %OnTopSetting%

Gui, QAP:Color, %BGColour%, 2b2e43

Gui, QAP:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png

Gui, QAP:font, s12 bold cE8EBF5, Segoe UI
Gui, QAP:Add, Text, Center x0 y24 w210, QA PASS
Gui, QAP:font,
Gui, QAP:font, cE8EBF5, Segeo UI
Gui, QAP:Add, Text, x12 yp+100 h20 w254 vPreviewCODE, 
Gui, QAP:Add, Text, yp+30 h30, SITE CODE:
Gui, QAP:Add, Edit, -E0x200 xp+80 yp-3 w104 vSCODE,
Gui, QAP:Add, CheckBox, xp-80 yp+33 h20 vrepkam, Checked Rep/Kam
Gui, QAP:Add, Text, yp+30 w220 , Additional Notes:
Gui, QAP:Add, Edit, -E0x200 yp+30 w184 h50 -VScroll vNote,

Gui, QAP:Add, GroupBox, yp+100 w184 h110, Preview
Gui, QAP:Add, Text, xp+2 yp+20 w20 h88, 
Gui, QAP:Add, Text, xp+8 yp+0 w172 h88 vPreview, 

Gui, QAP:Add, Button, x12 y625 w184 h30 hwndQAP1, Confirm
Gui, QAP:Add, Button, x12 y670 w184 h30 hwndQAP2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(QAP1, Opt1, Opt2, , , Opt5)
ImageButton.Create(QAP2, Opt1, Opt2, , , Opt5)

Gui, QAP:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

loop
{
    Gui, QAP:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, QAP:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	repkam := repkam ? " Rep/Kam CONFIRMED. " : ""

	msgText = % Time " #QACOMP - QA passed already for previous client, account details sent to store. " repkam Note

    ;msgText = %Time% - %Cb_22_Text%%Cb_1_Text%%Cb_2_Text%%Cb_3_Text% #OUT - SPOKE TO: %Box1GF% - OUTAGE WAS CAUSED BY: %Box2GF% - CHANGES MADE: %Box3GF% - RESOLUTION: %Box4GF% - HELP ICON: %Choice2GF% - AV EXCEPTIONS ADDED: %Choice1GF% - TAGS: %Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text%%Cb_8_Text%%Cb_9_Text%%Cb_10_Text%%Cb_11_Text%%Cb_12_Text%%Cb_13_Text%%Cb_14_Text%%Cb_15_Text%%Cb_16_Text%%Cb_17_Text%%Cb_18_Text%%Cb_19_Text%%Cb_20_Text%%Cb_21_Text%%Cb_23_Text%%Cb_24_Text%%Cb_25_Text%%Cb_26_Text%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, QAP:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

QAPButtonClose:
	Gui, QAP:Destroy
return

QAPButtonConfirm:
Gui, Submit, NoHide

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM

	Radio_1 := Radio1 ? "#DATAOUT" : ""
	Radio_2 := Radio2 ? "#INSTALL" : ""

Clipboard = % msgText
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - QA PASS`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% QA.txt

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
Points++
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

Reload
return