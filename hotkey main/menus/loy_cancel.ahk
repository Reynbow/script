LoyaltyCancelation:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, 77:-SysMenu -caption -Border %OnTopSetting%
Gui, 77:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-loy-ext.png
Gui, 77:Color, %BGColour%, 2b2e43
Gui, 77:font, s12 bold cE8EBF5, Segoe UI
Gui, 77:Add, Text, Center x0 y19 w210 , LOYALTY`nCANCELATION
Gui, 77:font,
Gui, 77:Add, Radio, cE8EBF5 x32 y68 w67 h20 vRadio1, #LOYV3
Gui, 77:Add, Radio, cE8EBF5 x122 y68 w70 h20 vRadio2, #LOYV2
Gui, 77:font, s8 bold cE8EBF5, Segoe UI
Gui, 77:Add, Text, x12 y99 w184 h30 , Please confirm you have completed the below steps.
Gui, 77:font,
Gui, 77:Add, CheckBox, cE8EBF5 x12 y139 w220 h20 vCb_1, Cancelled Clients in Site IQ.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y159 w230 h20 vCb_2, Email attached to Loy client.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y179 w230 h20 vCb_8, Changed client to Intellipharm Test.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y199 w220 h20 vCb_3, Deactivated store.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y219 w220 h20 vCb_4, Changed password.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y239 w220 h20 vCb_5, Member transfer script run.%A_Space%
Gui, 77:Add, CheckBox, cE8EBF5 x12 y269 h20 vCb_6, API EDM sent%A_Space%
Gui, 77:font, s7 bold cE8EBF5, Segoe UI
Gui, 77:Add, Text, x100 y274 w70 h20 , date:
Gui, 77:font,
Gui, 77:Add, Edit, cE8EBF5 -E0x200 x126 y269 w70 h20 vBox1 , 
Gui, 77:Add, CheckBox, cE8EBF5 x12 y299 h20 vCb_7, API DB sent%A_Space%
Gui, 77:font, s7 bold cE8EBF5, Segoe UI
Gui, 77:Add, Text, x100 y304 w70 h20, date:
Gui, 77:font,
Gui, 77:Add, Edit, cE8EBF5 -E0x200 x126 y299 w70 h20 vBox2 , 
Gui, 77:Add, Text, cE8EBF5 x12 y339 w184 h20 , Additional Notes
Gui, 77:Add, Edit, cE8EBF5 -E0x200 x12 y359 w184 h75 -VScroll vBox3 , 

Gui, 77:Add, Button, x12 y625 w184 h30 hwndLoyC1 , Confirm
Gui, 77:Add, Button, x12 y670 w184 h30 hwndLoyC2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(LoyC1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Loyc2, Opt1, Opt2, , , Opt5)

Gui, 77:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%
return


77ButtonClose:
Gui, 77:Destroy
return

77ButtonExit:
Reload
return

77ButtonConfirm:
Gui, Submit, NoHide

If(Radio1=1)
 GuiControlGet, Radio_1,, Radio1, Text
If(Radio2=1)
 GuiControlGet, Radio_2,, Radio2, Text
If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, Cb_3_Text,, Cb_3, Text
If(Cb_4=1)
 GuiControlGet, Cb_4_Text,, Cb_4, Text
If(Cb_5=1)
 GuiControlGet, Cb_5_Text,, Cb_5, Text
If(Cb_6=1)
 GuiControlGet, Cb_6_Text,, Cb_6, Text
If(Cb_7=1)
 GuiControlGet, Cb_7_Text,, Cb_7, Text
 If(Cb_8=1)
 GuiControlGet, Cb_8_Text,, Cb_8, Text
 
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - #CANCEL for %Radio_1%%Radio_2% - Have completed following: %Cb_1_Text%%Cb_2_Text%%Cb_8_Text%%Cb_3_Text%%Cb_4_Text%%Cb_5_Text%- %Cb_6_Text%%Box1% %Cb_7_Text%%Box2% %Box3%

	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Cancelation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
Return