#SingleInstance, Force
#NoEnv
SendMode Input
#Persistent	
SetBatchLines, -1
SendMode, Event
SetKeyDelay 25, 10

VersionNum = 3.5.03

IniRead, StartPOS, C:\AutoHotKey\settings.ini, Starting Position, Start

	Menu, Tray, NoStandard ; remove standard Menu items
	Menu, Tray, Tip, 🔥🔑
	Menu, Tray, Add , Force &Update, ForceUpdate 
	Menu, Tray, Add , &Hello, Hello ;add a item named Change that goes to the Change label
	Menu, Tray, Add , E&xit, ButtonExit ;add a item named Exit that goes to the ButtonExit label
	return

	ForceUpdate:
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\updater_v2.exe
	Return

	Hello:
	MsgBox ,,>, Hi there. Were you expecting something else?
	Return

IfNotExist, C:\AutoHotKey\script.exe
	{
	gosub InitialInstall
	return
	}
Return

;============================= END TRAY

^PGUP::
About:
Gui, Destroy
FileRead, ChangeLog, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\changelog.txt
Gui, 98:font, s8, Segoe UI 
Gui, 98:Color, 1d1f21, 383D46
Gui, 98:Add, Picture, x0 y0 w390 h100 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\splash.jpg
Gui, 98:font, cE8EBF5, Segoe UI
Gui, 98:Add, Edit, VScroll x1000 y1000 h100, focus
Gui, 98:Add, Edit, readonly -tabstop VScroll x-2 y150 w394 h263 , %ChangeLog%
Gui, 98:Add,Button,x70 y112 w120 h25 , Set Name
Gui, 98:Add,Button,x210 y112 w120 h25 ,Close
Gui, 98:Show, Center h410 w390, 🔥🔑 - Version %VersionNum%
return

98ButtonClose:
Reload
return

98ButtonSetName:
Gui, Destroy
    Gui, 97:Margin, 16, 16
    Gui, 97:Color, 1d1f21, 383D46, 282a2e
    Gui, 97:-SysMenu -caption +Border
    Gui, 97:Font, s11, Segoe UI
    Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , Please type your name
	Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , First Name:
    Gui, 97:Font, s10, Segoe UI
    Gui, 97:Add, Edit, xm w280 cc5c8c6 -E0x200 vName ;gFindus
	Gui, 97:Font, s11, Segoe UI
	Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , Surname:
    Gui, 97:Font, s10, Segoe UI
    Gui, 97:Add, Edit, xm w280 cc5c8c6 -E0x200 vSurname ;gFindus
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 +default, Confirm
	Gui, 97:Add, Button, xp+150 w130 cc5c8c6 -E0x200, Exit
    Gui, 97:Show,, Name
return

97ButtonExit:
reload
return

97ButtonConfirm:
Gui, Submit
IfNotExist, C:\AutoHotKey\settings.ini
	{
	FileCreateDir, C:\AutoHotKey\
	IniWrite x20 y20, C:\AutoHotKey\settings.ini, window position, gui_position		
	IniWrite x20 y760, C:\AutoHotKey\settings.ini, window position, point_position	
	IniWrite x250 y20, C:\AutoHotKey\settings.ini, window position, weekly_position
	}

IniWrite %Name%, C:\AutoHotKey\settings.ini, UserName, Name
IniWrite %Surname%, C:\AutoHotKey\settings.ini, UserName, Surname
reload
return

97ButtonBack:
Gui, 97:destroy
gosub About
return

+PGDN::reload
^PGDN::
Gui, 99:Destroy
IfNotExist, C:\AutoHotKey\settings.ini
	{
Gui, 45:Margin, 16, 16
Gui, 45:Color, 1d1f21, 383D46, 282a2e
Gui, 45:-SysMenu +Border
Gui, 45:Font, s11, Segoe UI
Gui, 45:Add, Text, cc5c8c6 xm w230 , Looks like you have not assigned your name.`n`nYou will need to set this before you can use the script. Would you like to set it now?
Gui, 45:Add, Button, xm w120 h30, Yes
Gui, 45:Add, Button, x+10 w120 h30, No
Gui, 45:Show, , Name Selection
return

45ButtonNo:
reload
return

45ButtonYes:
gui, destroy
gosub, 98ButtonSetName
return
	}

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, Surname

