#SingleInstance, Force
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
;========================= HEADER
Gui,-SysMenu +ToolWindow +Border
Gui, font, s16 bold cc5c8c6, Segoe UI
Gui, Color, 1d1f21, 383D46
Gui, Add, Text, x10 y6 , TERRYWHITE`nCHEMMART
Gui, font, s8 bold cc5c8c6, Segoe UI

;========================= SITE CODE AND STORE NAME

Gui, Add, Text, x10 y75 h20 w220 vPreviewCODE,
Gui, font, 
Gui, font, s8 cc5c8c6, Segoe UI
Gui, Add, Text, yp+25 h20 , SITE CODE:
Gui, Add, Text, yp+25 h20 , Store Name:
Gui, Add, Text, yp+25 w60 h20 , Spoke to:
Gui, Add, Text, xp+185 yp+0 h20 , *
Gui, Add, Edit, xp-80 yp-53 w100 h20 -E0x200 vSCODE,
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vStoreName,
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vSpoke,

;========================= PC DETAILS

Gui, Add, Text, xp-105 yp+40 h20 , Back Office PC details:
Gui, Add, Text, yp+25 h20 , PC Name:
Gui, Add, Edit, xp+60 yp-3 w100 h20 -E0x200 vPCName,

Gui, Add, Checkbox, xp-60 yp+28 h20 vDispSET, Disp Depts in Settings.dbf
Gui, Add, Edit, xp+160 yp+0 w50 h20 -E0x200 vDispDept,

Gui, Add, Checkbox, xp-160 yp+25 w180 h20 vSHARED, Intpharm folder shared
Gui, Add, Checkbox, x10 yp+25 h20 vRBStock , Redemption Barcode/s added in stock
Gui, Add, Checkbox, x10 yp+25 h20 vInDateEdit , Install date edited
Gui, Add, Checkbox, x10 yp+25 w190 h20 checked vTWCMROLL , #TWCMROLL
Gui, Add, Checkbox, x10 yp+25 w180 h20 checked vLOYV3 , #LOYV3

;========================= TOP TILL DETAILS

Gui, Add, Text, x255 y15 w40 h20 , POS:
Gui, Add, Text, x255 yp+25 w90 h20 , Total Tills:
Gui, Add, Text, x430 y15 w80 h20 , Loyalty Mode:
Gui, Add, Edit, x320 y12 w100 h20 -E0x200 vPOS,
Gui, Add, Edit, x320 yp+25 w100 h20 -E0x200 vTills,
Gui, Add, DropDownList, x510 y12 w100 vLoyMode, Auto|Partial|Manual

;========================= NOTES AT THE BOTTOM + BUTTONS

Gui, Add, Checkbox, x250 y280 h20 vAddition, Still to be completed:
Gui, Add, Edit, x250 yp+25 w220 h72 -E0x200 vNotes ,

Gui, Add, Button, x480 y305 w134 h30 , &Confirm
Gui, Add, Button, yp+41 w134 h30 , &Exit


;========================= TILLS


Gui, Add, Tab2, x250 y69 w365 h200 , Till 1|Till 2|Till 3|Till 4|Till 5|Till 6|Till 7|Till 8
Gui, Add, Text, x275 y139 h20 , First Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT1A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT1_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT1_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT1_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT1_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT1_LEGACYNONE, Legacy not present`n/previously disabled


