LoyTillConfig:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LT:-SysMenu -caption -Border %OnTopSetting%
Gui, LT:Color, %BGColour%, 2b2e43
Gui, LT:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, LT:Add, Picture, x0 y120 , C:\AutoHotKey\Files\ui\back-loy-wide.png
Gui, LT:font, s16 bold cE8EBF5, Segoe UI

Gui, LT:Add, Text, x20 y12 , LOYALTY TILL CONFIG

Gui, LT:font,
Gui, LT:font, s8 cE8EBF5, Segoe UI
Gui, LT:Add, Radio, x30 y70 vIn , Incoming
Gui, LT:Add, Radio, yp+20 vOut, Outgoing


Gui, LT:font, s44 cE8EBF5, Segoe UI
Gui, LT:Add, Text, xp+90 yp-50 w20 , |

Gui, LT:font,
Gui, LT:font, s8 cE8EBF5, Segoe UI
Gui, LT:Add, Radio, xp+30 yp+22 vInstall, Install
Gui, LT:Add, Radio, yp+20 vRein , Reinstall
Gui, LT:Add, Radio, yp+20 vFix, Fix

Gui, LT:font, s44 cE8EBF5, Segoe UI
Gui, LT:Add, Text, xp+80 yp-62 w20 , |

Gui, LT:font,
Gui, LT:font, s8 cE8EBF5, Segoe UI
Gui, LT:Add, Radio, xp+30 yp+30 vLoyV2 , #LOYV2
Gui, LT:Add, Radio, checked yp+20 vLoyv3, #LOYV3


Gui, LT:font, s10 bold cE8EBF5, Segoe UI
Gui, LT:Add, Text, x18 y136 h20 w254 vPreviewCODE, 
Gui, LT:font,
Gui, LT:font, s8 cE8EBF5, Segoe UI
Gui, LT:Add, Text, yp+30 h15 , SITE CODE
Gui, LT:Add, Text, yp+30 h15 , Name of the person you spoke to
Gui, LT:Add, Text, yp+30 w180 h20, Reason for the connection
Gui, LT:Add, Text, yp+30 w180 h20, Changes made to the site
Gui, LT:Add, Text, yp+30 w180 h20, Resolution
Gui, LT:Add, Text, yp+30 w180 h20, How many Tills is this note for?
Gui, LT:Add, Edit, -E0x200 xp+182 yp-154 w80 vSCODE ,
Gui, LT:Add, Edit, -E0x200 yp+30 w80 vSpoke ,
Gui, LT:Add, Edit, -E0x200 yp+30 w80 vReason ,
Gui, LT:Add, Edit, -E0x200 yp+30 w80 vChange ,
Gui, LT:Add, Edit, -E0x200 yp+30 w80 vReso ,
Gui, LT:Add, Edit, -E0x200 yp+30 w80 vTills ,

Gui, LT:Add, Checkbox, xp+110 yp-130 vCryp , #CRYPTO
Gui, LT:Add, Checkbox, yp+20 vNewPC , #NEWPC
Gui, LT:Add, Checkbox, yp+20 vPL , #PL
Gui, LT:Add, Checkbox, yp+20 vPrint , #PRINTERS
Gui, LT:Add, Checkbox, yp+20 vRemap , #REMAP
Gui, LT:Add, Checkbox, yp+20 vUAC , #UAC
Gui, LT:Add, Checkbox, yp+20 vWin10 , #WIN10

Gui, LT:Add, Text, xp+90 yp-120, Store got CRYPTO
Gui, LT:Add, Text, yp+20, Computer replaced - reinstall required
Gui, LT:Add, Text, yp+20, Issues with Prompter, Balance Checker or Till
Gui, LT:Add, Text, yp+20, Printer issue
Gui, LT:Add, Text, yp+20, Running remap shortcut resolved the error
Gui, LT:Add, Text, yp+20, UAC permissions issue
Gui, LT:Add, Text, yp+20 BackgroundTrans, Computer upgraded to Windows 10

Gui, LT:Add, GroupBox, x18 yp+40 w498 h120, Preview
Gui, LT:Add, Text, xp+2 yp+20 w50 h98  
Gui, LT:Add, Text, xp+93 yp-12 w401 h50 
Gui, LT:Add, Text, xp-80 yp+14 w481 h96 vPreview, 


Gui, LT:Add, Button, xp+505 yp-12 w100 h30 hwndLoyConfig1, Confirm
Gui, LT:Add, Button, yp+40 w100 h30 hwndLoyConfig2, Back
Gui, LT:Add, Button, yp+40 w100 h30 hwndLoyConfig3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(LoyConfig1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyConfig2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyConfig3, Opt1, Opt2, , , Opt5)

Gui, LT:Add, Picture, x450 y48 w64 h64, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\loylogo.png

Gui, LT:Show, %Gui_Cord% h480 w660, %A_Space%
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, LT:Submit, NoHide
	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, LT:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	Install := Install ? " #INSTALL" : ""
    Rein := Rein ? " #LOYRESTALL" : ""
	Fix := Fix ? " #LOYFIX" : ""
	IN := In ? " #IN" : ""
	Out := Out ? " #OUT" : ""

	Spoke := Spoke ? " •• SPOKE TO: " Spoke " " : ""
	Reason := Reason ? " •• OUTAGE CAUSE: " Reason " " : ""
	Change := Change ? " •• CHANGES MADE: " Change " " : ""
	Reso := Reso ? " •• RESOLUTION: " Reso " " : ""

	Cryp := Cryp ? " #CRYPTO" : ""
	NewPC := NewPC ? " #NEWPC" : ""
	PL := PL ? " #PL" : ""
	Print := Print ? " #PRINTERS" : ""
	Remap := Remap ? " #REMAP" : ""
	UAC := UAC ? " #UAC" : ""
	Win10 := Win10 ? " #WIN10" : ""
	
	msgText = % Time Out IN Install Rein Fix " #TILLFIX " Spoke Reason Change Reso " •• TAGS:" Cryp NewPC PL Print Remap UAC Win10

    if NOT (msgText == oldMsgText)
    {
       GuiControl, LT:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return 

LTButtonExit:
Reload
return

LTButtonback:
Gui, LT:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

LTButtonConfirm:
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

if (!Tills){
msgbox, 16, Warning, Please enter amount of Tills completed, 
return
}

Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Till Config`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%Name%\
IfEqual, Tills, 1
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 2
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 3
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 4
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 5
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 6
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 7
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

IfEqual, Tills, 8
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
	}

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

IfEqual, Tills, 1
	{
	Points++
	Points++
	}

IfEqual, Tills, 2
	{
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
	}	

IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

reload
Return