If Name contains Aaron,Brodie,James,Joel,Josh,Renae,Rick,Test,Craig,Guest,Steve
	{
	gosub, NamePart2
	return
	}
	else
	{
		MsgBox, 16,USER NOT PERMITTED, Please confirm your name.
		gosub 98ButtonSetName
		return
	}

NamePart2:
If Surname contains Beecham,Creaser,Schubert,Hansen,Hill,Hutchinson,White,Account,Duchesne,User,Colley
	{
	gosub, Q1
	return
	}
	else
	{
		MsgBox, 16,USER NOT PERMITTED, Please confirm your name.
		gosub 98ButtonSetName
		return
	}


Q1:
Gui, Destroy
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, Surname
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
IniRead, Point_Cord, C:\AutoHotKey\settings.ini, window position, point_position, x1 y1
IniRead, Count, C:\AutoHotKey\settings.ini, Use Count, Count

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

Count++  ; This adds 1 to your variable TimesOpened.
IniWrite, %Count%, C:\AutoHotKey\settings.ini, Use Count, Count

IfNotExist, G:\Support\
	{
		BGColour := "8A2D2D" ;:= BGColour
	}
	else BGColour := "1f2130"

If (!StartPOS)
	{
	StartPOS = Support
	IniWrite, %StartPOS%, C:\AutoHotKey\settings.ini, Starting Position, Start
	}

IniRead, StartPOS, C:\AutoHotKey\settings.ini, Starting Position, Start

Gui, 99:-SysMenu -caption -Border
Gui, 99:font,
Gui, 99:font, s12 CWhite Bold , Segoe UI

Gui, 99:Add, Button, x-500 Y-500 w118 h30 Left ,

Gui, 99:Add, Text, x0 y0 w408 h25 Center GuiMove,

AddImageTab("", "  S U P P O R T  |  L O Y A L T Y  ")

;Gui, 99:Add, Tab2, x15 y85 w420 h253 gMenuTab vWhichTab choose%StartPOS%,   Ｓ Ｕ Ｐ Ｐ Ｏ Ｒ Ｔ  |  Ｌ Ｏ Ｙ Ａ Ｌ Ｔ Ｙ  
Gui, 99:Tab, 1, 1
Gui, 99:font,
Gui, 99:font, s9 Bold, Segoe UI

Gui, 99:Add, Button, x158 y61 w10 h33 Left hwndHBT37 gSTARTSONG , 

Gui, 99:Add, Picture, x75 y60, C:\AutoHotKey\Files\mainmenu_sup.png
Gui, 99:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup.png
;Gui, 99:Add, Picture, x15 y113 , C:\AutoHotKey\Files\sup.png
Gui, 99:Add, Picture, x15 y143 , C:\AutoHotKey\Files\ui\main_buttons_sup.png
Gui, 99:Add, Button, x32 yp+20 w118 h30 Left gSupINSTALL hwndHBT1, % "   INSTALL"
Gui, 99:Add, Button, yp+40 w118 h30 Left gSupDO hwndHBT2, % "   DATA OUTAGE"
Gui, 99:Add, Button, yp+40 w118 h30 Left gSupportQAs hwndHBT3, % "   QA"
Gui, 99:Add, Button, yp+40 w118 h30 Left gSupADMIN hwndHBT4, % "   ADMIN"
;Gui, 99:Add, Button, yp+40 w118 h30 Left gSupGeneral, % "   &5 - SUB-MENU"
Gui, 99:Add, Button, yp+40 w118 h30 Left gDeclinedConnection hwndHBT5, % "   KNOCKBACK"

Gui, 99:font,
Gui, 99:font, s9 , Segoe UI

Gui, 99:Add, Button, xp+135 yp-120 w118 h30 Right gFredExcel hwndHBT6, % "Fred Excel Form   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gQAPass hwndHBT7, % "QA Pass   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gSupCancellation hwndHBT8, % "Cancellation   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gPhoneRangOut hwndHBT9, % "Phone Rang Out   "

Gui, 99:Add, Button, xp+134 yp-80 w118 h30 Right gRemoteReset hwndHBT10, % "Remote Update   "
;Gui, 99:Add, Button, yp+40 w118 h30 Right gSupSiteReset , % "Site Reset   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gSupPaths hwndHBT11, % "Paths for AV   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gSupEMAILS hwndHBT12, % "Email Templates   "