Gui, Tab, Till 2
Gui, Add, Text, x275 y139 h20 , Second Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT2A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT2_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT2_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT2_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT2_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT2_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 3
Gui, Add, Text, x275 y139 h20 , Third Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT3A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT3_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT3_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT3_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT3_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT3_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 4
Gui, Add, Text, x275 y139 h20 , Fourth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT4A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT4_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT4_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT4_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT4_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT4_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 5
Gui, Add, Text, x275 y139 h20 , Fifth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT5A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT5_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT5_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT5_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT5_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT5_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 6
Gui, Add, Text, x275 y139 h20 , Sixth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT6A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT6_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT6_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT6_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT6_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT6_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 7
Gui, Add, Text, x275 y139 h20 , Seventh Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT7A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT7_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT7_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT7_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT7_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT7_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Tab, Till 8
Gui, Add, Text, x275 y139 h20 , Eighth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT8A,
Gui, Add, CheckBox, xp-100 yp+34 w160 h20 vT8_POINTS, Live points working
Gui, Add, CheckBox, yp+25 h20 vT8_SHORTCUT, Shortcuts added to desktop
Gui, Add, CheckBox, yp+25 w160 h20 vT8_LOCKSET, LOCKSET
Gui, Add, Radio, xp+180 yp-40 h20 vT8_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+25 h20 vT8_LEGACYNONE, Legacy not present`n/previously disabled

Gui, Show, x100 y100 ,%A_Space%

loop
{
    Gui, Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }
	sleep 100
}

return

ButtonConfirm:
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "ricky.white@intellipharm.com.au"
	email.Subject := "LOYALTY INSTALL COMPLETE - " SCODE
	email.Body := "LOYALTY INSTALL INFORMATION`n`nStore ID:`t`t" SCODE "`nCompleted by:`t   " Name "`n`n`n "
	email.Send

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

if (!Tills){
msgbox, 16, Warning, Please enter Total Tills, 
return
}

Gui, Submit,

DispSET 	:= DispSET ? "•• Disp Depts in Settings.dbf: " : ""
SHARED 		:= SHARED ? "•• Intpharm folder shared " : ""
RBStock 	:= RBStock ? "•• Redemption Barcode/s added in stock " : ""
InDateEdit 	:= InDateEdit ? "•• Tags1 : " : ""
TWCMROLL 	:= TWCMROLL ? "#TWCMROLL " : ""
LOYV3 		:= LOYV3 ? "#LOYV3 " : ""

Addition	:= Addition ? "•• Still to be completed: " : ""

T1_POINTS		:= T1_POINTS ? "[ TILL 1 ] Live points working " : ""
T1_SHORTCUT		:= T1_SHORTCUT ? "[ TILL 1 ] Shortcuts added to desktop " : ""
T1_LOCKSET		:= T1_LOCKSET ? "[ TILL 1 ] LOCKSET: " : ""
T1_LEGACYDIS	:= T1_LEGACYDIS ? "[ TILL 1 ] Legacy disabled by INT " : ""
T1_LEGACYNONE	:= T1_LEGACYNONE ? "[ TILL 1 ] Legacy not present`n/previously disabled " : ""

T2_POINTS		:= T2_POINTS ? "[ TILL 2 ] Live points working " : ""
T2_SHORTCUT		:= T2_SHORTCUT ? "[ TILL 2 ] Shortcuts added to desktop " : ""
T2_LOCKSET		:= T2_LOCKSET ? "[ TILL 2 ] LOCKSET: " : ""
T2_LEGACYDIS	:= T2_LEGACYDIS ? "[ TILL 2 ] Legacy disabled by INT " : ""
T2_LEGACYNONE	:= T2_LEGACYNONE ? "[ TILL 2 ] Legacy not present`n/previously disabled " : ""

T3_POINTS		:= T3_POINTS ? "[ TILL 3 ] Live points working " : ""
T3_SHORTCUT		:= T3_SHORTCUT ? "[ TILL 3 ] Shortcuts added to desktop " : ""
T3_LOCKSET		:= T3_LOCKSET ? "[ TILL 3 ] LOCKSET: " : ""
T3_LEGACYDIS	:= T3_LEGACYDIS ? "[ TILL 3 ] Legacy disabled by INT " : ""
T3_LEGACYNONE	:= T3_LEGACYNONE ? "[ TILL 3 ] Legacy not present`n/previously disabled " : ""

T4_POINTS		:= T4_POINTS ? "[ TILL 4 ] Live points working " : ""
T4_SHORTCUT		:= T4_SHORTCUT ? "[ TILL 4 ] Shortcuts added to desktop " : ""
T4_LOCKSET		:= T4_LOCKSET ? "[ TILL 4 ] LOCKSET: " : ""
T4_LEGACYDIS	:= T4_LEGACYDIS ? "[ TILL 4 ] Legacy disabled by INT " : ""
T4_LEGACYNONE	:= T4_LEGACYNONE ? "[ TILL 4 ] Legacy not present`n/previously disabled " : ""

