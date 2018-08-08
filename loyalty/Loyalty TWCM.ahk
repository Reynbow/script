#SingleInstance, Force
#NoEnv
#KeyHistory 0
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetWinDelay, -1

FileRead, codelist, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\codelist.txt
IniRead, UserName, C:\AutoHotKey\settings.ini, UserName, name

;========================= HEADER
Gui,-SysMenu +ToolWindow +Border
Gui, font, s16 bold cc5c8c6, Segoe UI
Gui, Color, 1d1f21, 383D46
Gui, Add, Text, x10 y6 , TERRYWHITE`nCHEMMART
Gui, font, s8 bold cc5c8c6, Segoe UI

;========================= SITE CODE AND STORE NAME

Gui, Add, Text, x10 y90 h20 w220 vPreviewCODE,
Gui, font, 
Gui, font, s8 cc5c8c6, Segoe UI
Gui, Add, Text, yp+25 h20 , SITE CODE:
Gui, Add, Text, yp+25 w60 h20 , Spoke to:
Gui, Add, Edit, xp+75 yp-25 w100 h20 -E0x200 vSCODE,
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vSpoke,

;========================= PC DETAILS

Gui, Add, Text, xp-75 yp+40 h20 , Back Office PC details:
Gui, Add, Text, yp+25 h20 , PC Name:
Gui, Add, Edit, xp+60 yp-3 w100 h20 -E0x200 vPCName,

Gui, Add, Checkbox, xp-60 yp+28 h20 vDispSET, Disp Depts in Settings.dbf
Gui, Add, Edit, xp+160 yp+0 w50 h20 -E0x200 vDispDept,

Gui, Add, Checkbox, xp-160 yp+25 w180 h20 vSHARED, Intpharm folder shared
Gui, Add, Checkbox, x10 yp+25 h20 vRBStock , Redemption Barcode/s added in stock
Gui, Add, Checkbox, x10 yp+25 h20 vInDateEdit , Install date edited

Gui, Add, Checkbox, x10 yp+25 w190 h20 checked vTWCMROLL , #TWCMROLL
Gui, Add, Checkbox, x10 yp+25 w180 h20 checked vLOYV3 , #LOYV3

Gui, Add, Radio, xp+40 yp+40 h20 vT1_LEGACYDIS, Legacy disabled by INT
Gui, Add, Radio, yp+30 h20 vT1_LEGACYNONE, Legacy not present`n/ previously disabled

;========================= TOP TILL DETAILS

Gui, Add, Text, x255 y15 w40 h20 , POS:
Gui, Add, Text, x255 yp+25 w90 h20 , Total Tills:
;Gui, Add, Text, x430 y15 w80 h20 , Loyalty Mode:
Gui, Add, Edit, x320 y12 w130 h20 -E0x200 vPOS,
Gui, Add, Edit, x320 yp+25 w130 h20 -E0x200 vTills,
;Gui, Add, DropDownList, x510 y12 w100 vLoyMode, Auto|Partial|Manual

;========================= NOTES AT THE BOTTOM + BUTTONS

Gui, Add, Checkbox, x250 y280 h20 vAddition, Still to be completed:
Gui, Add, Edit, x250 yp+25 w220 h72 -E0x200 vNotes ,

Gui, Add, Button, x250 y390 w220 h30 , &Confirm
Gui, Add, Button, yp+41 w220 h30 , &Exit


;========================= TILLS


Gui, Add, Tab2, x250 y69 w220 h200 , Till 1|Till 2|Till 3|Till 4|Till 5|Till 6|Till 7|Till 8
Gui, Add, Text, x270 y130 h20 , First Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName1,
Gui, Add, CheckBox, yp+40 w160 h20 vT1_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT1_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 2
Gui, Add, Text, x270 y130 h20 , Second Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName2,
Gui, Add, CheckBox, yp+40 w160 h20 vT2_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT2_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 3
Gui, Add, Text, x270 y130 h20 , Third Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName3,
Gui, Add, CheckBox, yp+40 w160 h20 vT3_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT3_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 4
Gui, Add, Text, x270 y130 h20 , Fourth Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName4,
Gui, Add, CheckBox, yp+40 w160 h20 vT4_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT4_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 5
Gui, Add, Text, x270 y130 h20 , Fifth Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName5,
Gui, Add, CheckBox, yp+40 w160 h20 vT5_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT5_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 6
Gui, Add, Text, x270 y130 h20 , Sixth Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName6,
Gui, Add, CheckBox, yp+40 w160 h20 vT6_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT6_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 7
Gui, Add, Text, x270 y130 h20 , Seventh Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName7,
Gui, Add, CheckBox, yp+40 w160 h20 vT7_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT7_SHORTCUT, Shortcuts added to desktop

Gui, Tab, Till 8
Gui, Add, Text, x270 y130 h20 , Eighth Till Name:
Gui, Add, Edit, yp+20 w100 h20 -E0x200 vTillName8,
Gui, Add, CheckBox, yp+40 w160 h20 vT8_POINTS, Live points working
Gui, Add, CheckBox, yp+30 h20 vT8_SHORTCUT, Shortcuts added to desktop


IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Show, %Gui_Cord% w480 ,%A_Space%

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

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

if (!Tills){
msgbox, 16, Warning, Please enter Total Tills, 
return
}

Gui, Submit,