Gui, 99:Tab, 2
Gui, 99:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-loy.png
Gui, 99:Add, Picture, x75 y60, C:\AutoHotKey\Files\mainmenu_loy.png
Gui, 99:Add, Picture, x15 y143 BackgroundTrans, C:\AutoHotKey\Files\ui\main_buttons_loy.png
Gui, 99:font,
Gui, 99:font, s9 Bold , Segoe UI
Gui, 99:Add, Button, x32 yp+20 w118 h30 Left gLoyInstall hwndHBT30, % "   INSTALL"
Gui, 99:Add, Button, yp+40 w118 h30 Left gLoyTillConfig hwndHBT31, % "   TILL CONFIG"
Gui, 99:Add, Button, yp+40 w118 h30 Left gLoyQA hwndHBT32, % "   QA"
Gui, 99:Add, Button, yp+40 w118 h30 Left gLoyAdmin hwndHBT33, % "   ADMIN"
Gui, 99:Add, Button, yp+40 w118 h30 Left gQ13 hwndHBT34, % "   LOYSERV"

Gui, 99:font,
Gui, 99:font, s9 , Segoe UI
Gui, 99:Add, Button, xp+135 yp-40 w118 h30 Right gCardOrders hwndHBT35, % "Card Orders   "
Gui, 99:Add, Button, yp+40 w118 h30 Right gLoyaltyCancelation hwndHBT36, % "Loyalty Cancel   "
;Gui, 99:Add, Button, yp+40 w120 h30 Right gTWCMRoll , % "TWCM Rollout   "

FileRead, ForceUpdate, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt
do_lines_pre = 
Gui, 99:Tab 


;Gui, 99:-SysMenu +Border -MaximizeBox
Gui, 99:font, bold cE8EBF5 s24, Segoe UI
Gui, 99:Color, %BGColour%, 2b2e43
Gui, 99:font,
Gui, 99:font, s9 bold cE8EBF5, Segoe UI
Gui, 99:Add, Text, x0 y35 w450 center , Hello %Name% %Surname%

Gui, 99:Add, Button, x15 y385 w175 h30 Left gProcessCharts hwndHBT13, % "　Process Charts"
Gui, 99:Add, Button, xp yp+36 w175 h30 Left gPassGen hwndHBT14, % "　Password Generator"
Gui, 99:Add, Button, x198 y385 w115 h30 Left gMacros hwndHBT15, % "   Macros"
Gui, 99:Add, Button, x320 y385 w115 h30 Left gLogsViewer hwndHBT16, % "   View Store Logs"

Gui, 99:Add, Button, x198 y421 w115 h30 Left gWeekPoints hwndHBT17, % "   Staff Points"
Gui, 99:Add, Button, x320 y421 w115 h30 Left glogviewer hwndHBT18, % "   Staff Logs"

;Gui, 99:font, bold s10 CWhite, Segoe UI
;Gui, 99:Add, Text, x15 y470 BackGroundTrans , ＰＯＩＮＴ　ＣＯＵＮＴＥＲ
;Gui, 99:font,
Gui, 99:font, bold s7 CWhite, Segoe UI

;Gui, 99:Add, Button, x270 y490 w165 h20 gfullweeksummary hwndHBT21, FULL WEEK SUMMARY
Gui, 99:font, bold s10 CWhite, Segoe UI

