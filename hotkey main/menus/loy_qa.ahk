LoyQA:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LQA:-SysMenu +Border
Gui, LQA:font, s16 bold cE8EBF5, Segoe UI
Gui, LQA:Color, 1d1f21, 383D46
Gui, LQA:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
Gui, LQA:Add, Text, x20 y20 , LOYALTY QA
;Gui, LQA:Add, Text, x306 y12 , ISSUES
Gui, LQA:font,
Gui, LQA:font, s8cE8EBF5, Segoe UI

Gui, LQA:Add, Text, x18 y62 h15 , Redemption type:
Gui, LQA:Add, Text, x18 y80 , Redemption tested and `nworking with Test Card Number: 
Gui, LQA:font, 
Gui, LQA:Add, Edit, -E0x200 x190 y60 w100 h20 vRType ,
Gui, LQA:Add, Edit, -E0x200 x190 y85 w100 h20 vRTest ,


Gui, LQA:font, s8 cE8EBF5, Segoe UI
Gui, LQA:Add, Checkbox, x18 y125 vDisE , Dispense exceptions added to UI
Gui, LQA:Add, Checkbox, x18 y145 vLoyDate , LOYV3 install date added

Gui, LQA:Add, Button, x310 y60 w100 h30 , Confirm
Gui, LQA:Add, Button, x310 y100 w100 h30 , Back
Gui, LQA:Add, Button, x310 y140 w100 h30 , Exit
Gui, LQA:Add, GroupBox, x16 y180 w394 h100, Preview
Gui, LQA:Add, Text, x30 y200 w374 h70 vPreview, 

Gui, LQA:Show, %Gui_Cord% w425 h300, %A_Space%
Gui, 2:Hide
Gui, 30:Destroy

loop
{
    Gui, LQA:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    DisE := DisE ? " Dispense exceptions added to UI " : ""
	LoyDate := LoyDate ? " LOYV3 install date added " : ""

    msgText = %Time% •• LOYALTY QA •• Redemption type: %RType% - Redemption tested and working with Test Card Number: %RTest% -%DisE%%LoyDate%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, LQA:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

LQAButtonConfirm:
Gui, LQA:Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
	Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty QA - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
reload
return

LQAButtonBack:
Gui, LQA:Destroy
gosub Q1
return

LQAButtonExit:
reload
return