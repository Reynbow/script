PhoneRangOut:
list1 = Voicemail|Rang out|Failed to establish call
list2 = #INSTALL|#DATAOUT

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 67:-SysMenu +Border

Gui, 67:Add, Picture, x-181 y342 , C:\AutoHotKey\Files\back-right.png

Gui, 67:Color, 1d1f21, 383D46
Gui, 67:font, s12 bold cE8EBF5, Segoe UI
Gui, 67:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
Gui, 67:Add, Text, center x0 y24 w210, PHONE`nRANG OUT
Gui, 67:font,
Gui, 67:font, cE8EBF5, Segoe UI
Gui, 67:Add, Text, x12 yp+120 h30, Call result
Gui, 67:Add, DropDownList, yp+20 w184 vChoice1, %list1%
Gui, 67:Add, Text, yp+50 , Why did you call
Gui, 67:Add, DropDownList, yp+20 w184 vChoice2, %list2%
Gui, 67:Add, Text, yp+50 w210 , Notes
Gui, 67:Add, Edit, -E0x200 yp+20 w184 h50 -VScroll vBox1,

Gui, 67:Add, Button, x12 y635 w184 h30 , &Confirm
Gui, 67:Add, Button, x12 y680 w184 h30 , &Close

Gui, 67:Show, x%gui_x% y%gui_y% w210 h725, %A_Space%
return

67ButtonClose:
	Gui, 67:Destroy
return

67ButtonConfirm:
	Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - %Choice2% #OUT - %Choice1% - %Box1% #PRO
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Phone rang out`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
	reload
return