FormatTime, Date,, yyyyMMdd

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points, None :(

FormatTime, Day,, dddd

If Day = Friday
    {
    fri = %a_now%
    FormatTime, fri, %fri%, yyyyMMdd

    thur = %a_now%
    thur += -1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -2, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -3, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -4, days
    FormatTime, mon, %mon%, yyyyMMdd
    }


If Day = Thursday
    {

    fri = %a_now%
    fri += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -1, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -2, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -3, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Wednesday
    {

    fri = %a_now%
    fri += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -1, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -2, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Tuesday
    {

    fri = %a_now%
    fri += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    tue = %a_now%
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -1, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Monday
    {

    fri = %a_now%
    fri += +4, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	tue = %a_now%
    tue += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    mon = %a_now%
    FormatTime, mon, %mon%, yyyyMMdd
    }

Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Data Out.txt
{
   mon_lines_pre = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
{
   tue_lines_pre = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
{
   wed_lines_pre = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
{
   thur_lines_pre = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
{
   fri_lines_pre = %A_Index%
}

do_lines_pre += mon_lines_pre
do_lines_pre += tue_lines_pre
do_lines_pre += wed_lines_pre
do_lines_pre += thur_lines_pre
do_lines_pre += fri_lines_pre

if do_lines_pre <= 1
	{
	fc = ccc0000
	}

if do_lines_pre = 2
	{
	fc = ccc0000
	}

if do_lines_pre = 3
	{
	fc = ccc3300
	}

if do_lines_pre = 4
	{
	fc = ccc3300
	}

if do_lines_pre = 5
	{
	fc = ccc6600
	}

if do_lines_pre = 6
	{
	fc = ccc6600
	}

if do_lines_pre = 7
	{
	fc = ccc9900
	}

if do_lines_pre = 8
	{
	fc = ccc9900
	}

if do_lines_pre = 9
	{
	fc = ccccc00
	}

if do_lines_pre = 10
	{
	fc = ccccc00
	}

if do_lines_pre = 11
	{
	fc = c99cc00
	}

if do_lines_pre = 12
	{
	fc = c99cc00
	}

if do_lines_pre = 13
	{
	fc = c66cc00
	}

if do_lines_pre = 14
	{
	fc = c66cc00
	}

if do_lines_pre >= 15
	{
	fc = c33cc00
	}

Gui, 99:font, bold s10 %fc%, Segoe UI
Gui, 99:Add, Text, x235 y480 BackGroundTrans , DATA OUTAGE COUNT　＝ %do_lines_pre%/15

;DATA OUT COUNTER
Gui, 99:font, bold s10 CWhite, Segoe UI
Gui, 99:Add, Text, x15 y480 w200 BackGroundTrans , RUNNING TOTAL ＝ %Points%

FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Data Out.txt
Gui, 99:Add, Button, x15 y520 w80 h20 Left hwndHBT22, %A_Space%Data Out
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %DOPoints%

;INSTALL COUNTER
FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Install.txt
Gui, 99:Add, Button, xp+85 y520 w80 h20 Left hwndHBT23, %A_Space%Install
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %INPoints%

;QA COUNTER
FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% QA.txt
Gui, 99:Add, Button, xp+85 y520 w80 h20 Left hwndHBT24, %A_Space%QA
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %QAPoints%

;LOY IN
FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Loy Install.txt
Gui, 99:Add, Button, xp+85 y520 w80 h20 Left hwndHBT25, %A_Space%Till Install
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %LoyInPoints%

;LOY CONFIGl
FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
Gui, 99:Add, Button, xp+85 y520 w80 h20 Left hwndHBT26, %A_Space%Till Config
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %CONPoints%

Gui, 99:font, bold CWhite s6, Segoe UI
Gui, 99:Add, Text, x3 y3 , %Count%

;Gui, 99:+Hwndgui_id

If % VersionNum < ForceUpdate
{
;Gui, 99:Add, Picture, x7 y712 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\update2.png
Gui, 99:font, bold cBLACK s24, Segoe UI
Gui, 99:Add, Text, BackgroundTrans x10 y662 , UPDATE AVAILABLE
Gui, 99:font, bold CWhite s24, Segoe UI
Gui, 99:Add, Text, BackgroundTrans x10 y660 , UPDATE AVAILABLE
Gui, 99:font, bold CWhite s10, Segoe UI
Gui, 99:Add, Button, x322 y670 w115 h30 gUPDATENOW hwndHBT27, UPDATE NOW
}
Else
{

	If Dog = Brodie
	{
	Gui, 99:Add, Button, x180 y670 w80 h30 gTicketCounter hwndHBT19, TICKET COUNT
	}
	If Dog = Aaron
	{
	Gui, 99:Add, Button, x180 y670 w80 h30 gTicketCounter hwndHBT20, TICKET COUNT
	}
	Gui, 99:font
	Gui, 99:font, bold s9, Segoe UI
Gui, 99:Add, Button, x270 y670 w165 h30 Left hwndHBT28, % "   Exit"
}

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

Loop, 37
{
NUM++
ImageButton.Create(HBT%NUM%, Opt1, Opt2, , , Opt5)
}

Gui, 99:font,
Gui, 99:font, s14 CWhite Bold , Segoe UI
Gui, 99:Add, Button, x408 y0 w42 h28 Left gExit hwndHBT99, %A_Space%%A_Space%✖
;============= STATUS BAR BUTTONS
Opt1 := [0, 0x1F2130    ,       , "WHITE" , , , 0x1F2130, 1]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 1]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(HBT99, Opt1, Opt2, , , Opt5)
;================================

DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 0)
Gui, 99:Show, %Gui_Cord% w450 h715 , MAIN MENU
DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 1)
return

uiMove:
PostMessage, 0xA1, 2,,, A 
Return

AddImageTab(Options, Pages, Vertical = False) {
	static HwndList := {}

	Opt1 := [3, 0x1f2130   , 0x2b2e43      ,  "WHITE" , , , 0x1f2130, 0]
	Opt2 := [ , 0x1f2130   ,       ,  "WHITE" , , , 0x1f2130, 0]
	Opt5 := [ ,            ,       , 0x0C131E]        

	Gui, 99:Add, Tab2, x15 y108 w0 h0 AltSubmit HwndHTab , % Pages ; Add an invisible Tab control
	Gui, 99:Tab

	Loop, Parse, Pages, |
	{
		_Options := (A_Index = 1) ? Options " Disabled xp" : (Vertical ? "y+0" : "x+0")
		Gui, 99:Add, Button, %_Options% HwndHBT g___AddImageTab_ChangeTab, % A_LoopField
			ImageButton.Create(HBT, Opt1, Opt2, Opt3, Opt4)

		HwndList[HBT]                   := {TabIndex: A_Index, TabHwnd: HTab}
		HwndList["HTab", HTab, A_Index] := HBT
	}

	Return

	___AddImageTab_ChangeTab:
		GuiControlGet, focused_control, Focus
		GuiControlGet, focused_controlHwnd, Hwnd, %focused_control%
		TabIndex := HwndList[focused_controlHwnd+0]["TabIndex"]
		TabHwnd  := HwndList[focused_controlHwnd+0]["TabHwnd"]

		GuiControl, Choose, %TabHwnd%, |%TabIndex%
		
		For i, hwnd in HwndList["HTab"][TabHwnd]
			GuiControl, % (i = TabIndex) ? "Disable" : "Enable", %hwnd%
	Return
}

Exit:
Reload
Return

/*
MenuTab:
if (WhichTab != "Pages1")
	{
	IniRead, page, C:\AutoHotKey\settings.ini, Starting Position, Start
	if (page != "1")
		{
		IniWrite, 1, C:\AutoHotKey\settings.ini, Starting Position, Start
		}
	if (page != "2")
		{
		IniWrite, 2, C:\AutoHotKey\settings.ini, Starting Position, Start
		}
	}
	return
	*/

99ButtonDataOut:
FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Data Out.txt
clipboard = %DOPoints%
return

99ButtonInstall:
FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Install.txt
clipboard = %INPoints%
return

99ButtonQA:
FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% QA.txt
clipboard = %QAPoints%
return

99ButtonTillInstall:
FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Loy Install.txt
clipboard = %LoyInPoints%
return

99ButtonTillConfig:
FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
clipboard = %CONPoints%
return

99GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
reload
return

99ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

UPDATENOW:
run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\updater_v2.exe
ExitApp

;=====================================================SUB MENUS

#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\initial_install.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\data_outage.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\install.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\qa_complete.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\qa_pass.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\admin.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\knockback.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\fred_confirmation.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\cancelation.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\phone_rang_out.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\remote_update.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\paths.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\charts.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\email_templates.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\macros.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\logs_viewer.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\pass_gen.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\staff_points.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\ticket_count.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\full_week_summary.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loy_till_config.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loy_qa.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loy_admin.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loyserv.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\card_orders.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\hotkey main\menus\loy_cancel.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\loyalty\Loyalty Install.ahk

#Include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\test files\Sources\Class_ImageButton.ahk

/*
TWCMRoll:
If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}
run, C:\AutoHotKey\Files\Loyalty TWCM.exe
reload
return
*/

logviewer:
If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}
run C:\AutoHotKey\Files\Staff Logs.exe
reload
return

;======= CLOSE GUIS

			GuiClose:
			WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
			IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
			reload
			return

			Close:
			Gui, Destroy
			return

;======= CLOSE GUIS

^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return

ButtonExit:
ExitApp

	;============================================================================== SITE CODE BUTTONS

	MONDO:
	FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Data Out.txt
	clipboard = %DOPoints%
	return

	MONIN:
	FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Install.txt
	clipboard = %INPoints%
	return

	MONQA:
	FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% QA.txt
	clipboard = %QAPoints%
	return

	MONTIN:
	FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Loy Install.txt
	clipboard = %LoyInPoints%
	return

	MONTC:
	FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Till Config.txt
	clipboard = %CONPoints%
	return

	TUEDO:
	FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
	clipboard = %DOPoints%
	return

	TUEIN:
	FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Install.txt
	clipboard = %INPoints%
	return

	TUEQA:
	FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% QA.txt
	clipboard = %QAPoints%
	return

	TUETIN:
	FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Loy Install.txt
	clipboard = %LoyInPoints%
	return

	TUETC:
	FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Till Config.txt
	clipboard = %CONPoints%
	return

	WEDDO:
	FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
	clipboard = %DOPoints%
	return

	WEDIN:
	FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Install.txt
	clipboard = %INPoints%
	return

	WEDQA:
	FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% QA.txt
	clipboard = %QAPoints%
	return

	WEDTIN:
	FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Loy Install.txt
	clipboard = %LoyInPoints%
	return

	WEDTC:
	FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Till Config.txt
	clipboard = %CONPoints%
	return

	THURDO:
	FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
	clipboard = %DOPoints%
	return

	THURIN:
	FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Install.txt
	clipboard = %INPoints%
	return

	THURQA:
	FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% QA.txt
	clipboard = %QAPoints%
	return

	THURTIN:
	FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Loy Install.txt
	clipboard = %LoyInPoints%
	return

	THURTC:
	FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Till Config.txt
	clipboard = %CONPoints%
	return

	FRIDO:
	FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
	clipboard = %DOPoints%
	return

	FRIIN:
	FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Install.txt
	clipboard = %INPoints%
	return

	FRIQA:
	FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% QA.txt
	clipboard = %QAPoints%
	return

	FRITIN:
	FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Loy Install.txt
	clipboard = %LoyInPoints%
	return

	FRITC:
	FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Till Config.txt
	clipboard = %CONPoints%
	return

	;============================================================================== SITE CODE BUTTONS

:R*?:]d::
FormatTime, Date,, dd/MM/yyyy
SendInput %Date%
return

:R*?:]t::
FormatTime, Time,, h:mmtt
SendInput %Time%
return

:R*?:]1::
IniRead, vSMacro1, C:\AutoHotKey\settings.ini, MACROLIST, MACRO1
SendInput % vSMacro1
return

:R*?:]2::
IniRead, vSMacro2, C:\AutoHotKey\settings.ini, MACROLIST, MACRO2
SendInput % vSMacro2
return

