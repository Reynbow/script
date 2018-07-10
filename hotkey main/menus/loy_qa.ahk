LoyQA:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LQA:-SysMenu -caption -Border %OnTopSetting%
Gui, LQA:Color, %BGColour%, 2b2e43
Gui, LQA:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, LQA:Add, Picture, x0 y0 , C:\AutoHotKey\Files\ui\back-loy.png
Gui, LQA:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
;Gui, LQA:Add, Text, x306 y12 , ISSUES
Gui, LQA:font,
Gui, LQA:font, s16 cE8EBF5 Bold, Segoe UI

Gui, LQA:Add, Text, x20 y20 , LOYALTY QA

Gui, LQA:font,
Gui, LQA:font, s8 cE8EBF5, Segoe UI

Gui, LQA:Add, Text, x18 y62 h15 , Redemption type:
Gui, LQA:Add, Text, x18 y80 , Redemption tested and `nworking with Test Card Number: 
Gui, LQA:Add, Edit, -E0x200 x190 y60 w100 h20 vRType ,
Gui, LQA:Add, Edit, -E0x200 x190 y85 w100 h20 vRTest ,


Gui, LQA:font, s8 cE8EBF5, Segoe UI
Gui, LQA:Add, Checkbox, x18 y125 vDisE , Dispense exceptions added to UI
Gui, LQA:Add, Checkbox, x18 y145 vLoyDate , LOYV3 install date added

Gui, LQA:Add, Button, x310 y60 w100 h30 hwndLQA1, Confirm
Gui, LQA:Add, Button, x310 y100 w100 h30 hwndLQA2, Back
Gui, LQA:Add, Button, x310 y140 w100 h30 hwndLQA3, Exit
Gui, LQA:Add, GroupBox, x16 y180 w394 h100, Preview
Gui, LQA:Add, Text, x18 y210 w20 h68, 
Gui, LQA:Add, Text, x208 y188 w200 h50, 
Gui, LQA:Add, Text, x30 y200 w378 h78 vPreview, 

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(LQA1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LQA2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LQA3, Opt1, Opt2, , , Opt5)

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