T5_POINTS		:= T5_POINTS ? "[ TILL 5 ] Live points working " : ""
T5_SHORTCUT		:= T5_SHORTCUT ? "[ TILL 5 ] Shortcuts added to desktop " : ""
T5_LOCKSET		:= T5_LOCKSET ? "[ TILL 5 ] LOCKSET: " : ""
T5_LEGACYDIS	:= T5_LEGACYDIS ? "[ TILL 5 ] Legacy disabled by INT " : ""
T5_LEGACYNONE	:= T5_LEGACYNONE ? "[ TILL 5 ] Legacy not present`n/previously disabled " : ""

T6_POINTS		:= T6_POINTS ? "[ TILL 6 ] Live points working " : ""
T6_SHORTCUT		:= T6_SHORTCUT ? "[ TILL 6 ] Shortcuts added to desktop " : ""
T6_LOCKSET		:= T6_LOCKSET ? "[ TILL 6 ] LOCKSET: " : ""
T6_LEGACYDIS	:= T6_LEGACYDIS ? "[ TILL 6 ] Legacy disabled by INT " : ""
T6_LEGACYNONE	:= T6_LEGACYNONE ? "[ TILL 6 ] Legacy not present`n/previously disabled " : ""

T7_POINTS		:= T7_POINTS ? "[ TILL 7 ] Live points working " : ""
T7_SHORTCUT		:= T7_SHORTCUT ? "[ TILL 7 ] Shortcuts added to desktop " : ""
T7_LOCKSET		:= T7_LOCKSET ? "[ TILL 7 ] LOCKSET: " : ""
T7_LEGACYDIS	:= T7_LEGACYDIS ? "[ TILL 7 ] Legacy disabled by INT " : ""
T7_LEGACYNONE	:= T7_LEGACYNONE ? "[ TILL 7 ] Legacy not present`n/previously disabled " : ""

T8_POINTS		:= T8_POINTS ? "[ TILL 8 ] Live points working " : ""
T8_SHORTCUT		:= T8_SHORTCUT ? "[ TILL 8 ] Shortcuts added to desktop " : ""
T8_LOCKSET		:= T8_LOCKSET ? "[ TILL 8 ] LOCKSET: " : ""
T8_LEGACYDIS	:= T8_LEGACYDIS ? "[ TILL 8 ] Legacy disabled by INT " : ""
T8_LEGACYNONE	:= T8_LEGACYNONE ? "[ TILL 8 ] Legacy not present`n/previously disabled " : ""


IniWrite %Prefix%, C:\AutoHotKey\settings.ini, Loyalty, Prefix
IniWrite, %SCODE%, C:\AutoHotKey\settings.ini, Loyalty, Sitecode
IniWrite, %StoreName%, C:\AutoHotKey\settings.ini, Loyalty, StoreName


FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

FileReadLine, VersionNum, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1

IniRead Prefix, C:\AutoHotKey\settings.ini, Loyalty, Prefix
IniRead, Sitecode, C:\AutoHotKey\settings.ini, Loyalty, Sitecode
IniRead, StoreName, C:\AutoHotKey\settings.ini, Loyalty, StoreName

FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %vName% %Surname% - Loyalty Install `n, G:\Support\Public Staff Folders\Aaron\scriptlog.txt

msgText=%Time% - %CbAPIROLL% %CbLOYV3% %CbINDROLL% - Spoke to: %Spoke% - Total Tills: %Tills% - Test Card: %TestCard% - %CbTillsTested% - %CbTransition% %CbTraining% %TrainedName% - %CbDocument% - %DDUI% - %RBStock% - %CbAddition% %notes%

Clipboard = %msgText%

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%vName%\
IfEqual, Tills, 1
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 2
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 3
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 4
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 5
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 6
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 7
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 8
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

IfEqual, Tills, 1
	{
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 2
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 3
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 4
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 5
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 6
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 7
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 8
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}	

IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
return

ButtonExit:
ExitApp

F5::
Reload
return