:R*?:]3::
IniRead, vSMacro3, C:\AutoHotKey\settings.ini, MACROLIST, MACRO3
SendInput % vSMacro3
return

:R*?:]4::
IniRead, vSMacro4, C:\AutoHotKey\settings.ini, MACROLIST, MACRO4
SendInput % vSMacro4
return

:R*?:]5::
IniRead, vSMacro5, C:\AutoHotKey\settings.ini, MACROLIST, MACRO5
SendInput % vSMacro5
return

:R*?:]6::
IniRead, vSMacro6, C:\AutoHotKey\settings.ini, MACROLIST, MACRO6
SendInput % vSMacro6
return

:R*?:]7::
IniRead, vSMacro7, C:\AutoHotKey\settings.ini, MACROLIST, MACRO7
SendInput % vSMacro7
return

:R*?:]8::
IniRead, vSMacro8, C:\AutoHotKey\settings.ini, MACROLIST, MACRO8
SendInput % vSMacro8
return

:R*?:]9::
IniRead, vSMacro9, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
SendInput,{RAW}%vSMacro9%
return

:R*?:]0::
IniRead, vSMacro0, C:\AutoHotKey\settings.ini, MACROLIST, MACRO0
SendInput % vSMacro0
return

!Left::Media_Prev

!Right::Media_Next

!UP::Media_Play_Pause

STARTSONG:
SoundPlay, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\Adobe Universal Patcher Music.mp3
SysGet, Mon, MonitorCount

Loop{
Num++

if (Mon = 1)
	{
	Random, CORDx , 0, 1920
	Random, CORDy , 0, 1080
	}

if (Mon = 2)
	{
	Random, CORDx , -1920, 1920
	Random, CORDy , 0, 1080
	}

Gui, SCRT%Num%:-SysMenu -caption +Border
Gui, SCRT%Num%:Add, Picture, x0 y0, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\hotkey_sharp.png
Gui, SCRT%Num%:Show, x%CORDx% y%CORDy% h128 w128
sleep 20
}
return