DispSET 	:= DispSET ? "DONE" : ""
SHARED 		:= SHARED ? "DONE" : ""
RBStock 	:= RBStock ? "DONE" : ""
InDateEdit 	:= InDateEdit ? "DONE" : ""
TWCMROLL 	:= TWCMROLL ? "#TWCMROLL" : ""
LOYV3 		:= LOYV3 ? "#LOYV3" : ""

T1_LEGACYDIS	:= T1_LEGACYDIS ? "Legacy disabled by INT`n" : ""
T1_LEGACYNONE	:= T1_LEGACYNONE ? "Legacy not present/previously disabled`n" : ""

Addition	:= Addition ? "=== === === ===`nExtra Notes / Still to be completed:`n" Notes "`n=== === === ===" : ""

T1_POINTS		:= T1_POINTS ? "Live points working`n" : ""
T1_SHORTCUT		:= T1_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T2_POINTS		:= T2_POINTS ? "Live points working`n" : ""
T2_SHORTCUT		:= T2_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T3_POINTS		:= T3_POINTS ? "Live points working`n" : ""
T3_SHORTCUT		:= T3_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T4_POINTS		:= T4_POINTS ? "Live points working`n" : ""
T4_SHORTCUT		:= T4_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T5_POINTS		:= T5_POINTS ? "Live points working`n" : ""
T5_SHORTCUT		:= T5_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T6_POINTS		:= T6_POINTS ? "Live points working`n" : ""
T6_SHORTCUT		:= T6_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T7_POINTS		:= T7_POINTS ? "Live points working`n" : ""
T7_SHORTCUT		:= T7_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T8_POINTS		:= T8_POINTS ? "Live points working`n" : ""
T8_SHORTCUT		:= T8_SHORTCUT ? "Shortcuts added to desktop`n" : ""

T1_POINTScom	:= T1_POINTS ? TillName1 " " : ""
T2_POINTScom	:= T2_POINTS ? TillName2 " " : ""
T3_POINTScom	:= T3_POINTS ? TillName3 " " : ""
T4_POINTScom	:= T4_POINTS ? TillName4 " " : ""
T5_POINTScom	:= T5_POINTS ? TillName5 " " : ""
T6_POINTScom	:= T6_POINTS ? TillName6 " " : ""
T7_POINTScom	:= T7_POINTS ? TillName7 " " : ""
T8_POINTScom	:= T8_POINTS ? TillName8 " " : ""


FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

FileReadLine, VersionNum, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1

FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - TWCM Loyalty Install `n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

FormatTime, Date,, yyyy MM dd

FileCreateDir, G:\Support\Public Staff Folders\Renae\TWCM\%Date%\
FileAppend, 
(
SUPPORT STAFF:`t`t`t%UserName%

SITE CODE:`t`t`t%SCODE%
Store Name:`t`t`t%codeText%
Spoke to:`t`t`t`t%spoke%
Back office PC Name:`t`t%PCName%

Intellipharm folder shared:`t`t%SHARED%
Disp Depts in settings.dbf:`t`t%DispSET%`t%DispDept%
Redemption barcode added to stock:`t%RBStock%
Install date edited:`t`t`t%InDateEdit%

POS:`t`t`t`t%POS%
Total Tills:`t`t`t%Tills%

%Addition%


=== Till 1 ===
Till Name:`t`t%TillName1%
%T1_POINTS%%T1_SHORTCUT%%T1_LEGACYDIS%%T1_LEGACYNONE%

=== Till 2 ===
Till Name:`t`t%TillName2%
%T2_POINTS%%T2_SHORTCUT%%T2_LEGACYDIS%%T2_LEGACYNONE%

=== Till 3 ===
Till Name:`t`t%TillName3%
%T3_POINTS%%T3_SHORTCUT%%T3_LEGACYDIS%%T3_LEGACYNONE%

=== Till 4 ===
Till Name:`t`t%TillName4%
%T4_POINTS%%T4_SHORTCUT%%T4_LEGACYDIS%%T4_LEGACYNONE%

=== Till 5 ===
Till Name:`t`t%TillName5%
%T5_POINTS%%T5_SHORTCUT%%T5_LEGACYDIS%%T5_LEGACYNONE%

=== Till 6 ===
Till Name:`t`t%TillName6%
%T6_POINTS%%T6_SHORTCUT%%T6_LEGACYDIS%%T6_LEGACYNONE%

=== Till 7 ===
Till Name:`t`t%TillName7%
%T7_POINTS%%T7_SHORTCUT%%T7_LEGACYDIS%%T7_LEGACYNONE%

=== Till 8 ===
Till Name:`t`t%TillName8%
%T8_POINTS%%T8_SHORTCUT%%T8_LEGACYDIS%%T8_LEGACYNONE%






), G:\Support\Public Staff Folders\Renae\TWCM\%Date%\%SCODE% %codeText%.txt

msgText = % Time " - " TWCMROLl " " LOYV3 " - Spoke to: " Spoke " •• DISP [" DispSET "] •• FOLDER SHARE [ " SHARED " ] •• BARCODE ADDED [ " RBStock " ] •• INSTALL DATE [ " InDateEdit " ] •• Test and Live Points working: [ " T1_POINTScom T2_POINTScom T3_POINTScom T4_POINTScom T5_POINTScom T6_POINTScom T7_POINTScom T8_POINTScom "] •• To be completed: " Notes

Clipboard = %msgText%

;WRITE THE MACRO
FormatTime, Date,, yyyyMMdd
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

;POINTS CALC - ADDING SITE CODES
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