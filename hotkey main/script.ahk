;=====================================================VERSION AND MODIFIERS

; Will force the script to only be able to run once, opening again will just refresh the script
#SingleInstance, Force

; Avoids checking empty variables to see if they are environment variables.
; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv

; Recommended for new scripts due to its superior speed and reliability.
SendMode Input

; Keeps script permanently running
#Persistent	

; Determines how fast a script will run (affects CPU utilization).
; The value -1 means the script will run at it's max speed possible.
SetBatchLines, -1

; sets the key send input type. Event is used to make use of KeyDelay.
SendMode, Event

; Sets delay between key strokes and how long a key should be pressed.
; SetKeyDelay KeyStrokeDelay, 
SetKeyDelay 25, 10

; Used below just for updating purposes - If you want to update this script you need to change this number to the new version. Also the GUI below is tittled with the version number
VersionNum = 3.41.1

IniRead, StartPOS, C:\AutoHotKey\settings.ini, Starting Position, Start

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

IfNotExist, C:\AutoHotKey\script.exe
	{
	gosub InitialInstall
	return
	}

Menu, Tray, NoStandard ; remove standard Menu items
Menu, Tray, Tip, 🔥🔑
Menu, Tray, Add , &Feedback, Feedback ;add a item named Change that goes to the Change label
Menu, Tray, Add 
Menu, Tray, Add , Force &Update, ForceUpdate 
Menu, Tray, Add , &Info, Info ;add a item named Change that goes to the Change label
Menu, Tray, Add , &Hello, Hello ;add a item named Change that goes to the Change label
Menu, Tray, Add , E&xit, ButtonExit ;add a item named Exit that goes to the ButtonExit label
Return

;=====================================================INSTALLER
; This is for checking if there is a copy of the script.exe file installed to the C drive.
; Use C drive so that it's uniform across all computers
; Use root directory for simplicity sake and to keep it local so if network goes down it can still be used


;Gui, ;-sysmenu

InitialInstall:
Gui, Add, Picture, x0 y0 w164 h314 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\installer.png
Gui, Font, S14 cE8EBF5, Verdana
Gui, Color, 1d1f21, 383D46
Gui, Add, Text, x178 y9 w260 h70 , Welcome to 🔥🔑 Setup
Gui, Font, 
Gui, Font, cE8EBF5 ;S8 CDefault, Verdana
Gui, Add, Text, x178 y89 w310 h170 , The script will now be installed to the C:\AutoHotKey directory.`n`nA shortcut will also be placed on the Desktop.`n`nPlease note! To use the script, after installation is complete, run the script and press CTRL+PGDN.`n`nClick Next to start the installation.
Gui, Add, Button, x382 y275 w100 h26 , Cancel
Gui, Add, Button, x262 y275 w100 h26 , Next
Gui, Show, h314, 🔥🔑
return

	ButtonNext:
	gosub page2

	ButtonCancel:
	ExitApp

return

page2:
Gui, Destroy
Gui, 54:Add, Picture, x0 y0 w164 h314 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\installer.png
;Gui, 54:font, cE8EBF5, Segoe UI
Gui, 54:Color, 1d1f21, 383D46
Gui, 54:Font, S14 cE8EBF5, Segoe UI
Gui, 54:Add, Text, x178 y9 w260 h70 , The 🔥🔑 setup
Gui, 54:Font,
Gui, 54:Font, cE8EBF5, Segoe UI
global WM_USER               := 0x00000400
global PBM_SETMARQUEE        := WM_USER + 10
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
Gui, 54:Add, Text, x179 y109 w310 h170 , Please ensure that when the installation is complete you set your name in the settings menu (Press CTRL+Page Up). Thanks :D
Gui, 54:Add, Text, x179 y229 w310 h170 , Installing now, please wait
Gui, 54:Add, Progress, x178 y249 w300 h20 hwndMARQ4 -%PBS_SMOOTH% +%PBS_MARQUEE%, 50
DllCall("User32.dll\SendMessage", "Ptr", MARQ4, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)

Gui, 54:Add, Button, x378 y275 w100 h26 , Cancel
Gui, 54:Show, h314,🔥🔑 Setup


FileCreateDir, C:\AutoHotKey\Files\
sleep 2000
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, C:\AutoHotKey\version.txt,1
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\script.exe, C:\AutoHotKey\script.exe,1
FileCopy, G:\Support\Public Staff Folders\Aaron\tools\LoyaltyInstall.exe, C:\AutoHotKey\Files\LoyaltyInstall.exe,1
FileCopy, G:\Support\Public Staff Folders\Aaron\tools\QAComplete.exe, C:\AutoHotKey\Files\QAComplete.exe,1
FileCreateShortcut, C:\AutoHotKey\script.exe, %A_Desktop%\Script.lnk
sleep 2000
Gui, Destroy
MsgBox,64,Installation Complete,The Installation is now complete!`nRemember, to activate the script you can press CTRL+PGDN for the main screen, otherwise CTRL+PGUP for information and setup.
reload
return

54ButtonCancel:
FileRemoveDir, C:\Autohotkey, 1
ExitApp


^F9::
WindowNameConfirm:
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
MsgBox, 0, Name Confirmation, The name you have set is %Name% %Surname%
return

50ButtonExit:
Reload
return

;========================= Menu and Tray

Menu, Tray, NoStandard ; remove standard Menu items
Menu, Tray, Tip, The Gentleman's Script
Menu, Tray, Add , &Feedback, Feedback ;add a item named Change that goes to the Change label
Menu, Tray, Add 
Menu, Tray, Add , Force &Update, ForceUpdate 
Menu, Tray, Add , &Info, Info ;add a item named Change that goes to the Change label
Menu, Tray, Add , &Hello, Hello ;add a item named Change that goes to the Change label
Menu, Tray, Add , E&xit, ButtonExit ;add a item named Exit that goes to the ButtonExit label
Return

ForceUpdate:
Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\updater_v2.exe
Return

Hello:
MsgBox ,,>, Hi there. Were you expecting something else?
Return

Info:
gosub About
Return

Jump:
gosub Feedback
return

Feedback:
Gui, Destroy

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 88:font, s12 bold cE8EBF5, Segoe UI
Gui, 88:Color, 1d1f21, 383D46
Gui, 88:Add, Text, x20 y20 w403 , 🔥🔑`nFEEDBACK FORM
Gui, 88:font,
Gui, 88:font, cE8EBF5,
Gui, 88:Add, Text, x20 y80 h20 , Bug with the script: 
Gui, 88:font,
Gui, 88:Add, Edit, x20 y100 w220 h60 vBug,
Gui, 88:font, cE8EBF5,
Gui, 88:Add, Text, x20 y180 h20 , Suggested change/update: 
Gui, 88:font,
Gui, 88:Add, Edit, x20 y200 w220 h60 vUpdate,
Gui, 88:font, cE8EBF5,
Gui, 88:Add, Button, x20 y290 w100 h30 , Submit
Gui, 88:Add, Button, x140 y290 w100 h30 , Exit

Gui, 88:Show, %Gui_Cord% h350 w260, Feedback Form
Return


88ButtonSubmit:
Gui, Submit

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 89:font, s12 bold cE8EBF5, Segoe UI
Gui, 89:Color, 1d1f21, 383D46
Gui, 89:Add, Text, x20 y20 w403 , PLEASE CONFIRM`nTHE FEEDBACK BELOW
Gui, 89:font,
Gui, 89:font, s10 bold cE8EBF5, Segoe UI
Gui, 89:Add, Text, x20 y80 w220 h80 , Bug with the script
Gui, 89:font,
Gui, 89:font, cE8EBF5,
Gui, 89:Add, Edit, VScroll x1000 y1000 h100, focus
Gui, 89:Add, Edit, -E0x200 readonly -tabstop VScroll x-1 x20 y100 w220 h60, %Bug%
Gui, 89:font, s10 bold cE8EBF5, Segoe UI
Gui, 89:Add, Text, x20 y180 w220 h80 , Suggested change/update
Gui, 89:font,
Gui, 89:font, cE8EBF5,
Gui, 89:Add, Edit, -E0x200 readonly -tabstop VScroll x-1 x20 y200 w220 h60 , %Update%
Gui, 89:Add, Button, x20 y290 w100 h30 , Confirm
Gui, 89:Add, Button, x140 y290 w100 h30 , Exit

Gui, 89:Show, %Gui_Cord% h350 w260, Feedback Form Confirmation
return


89ButtonConfirm:
Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileRead, logstring, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\logstring.txt
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Feedback Form`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	
	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "aaron.beecham@intellipharm.com.au"
	;email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "SCRIPT FEEDBACK FORM - " Name
	email.Body := "Tech: " Name "`n`n" "Bug: " Bug "`n" "Suggestion: " Update
	email.Send
	reload
Return

88ButtonExit:
Reload
return

89ButtonExit:
Reload
return

ButtonExit:
ExitApp

;============================= END TRAY

#F12::
Secret:
IfNotExist, C:\AutoHotKey\Files\mess.exe
	{
	sleep 50
	FileCreateDir, C:\AutoHotKey\Files\
	sleep 50
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\mess.exe, C:\AutoHotKey\Files\
	sleep 500
	}
Run, C:\AutoHotKey\Files\mess.exe
return

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
Gui, 98:Add,Button,x20 y112 w100 h25 gNifty,Nifty
Gui, 98:Add,Button,x145 y112 w100 h25 , Set Name
Gui, 98:Add,Button,x270 y112 w100 h25 ,Close
Gui, 98:Show, Center h410 w390, 🔥🔑 - Version %VersionNum%
return

;=====================================================HELP BUTTON

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

98ButtonClose:
Reload
return

98ButtonUpdate:
Gui,Destroy
FileReadLine, UpdateVersionNum, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1
If % VersionNum < UpdateVersionNum
{
Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\updater_v2.exe
sleep 150
ExitApp
} else {
    Msgbox, 1, ,The Gentlemen's Script is already up to date!`nNothing to see here, move along gents.
}
return

;=====================================================MAIN SCRIPT 
; These are all the type commands
; Here simply for the purpose of typing and replacing (NO GUI HERE)

;=====================================================FIRST WINDOW
; This is the first window for command activations using the Page Up button as an activator
; Again, I'm starting the GUI command with a destroy modifier so it will close any previous GUI created by the script (that's the theory anyway, it seems buggy though)

+PGDN::reload

^PGDN::

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

IfNotExist, C:\AutoHotKey\Files\border.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\border.png, C:\AutoHotKey\Files\border.png
}


IfNotExist, C:\AutoHotKey\Files\mainmenu.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\mainmenu.png, C:\AutoHotKey\Files\mainmenu.png
}

IfNotExist, G:\Support\
	{
		BGColour := "8A2D2D" ;:= BGColour
	}
	else BGColour := "1d1f21"


FileRead, ForceUpdate, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt
do_lines_pre = 
Gui, 99:-SysMenu +Border -MaximizeBox
Gui, 99:font, bold cE8EBF5 s24, Segoe UI
Gui, 99:Color, %BGColour%
Gui, 99:Add, Picture, x75 y30 h37 w294, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\mainmenu_alt_small.png

Gui, 99:font, s12 bold, Segoe UI

;Gui, 99:Add, Text, x30 y76 w200 , S U P P O R T
;Gui, 99:Add, Text, x255 y76 w200 , L O Y A L T Y

Gui, 99:font,
Gui, 99:font, s9 bold cE8EBF5, Segoe UI
Gui, 99:Add, Text, x0 y5 w450 center , Hello %Name% %Surname%

Gui, 99:Add, Button, x30000 y105 w165 h30 Left , Placeholder


;Gui, 99:Add, GroupBox, x15 y76 w420 h253 , ;Full

	;Gui, 99:font,
	;Gui, 99:font, s12 bold cE8EBF5, Segoe UI
	;Gui, 99:Add, Button, x30 y76 w90 h30 gSUPMAIN, SUPPORT
	;Gui, 99:Add, Button, x330 y76 w90 h30 gLOYMAIN, LOYALTY

Gui, 99:Add, Button, x15 y355 w195 h30 Left , % "   Process Charts"
Gui, 99:Add, Button, xp yp+36 w195 h30 Left , % "   Password Generator"
Gui, 99:Add, Button, x227 y355 w95 h30 Left , % "   Macros"
Gui, 99:Add, Button, x340 y355 w95 h30 Left gLogsViewer, % "   Log Viewer"

Gui, 99:Add, Button, x227 y391 w95 h30 Left gWeekPoints , % "   Staff Points"
Gui, 99:Add, Button, x340 y391 w95 h30 Left glogviewer , % "   Staff Logs"

Gui, 99:font, s9 bold , Segoe UI
Gui, 99:Add, Button, x240 yp+280 w195 h30 Left , % "   E&xit"

Gui, 99:font, bold s10 CWhite, Segoe UI
Gui, 99:Add, Text, x15 y440 BackGroundTrans , POINT COUNTER
Gui, 99:font,
Gui, 99:font, bold s6 CWhite, Segoe UI

If Dog = Brodie
	{
	Gui, 99:Add, Button, x185 y460 w80 h20 gTicketCounter, TICKET COUNT
	}
If Dog = Aaron
	{
	Gui, 99:Add, Button, x185 y460 w80 h20 gTicketCounter, TICKET COUNT
	}

Gui, 99:Add, Button, x270 y460 w165 h20, FULL WEEK SUMMARY
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

Gui, 99:font, bold s9 %fc%, Segoe UI
Gui, 99:Add, Text, x270 y492 w200 BackGroundTrans , DATA OUTAGE COUNT = %do_lines_pre%/15

;DATA OUT COUNTER
Gui, 99:font, bold s10 CWhite, Segoe UI
Gui, 99:Add, Text, x15 y490 w200 BackGroundTrans , Running Total = %Points%

FileRead, DOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Data Out.txt
Gui, 99:Add, Button, x15 y530 w80 h20 Left, %A_Space%Data Out
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %DOPoints%

;INSTALL COUNTER
FileRead, INPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Install.txt
Gui, 99:Add, Button, xp+85 y530 w80 h20 Left, %A_Space%Install
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %INPoints%

;QA COUNTER
FileRead, QAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% QA.txt
Gui, 99:Add, Button, xp+85 y530 w80 h20 Left, %A_Space%QA
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %QAPoints%

;LOY IN
FileRead, LoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Loy Install.txt
Gui, 99:Add, Button, xp+85 y530 w80 h20 Left, %A_Space%Till Install
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %LoyInPoints%

;LOY CONFIG
FileRead, CONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Till Config.txt
Gui, 99:Add, Button, xp+85 y530 w80 h20 Left, %A_Space%Till Config
Gui, 99:Add, Text, xp yp+25 BackGroundTrans , %CONPoints%

Gui, 99:font, bold CWhite s6, Segoe UI
Gui, 99:Add, Text, x3 y3 , %Count%

;Gui, 99:+Hwndgui_id

If % VersionNum < ForceUpdate
{
Gui, 99:Add, Picture, x0 y656 w450 h30, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\update.png
Gui, 99:font, bold CWhite s10, Segoe UI
Gui, 99:Add, Button, x260 y656 w140 h30 , UPDATE NOW
Gui, 99:Show, %Gui_Cord% w450 h686 , %A_Space%
}
Else
{
Gui, 99:Show, %Gui_Cord% w450 , %A_Space%
}


If (!StartPOS)
	{
	StartPOS = Support
	IniWrite, %StartPOS%, C:\AutoHotKey\settings.ini, Starting Position, Start
	}

IniRead, StartPOS, C:\AutoHotKey\settings.ini, Starting Position, Start

Gui, 99:font,
Gui, 99:font, s12 CWhite Bold , Segoe UI

Gui, 99:Add, Tab2, x15 y85 w420 h253 gMenuTab vWhichTab choose%StartPOS%, %A_Space%%A_Space%%A_Space%S U P P O R T%A_Space%%A_Space%%A_Space%|%A_Space%%A_Space%%A_Space%L O Y A L T Y%A_Space%%A_Space%%A_Space%
Gui, 99:font,
Gui, 99:font, s9 , Segoe UI
Gui, 99:Add, Picture, x15 y113 BackgroundTrans, C:\AutoHotKey\Files\blue.png
Gui, 99:Add, Button, x30 yp+20 w120 h30 Left gSupINSTALL , % "   &1 - INSTALL"
Gui, 99:Add, Button, yp+40 w120 h30 Left gSupDO , % "   &2 - DATA OUTAGE"
Gui, 99:Add, Button, yp+40 w120 h30 Left gSupportQAs , % "   &3 - QA"
Gui, 99:Add, Button, yp+40 w120 h30 Left gSupADMIN , % "   &4 - ADMIN"
;Gui, 99:Add, Button, yp+40 w120 h30 Left gSupGeneral, % "   &5 - SUB-MENU"
Gui, 99:Add, Button, yp+40 w120 h30 Left gDeclinedConnection , % "   &5 - KNOCKBACK"

Gui, 99:Add, Button, xp+134 yp-120 w120 h30 Right gFredConf, % "Fred Confirmation   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gQAPass , % "QA Pass   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gSupCancellation , % "Cancellation   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gPhoneRangOut , % "Phone Rang Out   "

Gui, 99:Add, Button, xp+134 yp-80 w120 h30 Right gRemoteReset , % "Remote Update   "
;Gui, 99:Add, Button, yp+40 w120 h30 Right gSupSiteReset , % "Site Reset   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gSupPaths , % "Paths for AV   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gSupEMAILS, % "Email Templates   "

Gui, 99:Tab, 2
Gui, 99:Add, Picture, x15 y113 BackgroundTrans, C:\AutoHotKey\Files\green.png
Gui, 99:Add, Button, x30 yp+20 w120 h30 Left gLoyInstall , % "   &1 - INSTALL"
Gui, 99:Add, Button, yp+40 w120 h30 Left gLoyTillConfig , % "   &2 - TILL CONFIG"
Gui, 99:Add, Button, yp+40 w120 h30 Left gLoyQA , % "   &3 - QA"
Gui, 99:Add, Button, yp+40 w120 h30 Left gLoyAdmin , % "   &4 - ADMIN"
;Gui, 99:Add, Button, yp+40 w120 h30 Left gLoyOther, % "   &5 - SUB-MENU"
Gui, 99:Add, Button, yp+40 w120 h30 Left gQ13 , % "   &3 - LOYSERV"

Gui, 99:Add, Button, xp+134 yp-80 w120 h30 Right gCardOrders, % "Card Orders   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gLoyaltyCancelation, % "Loyalty Cancel   "
Gui, 99:Add, Button, yp+40 w120 h30 Right gTWCMRoll , % "TWCM Rollout   "

return

MenuTab:
if (WhichTab != "   S U P P O R T   ")
	{
	IniWrite, 1, C:\AutoHotKey\settings.ini, Starting Position, Start
	}
	Else
	IniWrite, 2, C:\AutoHotKey\settings.ini, Starting Position, Start
	return

TicketCounter:

msgbox, 4, Ticket Count , Want to check the count now?, 3
IfMsgBox, Yes
	{
	run https://siteiq.intellipharm.com.au/index.php/issues/IssuesDataOldListData?xls=1&sEcho=1&iColumns=13&sColumns=&iDisplayStart=0&iDisplayLength=100&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&sSearch=&bRegex=false&sSearch_0=&bRegex_0=false&bSearchable_0=false&sSearch_1=&bRegex_1=false&bSearchable_1=false&sSearch_2=&bRegex_2=false&bSearchable_2=true&sSearch_3=&bRegex_3=false&bSearchable_3=true&sSearch_4=&bRegex_4=false&bSearchable_4=true&sSearch_5=&bRegex_5=false&bSearchable_5=true&sSearch_6=&bRegex_6=false&bSearchable_6=true&sSearch_7=&bRegex_7=false&bSearchable_7=true&sSearch_8=&bRegex_8=false&bSearchable_8=true&sSearch_9=&bRegex_9=false&bSearchable_9=true&sSearch_10=&bRegex_10=false&bSearchable_10=true&sSearch_11=&bRegex_11=false&bSearchable_11=true&sSearch_12=&bRegex_12=false&bSearchable_12=false&iSortCol_0=2&sSortDir_0=asc&iSortCol_1=8&sSortDir_1=desc&iSortingCols=2&bSortable_0=false&bSortable_1=false&bSortable_2=true&bSortable_3=true&bSortable_4=true&bSortable_5=true&bSortable_6=true&bSortable_7=true&bSortable_8=true&bSortable_9=true&bSortable_10=true&bSortable_11=true&bSortable_12=false
	Msgbox, 4096, Ticket Count, Click OK when you have copied the information to the clipboard.
	sleep 1000
	

str  := clipboard
match = AaronBeecham
StringReplace, str, str, %match%, %match%, UseErrorLevel
AB = %ErrorLevel%

str  := clipboard
match = CraigDuchesne
StringReplace, str, str, %match%, %match%, UseErrorLevel
CD = %ErrorLevel%

str  := clipboard
match = James
StringReplace, str, str, %match%, %match%, UseErrorLevel
JS = %ErrorLevel%

str  := clipboard
match = Joel
StringReplace, str, str, %match%, %match%, UseErrorLevel
JH = %ErrorLevel%

str  := clipboard
match = Joel
StringReplace, str, str, %match%, %match%, UseErrorLevel
JL = %ErrorLevel%

str  := clipboard
match = JoshHill
StringReplace, str, str, %match%, %match%, UseErrorLevel
JH = %ErrorLevel%

str  := clipboard
match = -
StringReplace, str, str, %match%, %match%, UseErrorLevel
Zero = %ErrorLevel%

str  := clipboard
match = 0 days
StringReplace, str, str, %match%, %match%, UseErrorLevel
Zero = %ErrorLevel%

;===========REMOVE 'TENS'

    str  := clipboard
    match = 10 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    TEN = %ErrorLevel%

    str  := clipboard
    match = 20 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    TWENTY = %ErrorLevel%

    str  := clipboard
    match = 30 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    THIRTY = %ErrorLevel%

    str  := clipboard
    match = 40 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    FOURTY = %ErrorLevel%

    str  := clipboard
    match = 50 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    FIFTY = %ErrorLevel%

    str  := clipboard
    match = 60 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    SIXTY = %ErrorLevel%

    str  := clipboard
    match = 70 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    SEVENTY = %ErrorLevel%

    str  := clipboard
    match = 80 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    EIGHTY = %ErrorLevel%

    str  := clipboard
    match = 90 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    NINETY = %ErrorLevel%

REMOVE := TEN + TWENTY + THIRTY + FOURTY + FIFTY + SIXTY + SEVENTY + EIGHTY + NINETY

ZEROFINAL := Zero - REMOVE
ZEROFINAL := Zero - REMOVE

;==== REMOVE Blanks

    str  := clipboard
    match = -	open
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    Blank = %ErrorLevel%

TotalFirst := AB + CD + JS + JL + JH
Total := TotalFirst - Blank

msgbox,4, Ticket Count, DATA OUTAGE TICKETS - %Total% tickets, including %ZEROFINAL% zero day tickets.`n__________________________________________________________________`n`nAaron Beecham:`t%AB%`nCraig Duchesne:`t%JS%`nJames Schubert:`t%JS%`nJoel Hanson:`t%JL%`nJosh Hill:`t`t%JH%`n__________________________________________________________________`n`nWould you like to copy the information to the clipboard?
IfMsgBox, No
	{
		reload
		return
	}
IfMsgBox, Yes
	{
	clipboard = DATA OUTAGE TICKETS - %Total% tickets, including %ZEROFINAL% zero day tickets.
		reload
		return
	}
	}


99ButtonMacros:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
gosub MM
return

;============ERROR REPORT

99Button-ErrorReport-:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 99Er:font, s16 bold cE8EBF5, Segoe UI
Gui, 99Er:Color, 1d1f21, 383D46
Gui, 99Er:Add, Edit, x1920 y2490 w80 , placeholder
Gui, 99Er:Add, Text, x20 y12 , ERROR REPORTING TOOL
Gui, 99Er:font,
Gui, 99Er:font, s8cE8EBF5, Segoe UI
Gui, 99Er:Add, Text, x20 y70 w90 , Where is the log/error located?
Gui, 99Er:Add, Radio, x120 y70 vRDis, DISPX
Gui, 99Er:Add, Radio, x120 y90 vRPos, POSX
Gui, 99Er:Add, Radio, x190 y70 vRHsn, HSNET
Gui, 99Er:Add, Radio, x190 y90 vROth, OTHER
Gui, 99Er:Add, Text, x18 y136 , Log location (file structure)
Gui, 99Er:Add, Text, x18 y166 , Copy/Paste line including the ERROR
Gui, 99Er:Add, Text, x18 y196 w263 vPreview, Please attach the LOG file
Gui, 99Er:Add, Text, x18 y226 , Please explain how you fixed this site:
Gui, 99Er:font, 
Gui, 99Er:Add, Edit, x212 y134 w170 h20 vLogLoc ,
Gui, 99Er:Add, Edit, x212 y164 w170 h20 vErrorLine ,
Gui, 99Er:Add, Button, x281 y194 w100 h20 , ATTACH FILE
Gui, 99Er:Add, Edit, x18 y246 w364 h60 vSolution ,
Gui, 99Er:font, s8 cE8EBF5, Segoe UI
Gui, 99Er:Add, Button, x18 y318 w140 h30 , Confirm
Gui, 99Er:Add, Button, x170 y318 w100 h30 , Back
Gui, 99Er:Add, Button, x281 y318 w100 h30 , Exit
Gui, 99Er:Add, Picture, x295 y58 w64 h64, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\warn.png
Gui, 99Er:Show, %Gui_Cord% w400 h365,  

loop
{
    Gui, 99Er:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = %Attachment%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 99Er:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

99ErButtonATTACHFILE:
FileSelectFile, Attachment, 3, , Open a file, Text Documents (*.txt; *.log)
if Attachment =
	MsgBox, 0, , Please Attach a Log File
    return
return

99ErButtonExit:
Reload
return

99ErButtonback:
Gui, 99Er:Destroy
Gui, 99P:Destroy
%do_lines_pre% = 0
gosub Q1
return

99ErButtonConfirm:

Gui, Submit, NoHide

if Attachment =
	MsgBox, 0, , Please Attach a Log File
else
	gosub completion
return

Completion:

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name

    Dis := RDis ? "DISPX " : ""
	Pos := RPos ? "POSX " : ""
	Hsn := RHsn ? "HSNET " : ""
	Oth := ROth ? "OTHER " : ""

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To := "aaron.beecham@intellipharm.com.au"
email.Subject := "ERROR REPORT - SUPPORT"
email.Body := "From`t" Name "`n`nSoftware:`t" Dis Pos Hsn Oth "`nLog Location:`t" LogLoc "`nError Line:`t" ErrorLine "`nSolution:`t" Solution "`n`n"
email.Attachments.add(Attachment)
email.Send

Gui, 99Er:Destroy

MsgBox, 0, Sent, Thank you for sending through an Error Report.
reload
Return

;============ERROR REPORT END

LogsViewer:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, 99:Destroy

IfNotExist, C:\AutoHotKey\logsettings.ini
	{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\logsettings.ini, C:\AutoHotKey\logsettings.ini, 1
	}

IniRead, dispdrive, C:\AutoHotKey\logsettings.ini, drives, dispx
IniRead, posdrive, C:\AutoHotKey\logsettings.ini, drives, posx
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Logs:-SysMenu +Border
Gui, Logs:Color, 1d1f21, 383D46


Gui, Logs:font, s14 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y18 , LOGS VIEWER

Gui, Logs:font, 
Gui, Logs:font, s10 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y160 , SITE CODE:
Gui, Logs:font, 
Gui, Logs:font, s10 cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, yp+20 -E0x200 w120 vSiteCode,

Gui, Logs:font, 
Gui, Logs:font, s8 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y58 , DISPX DRIVE:
Gui, Logs:Add, Edit, xp+70 w15 h15 -E0x200 vdispdrive, %dispdrive%

Gui, Logs:Add, Text, x18 yp+20, POSX DRIVE:
Gui, Logs:Add, Edit, xp+70 w15 h15 -E0x200 vposdrive, %posdrive%

Gui, Logs:font, 
Gui, Logs:font, s14 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Button, x115 y65 w25 h25 gupdatedrive, ↑

Gui, Logs:font, 
Gui, Logs:font, s8 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Radio, x18 yp+45 vDISP , DISPX
Gui, Logs:Add, Radio, yp+20 vPOS, POSX

Gui, Logs:font, 
Gui, Logs:font, s7 cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x75 y110 , (only current date)

FormatTime, Date,, yyyyMMdd

Gui, Logs:font, 
Gui, Logs:font, s10 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y210 , DATE:
Gui, Logs:font, 
Gui, Logs:font, s10 cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, yp+20 -E0x200 w120 vDate, %Date%

Gui, Logs:Add, Button, yp+50 w120 gopenlogfile, OPEN FILE

Gui, Logs:Add, Button, yp+40 w55 gopendrivedisp, DISP:\
Gui, Logs:Add, Button, xp+65 w55 gopendrivepos, POS:\

Gui, Logs:Add, Button, xp-65 yp+70 w120 gmapdisp, MAP DISPX
Gui, Logs:Add, Button, yp+40 w120 gmappos, MAP POSX

Gui, Logs:Add, Button, yp+60 w120 glogsexit, EXIT



Gui, Logs:font,
Gui, Logs:font, cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, x170 y28 w602 h490 -E0x200 ReadOnly vPreview, 
Gui, Logs:Add, GroupBox, x160 y20 w614 h500,

Gui, Logs:Show, %Gui_Cord% w795 h540, Logs Viewer

loop
{
    Gui, Logs:Submit, NoHide
	
    DISP := DISP ? dispdrive ":\MYSQL\dserversql\logs\" SiteCode "_CURRENT.TXT": ""
	POS := POS ? posdrive ":\Logs\" SiteCode "_PXLOG_" Date ".TXT" : ""

	FileRead, Display, %DISP%%POS%

    msgText = %Display%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, Logs:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return


updatedrive:
IniWrite, %posdrive%, C:\AutoHotKey\logsettings.ini, drives, posx
IniWrite, %dispdrive%, C:\AutoHotKey\logsettings.ini, drives, dispx
return

logsexit:
reload
return

openlogfile:
run, %DISP%%POS%
return

opendrivedisp:
IniRead, dispdrive, C:\AutoHotKey\logsettings.ini, drives, dispx
run, %dispdrive%:\MYSQL\dserversql\logs\
return

opendrivepos:
IniRead, posdrive, C:\AutoHotKey\logsettings.ini, drives, posx
run, %posdrive%:\Logs\
return

mapdisp:
Msgbox, 4,,Would you like to map the drive required for DISPX?
IfMsgBox Yes
	Run %comspec% /c net use L: \\10.8.224.22\live
return

mappos:
Msgbox, 4,,Would you like to map the drive required for POSX?
IfMsgBox Yes
	Run %comspec% /c net use I: \\10.8.224.25\Iserver_mysql
return



99ButtonFULLWEEKSUMMARY:
If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, Name
If Name = Aaron
{
InputBox, Name, Summary, , , 80, 105
}
If Name = Brodie
{
InputBox, Name, Summary, , , 80, 105
}
If (Name = "")
{
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
}

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
   mon_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
{
   tue_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
{
   wed_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
{
   thur_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
{
   fri_lines = %A_Index%
}

do_lines += mon_lines
do_lines += tue_lines
do_lines += wed_lines
do_lines += thur_lines
do_lines += fri_lines

;======================= MONDAY

IniRead, Weekly_Cord, C:\AutoHotKey\settings.ini, window position, weekly_position, x1 y1

Gui, 99P2:Color, 1d1f21, 383D46
Gui, 99P2:Add, Button, x2000 y2000 w20 h20 , placehold
Gui, 99P2:font, bold s12 CWhite, Segoe UI
Gui, 99P2:Add, Text, x25 y15 BackGroundTrans , FULL WEEK SUMMARY
Gui, 99P2:Add, Text, x380 y15 BackGroundTrans , DATA OUTAGE = %do_lines%
Gui, 99P2:font,
Gui, 99P2:font, bold s6 , Segoe UI	
Gui, 99P2:Add, Button, x545 y15 w50 h25 gFULLWEEKSAVEPOS, SAVE`nPOSITION
;Gui, 99P2:Add, Button, x505 y15 w80 h20,  SAVE POSITION
Gui, 99P2:font,
Gui, 99P2:font, bold s10 CWhite, Segoe UI	

Gui, 99P2:Add, GroupBox, x15 y45 w100 h680, MONDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, mDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Data Out.txt
Gui, 99P2:Add, Button, x16 y75 w99 h20 Left gMONDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y95 w94 h110 readonly -tabstop VScroll -E0x200, %mDOPoints%

;INSTALL COUNTER
FileRead, mINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y205 w99 h20 Left gMONIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y225 w94 h110 readonly -tabstop VScroll -E0x200, %mINPoints%

;QA COUNTER
FileRead, mQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y335 w99 h20 Left gMONQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y355 w94 h110 readonly -tabstop VScroll -E0x200, %mQAPoints%

;LOY IN
FileRead, mLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y465 w99 h20 Left gMONTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y485 w94 h110 readonly -tabstop VScroll -E0x200, %mLoyInPoints%

;LOY CONFIG
FileRead, mCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y595 w99 h20 Left gMONTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y615 w94 h109 readonly -tabstop VScroll -E0x200, %mCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= TUESDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

Gui, 99P2:Add, GroupBox, x135 y45 w100 h680, TUESDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, tDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
Gui, 99P2:Add, Button, x136 y75 w99 h20 Left gTUEDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y95 w94 h110 readonly -tabstop VScroll -E0x200, %tDOPoints%

;INSTALL COUNTER
FileRead, tINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y205 w99 h20 Left gTUEIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y225 w94 h110 readonly -tabstop VScroll -E0x200, %tINPoints%

;QA COUNTER
FileRead, tQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y335 w99 h20 Left gTUEQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y355 w94 h110 readonly -tabstop VScroll -E0x200, %tQAPoints%

;LOY IN
FileRead, tLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y465 w99 h20 Left gTUETIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y485 w94 h110 readonly -tabstop VScroll -E0x200, %tLoyInPoints%

;LOY CONFIG
FileRead, tCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y595 w99 h20 Left gTUETC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y615 w94 h109 readonly -tabstop VScroll -E0x200, %tCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= WEDNESDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

Gui, 99P2:Add, GroupBox, x255 y45 w100 h680, WEDNESDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, wDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
Gui, 99P2:Add, Button, x256 y75 w99 h20 Left gWEDDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y95 w94 h110 readonly -tabstop VScroll -E0x200, %wDOPoints%

;INSTALL COUNTER
FileRead, wINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y205 w99 h20 Left gWEDIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y225 w94 h110 readonly -tabstop VScroll -E0x200, %wINPoints%

;QA COUNTER
FileRead, wQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y335 w99 h20 Left gWEDQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y355 w94 h110 readonly -tabstop VScroll -E0x200, %wQAPoints%

;LOY IN
FileRead, wLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y465 w99 h20 Left gWEDTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y485 w94 h110 readonly -tabstop VScroll -E0x200, %wLoyInPoints%

;LOY CONFIG
FileRead, wCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y595 w99 h20 Left gWEDTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y615 w94 h109 readonly -tabstop VScroll -E0x200, %wCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= THURSDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

Gui, 99P2:Add, GroupBox, x375 y45 w100 h680, THURSDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, thDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
Gui, 99P2:Add, Button, x376 y75 w99 h20 Left gTHURDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y95 w94 h110 readonly -tabstop VScroll -E0x200, %thDOPoints%

;INSTALL COUNTER
FileRead, thINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y205 w99 h20 Left gTHURIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y225 w94 h110 readonly -tabstop VScroll -E0x200, %thINPoints%

;QA COUNTER
FileRead, thQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y335 w99 h20 Left gTHURQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y355 w94 h110 readonly -tabstop VScroll -E0x200, %thQAPoints%

;LOY IN
FileRead, thLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y465 w99 h20 Left gTHURTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y485 w94 h110 readonly -tabstop VScroll -E0x200, %thLoyInPoints%

;LOY CONFIG
FileRead, thCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y595 w99 h20 Left gTHURTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y615 w94 h109 readonly -tabstop VScroll -E0x200, %thCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= FRIDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

Gui, 99P2:Add, GroupBox, x495 y45 w100 h680, FRIDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, fDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
Gui, 99P2:Add, Button, x496 y75 w99 h20 Left gFRIDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y95 w94 h110 readonly -tabstop VScroll -E0x200, %fDOPoints%

;INSTALL COUNTER
FileRead, fINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y205 w99 h20 Left gFRIIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add,Edit, x500 y225 w94 h110 readonly -tabstop VScroll -E0x200, %fINPoints%

;QA COUNTER
FileRead, fQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y335 w99 h20 Left gFRIQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y355 w94 h110 readonly -tabstop VScroll -E0x200, %fQAPoints%

;LOY IN
FileRead, fLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y465 w99 h20 Left gFRITIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y485 w94 h110 readonly -tabstop VScroll -E0x200, %fLoyInPoints%

;LOY CONFIG
FileRead, fCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y595 w99 h20 Left gFRITC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y615 w94 h109 readonly -tabstop VScroll -E0x200, %fCONPoints%



IniRead, mPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon%.ini, Count Points, Points,
IniRead, tPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue%.ini, Count Points, Points,
IniRead, wPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed%.ini, Count Points, Points,
IniRead, thPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur%.ini, Count Points, Points,
IniRead, fPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri%.ini, Count Points, Points,

Gui, 99P2:Add, Button, x15 y732 w100 h20 , %mPoints%
Gui, 99P2:Add, Button, x135 y732 w100 h20 , %tPoints%
Gui, 99P2:Add, Button, x255 y732 w100 h20 , %wPoints%
Gui, 99P2:Add, Button, x375 y732 w100 h20 , %thPoints%
Gui, 99P2:Add, Button, x496 y732 w100 h20 , %fPoints%

totalPoints += mPoints
totalPoints += tPoints
totalPoints += wPoints
totalPoints += thPoints
totalPoints += fPoints

Gui, 99P2:font, 
Gui, 99P2:font, s8 CWhite bold, Segoe UI
;Gui, 99P2:Add, GroupBox, x255 y1 w100 h38 ,
Gui, 99P2:Add, Text, x260 y1, Export Template
Gui, 99P2:font, bold s12 CWhite, Segoe UI
Gui, 99P2:Add, Button, x255 y12 h25 w100 gExportPointTemplate , %totalPoints%/75
;Gui, 99P2:Add, Text, x285 y15 BackGroundTrans , %totalPoints%/75

Gui, 99P2:Show, %Weekly_Cord%w610 h762,FULL WEEK SUMMARY
return

ExportPointTemplate:
IfNotExist, C:\AutoHotKey\Files\pointstemplate.xlsx
	{
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\pointstemplate.xlsx, C:\AutoHotKey\Files\pointstemplate.xlsx, 1
	}

FileCopy, C:\AutoHotKey\Files\pointstemplate.xlsx, C:\AutoHotKey\Files\%Name% - %mon% - WEEKLY POINTS.xlsx

FinalSheet = C:\AutoHotKey\Files\%Name% - %mon% - WEEKLY POINTS.xlsx

FormatTime, WeekStarting, dd/mm/yyyy

;============== MONDAY POINTS PER SITE

mDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Data Out.txt", "r" ).Read(), "`n" )
mINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Install.txt", "r" ).Read(), "`n" )
mQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " QA.txt", "r" ).Read(), "`n" )
mLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Loy Install.txt", "r" ).Read(), "`n" )
mCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Till Config.txt", "r" ).Read(), "`n" )

;============== TUESDAY POINTS PER SITE

tDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Data Out.txt", "r" ).Read(), "`n" )
tINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Install.txt", "r" ).Read(), "`n" )
tQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " QA.txt", "r" ).Read(), "`n" )
tLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Loy Install.txt", "r" ).Read(), "`n" )
tCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Till Config.txt", "r" ).Read(), "`n" )

;============== WEDNESDAY POINTS PER SITE

wDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Data Out.txt", "r" ).Read(), "`n" )
wINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Install.txt", "r" ).Read(), "`n" )
wQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " QA.txt", "r" ).Read(), "`n" )
wLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Loy Install.txt", "r" ).Read(), "`n" )
wCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Till Config.txt", "r" ).Read(), "`n" )

;============== THURSDAY POINTS PER SITE

thDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Data Out.txt", "r" ).Read(), "`n" )
thINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Install.txt", "r" ).Read(), "`n" )
thQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " QA.txt", "r" ).Read(), "`n" )
thLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Loy Install.txt", "r" ).Read(), "`n" )
thCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Till Config.txt", "r" ).Read(), "`n" )

;============== FRIDAY POINTS PER SITE

fDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Data Out.txt", "r" ).Read(), "`n" )
fINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Install.txt", "r" ).Read(), "`n" )
fQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " QA.txt", "r" ).Read(), "`n" )
fLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Loy Install.txt", "r" ).Read(), "`n" )
fCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Till Config.txt", "r" ).Read(), "`n" )

WorkBookPath		:= FinalSheet
objExcel			:= ComObjCreate("Excel.Application")
objWorkBook			:= objExcel.Workbooks.Open(WorkBookPath)
objExcel.Visible	:= FALSE

objExcel.Range("B1").Value := Name
objExcel.Range("B2").Value := WeekStarting

;====== FILL SHEET MONDAY

objExcel.Sheets("Monday").Select

objExcel.Range("A7").Value := mDOPoints[1]
objExcel.Range("A8").Value := mDOPoints[2]
objExcel.Range("A9").Value := mDOPoints[3]
objExcel.Range("A10").Value := mDOPoints[4]
objExcel.Range("A11").Value := mDOPoints[5]
objExcel.Range("A12").Value := mDOPoints[6]
objExcel.Range("A13").Value := mDOPoints[7]
objExcel.Range("A14").Value := mDOPoints[8]

objExcel.Range("B7").Value := mINPoints[1]
objExcel.Range("B8").Value := mINPoints[2]
objExcel.Range("B9").Value := mINPoints[3]
objExcel.Range("B10").Value := mINPoints[4]
objExcel.Range("B11").Value := mINPoints[5]
objExcel.Range("B12").Value := mINPoints[6]
objExcel.Range("B13").Value := mINPoints[7]
objExcel.Range("B14").Value := mINPoints[8]

objExcel.Range("C7").Value := mQAPoints[1]
objExcel.Range("C8").Value := mQAPoints[2]
objExcel.Range("C9").Value := mQAPoints[3]
objExcel.Range("C10").Value := mQAPoints[4]
objExcel.Range("C11").Value := mQAPoints[5]
objExcel.Range("C12").Value := mQAPoints[6]
objExcel.Range("C13").Value := mQAPoints[7]
objExcel.Range("C14").Value := mQAPoints[8]
objExcel.Range("C15").Value := mQAPoints[9]
objExcel.Range("C16").Value := mQAPoints1[0]

objExcel.Range("D7").Value := mLoyInPoints[1]
objExcel.Range("D8").Value := mLoyInPoints[2]
objExcel.Range("D9").Value := mLoyInPoints[3]
objExcel.Range("D10").Value := mLoyInPoints[4]
objExcel.Range("D11").Value := mLoyInPoints[5]
objExcel.Range("D12").Value := mLoyInPoints[6]
objExcel.Range("D13").Value := mLoyInPoints[7]
objExcel.Range("D14").Value := mLoyInPoints[8]

objExcel.Range("E7").Value := mCONPoints[1]
objExcel.Range("E8").Value := mCONPoints[2]
objExcel.Range("E9").Value := mCONPoints[3]
objExcel.Range("E10").Value := mCONPoints[4]
objExcel.Range("E11").Value := mCONPoints[5]
objExcel.Range("E12").Value := mCONPoints[6]
objExcel.Range("E13").Value := mCONPoints[7]
objExcel.Range("E14").Value := mCONPoints[8]

;====== FILL SHEET TUESDAY

objExcel.Sheets("Tuesday").Select

objExcel.Range("A7").Value := tDOPoints[1]
objExcel.Range("A8").Value := tDOPoints[2]
objExcel.Range("A9").Value := tDOPoints[3]
objExcel.Range("A10").Value := tDOPoints[4]
objExcel.Range("A11").Value := tDOPoints[5]
objExcel.Range("A12").Value := tDOPoints[6]
objExcel.Range("A13").Value := tDOPoints[7]
objExcel.Range("A14").Value := tDOPoints[8]

objExcel.Range("B7").Value := tINPoints[1]
objExcel.Range("B8").Value := tINPoints[2]
objExcel.Range("B9").Value := tINPoints[3]
objExcel.Range("B10").Value := tINPoints[4]
objExcel.Range("B11").Value := tINPoints[5]
objExcel.Range("B12").Value := tINPoints[6]
objExcel.Range("B13").Value := tINPoints[7]
objExcel.Range("B14").Value := tINPoints[8]

objExcel.Range("C7").Value := tQAPoints[1]
objExcel.Range("C8").Value := tQAPoints[2]
objExcel.Range("C9").Value := tQAPoints[3]
objExcel.Range("C10").Value := tQAPoints[4]
objExcel.Range("C11").Value := tQAPoints[5]
objExcel.Range("C12").Value := tQAPoints[6]
objExcel.Range("C13").Value := tQAPoints[7]
objExcel.Range("C14").Value := tQAPoints[8]
objExcel.Range("C15").Value := tQAPoints[9]
objExcel.Range("C16").Value := tQAPoints1[0]

objExcel.Range("D7").Value := tLoyInPoints[1]
objExcel.Range("D8").Value := tLoyInPoints[2]
objExcel.Range("D9").Value := tLoyInPoints[3]
objExcel.Range("D10").Value := tLoyInPoints[4]
objExcel.Range("D11").Value := tLoyInPoints[5]
objExcel.Range("D12").Value := tLoyInPoints[6]
objExcel.Range("D13").Value := tLoyInPoints[7]
objExcel.Range("D14").Value := tLoyInPoints[8]

objExcel.Range("E7").Value := tCONPoints[1]
objExcel.Range("E8").Value := tCONPoints[2]
objExcel.Range("E9").Value := tCONPoints[3]
objExcel.Range("E10").Value := tCONPoints[4]
objExcel.Range("E11").Value := tCONPoints[5]
objExcel.Range("E12").Value := tCONPoints[6]
objExcel.Range("E13").Value := tCONPoints[7]
objExcel.Range("E14").Value := tCONPoints[8]

;====== FILL SHEET WEDNESDAY

objExcel.Sheets("Wednesday").Select

objExcel.Range("A7").Value := wDOPoints[1]
objExcel.Range("A8").Value := wDOPoints[2]
objExcel.Range("A9").Value := wDOPoints[3]
objExcel.Range("A10").Value := wDOPoints[4]
objExcel.Range("A11").Value := wDOPoints[5]
objExcel.Range("A12").Value := wDOPoints[6]
objExcel.Range("A13").Value := wDOPoints[7]
objExcel.Range("A14").Value := wDOPoints[8]

objExcel.Range("B7").Value := wINPoints[1]
objExcel.Range("B8").Value := wINPoints[2]
objExcel.Range("B9").Value := wINPoints[3]
objExcel.Range("B10").Value :=twINPoints[4]
objExcel.Range("B11").Value := wINPoints[5]
objExcel.Range("B12").Value := wINPoints[6]
objExcel.Range("B13").Value := wINPoints[7]
objExcel.Range("B14").Value := wINPoints[8]

objExcel.Range("C7").Value := wQAPoints[1]
objExcel.Range("C8").Value := wQAPoints[2]
objExcel.Range("C9").Value := wQAPoints[3]
objExcel.Range("C10").Value := wQAPoints[4]
objExcel.Range("C11").Value := wQAPoints[5]
objExcel.Range("C12").Value := wQAPoints[6]
objExcel.Range("C13").Value := wQAPoints[7]
objExcel.Range("C14").Value := wQAPoints[8]
objExcel.Range("C15").Value := wQAPoints[9]
objExcel.Range("C16").Value := wQAPoints1[0]

objExcel.Range("D7").Value := wLoyInPoints[1]
objExcel.Range("D8").Value := wLoyInPoints[2]
objExcel.Range("D9").Value := wLoyInPoints[3]
objExcel.Range("D10").Value := wLoyInPoints[4]
objExcel.Range("D11").Value := wLoyInPoints[5]
objExcel.Range("D12").Value := wLoyInPoints[6]
objExcel.Range("D13").Value := wLoyInPoints[7]
objExcel.Range("D14").Value := wLoyInPoints[8]

objExcel.Range("E7").Value := wCONPoints[1]
objExcel.Range("E8").Value := wCONPoints[2]
objExcel.Range("E9").Value := wCONPoints[3]
objExcel.Range("E10").Value := wCONPoints[4]
objExcel.Range("E11").Value := wCONPoints[5]
objExcel.Range("E12").Value := wCONPoints[6]
objExcel.Range("E13").Value := wCONPoints[7]
objExcel.Range("E14").Value := wCONPoints[8]

;====== FILL SHEET THURSDAY

objExcel.Sheets("Thursday").Select

objExcel.Range("A7").Value := thDOPoints[1]
objExcel.Range("A8").Value := thDOPoints[2]
objExcel.Range("A9").Value := thDOPoints[3]
objExcel.Range("A10").Value := thDOPoints[4]
objExcel.Range("A11").Value := thDOPoints[5]
objExcel.Range("A12").Value := thDOPoints[6]
objExcel.Range("A13").Value := thDOPoints[7]
objExcel.Range("A14").Value := thDOPoints[8]

objExcel.Range("B7").Value := thINPoints[1]
objExcel.Range("B8").Value := thINPoints[2]
objExcel.Range("B9").Value := thINPoints[3]
objExcel.Range("B10").Value := thINPoints[4]
objExcel.Range("B11").Value := thINPoints[5]
objExcel.Range("B12").Value := thINPoints[6]
objExcel.Range("B13").Value := thINPoints[7]
objExcel.Range("B14").Value := thINPointstt[h]

objExcel.Range("C7").Value := thQAPoints[1]
objExcel.Range("C8").Value := thQAPoints[2]
objExcel.Range("C9").Value := thQAPoints[3]
objExcel.Range("C10").Value := thQAPoints[4]
objExcel.Range("C11").Value := thQAPoints[5]
objExcel.Range("C12").Value := thQAPoints[6]
objExcel.Range("C13").Value := thQAPoints[7]
objExcel.Range("C14").Value := thQAPoints[8]
objExcel.Range("C15").Value := thQAPoints[9]
objExcel.Range("C16").Value := thQAPoints1[0]

objExcel.Range("D7").Value := thLoyInPoints[1]
objExcel.Range("D8").Value := thLoyInPoints[2]
objExcel.Range("D9").Value := thLoyInPoints[3]
objExcel.Range("D10").Value := thLoyInPoints[4]
objExcel.Range("D11").Value := thLoyInPoints[5]
objExcel.Range("D12").Value := thLoyInPoints[6]
objExcel.Range("D13").Value := thLoyInPoints[7]
objExcel.Range("D14").Value := thLoyInPoints[8]

objExcel.Range("E7").Value := thCONPoints[1]
objExcel.Range("E8").Value := thCONPoints[2]
objExcel.Range("E9").Value := thCONPoints[3]
objExcel.Range("E10").Value := thCONPoints[4]
objExcel.Range("E11").Value := thCONPoints[5]
objExcel.Range("E12").Value := thCONPoints[6]
objExcel.Range("E13").Value := thCONPoints[7]
objExcel.Range("E14").Value := thCONPoints[8]

;====== FILL SHEET FRIDAY

objExcel.Sheets("Friday").Select

objExcel.Range("A7").Value := fDOPoints[1]
objExcel.Range("A8").Value := fDOPoints[2]
objExcel.Range("A9").Value := fDOPoints[3]
objExcel.Range("A10").Value := fDOPoints[4]
objExcel.Range("A11").Value := fDOPoints[5]
objExcel.Range("A12").Value := fDOPoints[6]
objExcel.Range("A13").Value := fDOPoints[7]
objExcel.Range("A14").Value := fDOPoints[8]

objExcel.Range("B7").Value := fINPoints[1]
objExcel.Range("B8").Value := fINPoints[2]
objExcel.Range("B9").Value := fINPoints[3]
objExcel.Range("B10").Value :=tfINPoints[4]
objExcel.Range("B11").Value := fINPoints[5]
objExcel.Range("B12").Value := fINPoints[6]
objExcel.Range("B13").Value := fINPoints[7]
objExcel.Range("B14").Value := fINPoints[8]

objExcel.Range("C7").Value := fQAPoints[1]
objExcel.Range("C8").Value := fQAPoints[2]
objExcel.Range("C9").Value := fQAPoints[3]
objExcel.Range("C10").Value := fQAPoints[4]
objExcel.Range("C11").Value := fQAPoints[5]
objExcel.Range("C12").Value := fQAPoints[6]
objExcel.Range("C13").Value := fQAPoints[7]
objExcel.Range("C14").Value := fQAPoints[8]
objExcel.Range("C15").Value := fQAPoints[9]
objExcel.Range("C16").Value := fQAPoints1[0]

objExcel.Range("D7").Value := fLoyInPoints[1]
objExcel.Range("D8").Value := fLoyInPoints[2]
objExcel.Range("D9").Value := fLoyInPoints[3]
objExcel.Range("D10").Value := fLoyInPoints[4]
objExcel.Range("D11").Value := fLoyInPoints[5]
objExcel.Range("D12").Value := fLoyInPoints[6]
objExcel.Range("D13").Value := fLoyInPoints[7]
objExcel.Range("D14").Value := fLoyInPoints[8]

objExcel.Range("E7").Value := fCONPoints[1]
objExcel.Range("E8").Value := fCONPoints[2]
objExcel.Range("E9").Value := fCONPoints[3]
objExcel.Range("E10").Value := fCONPoints[4]
objExcel.Range("E11").Value := fCONPoints[5]
objExcel.Range("E12").Value := fCONPoints[6]
objExcel.Range("E13").Value := fCONPoints[7]
objExcel.Range("E14").Value := fCONPoints[8]

objExcel.Sheets("Overall").Select

objWorkBook.Save
objExcel.Quit()
objExcel 	:= ""

gosub, EmailDavePoints

EmailDavePoints:
attach			:= FinalSheet

email 			:= ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To 		:= "dhobden@intellipharm.com.au"
email.Subject 	:= Name " - " mon " - WEEKLY POINTS LIST "
email.Body 		:=
email.Attachments.add(attach)

email.Display

reload
return

;======= BUTTONS FOR FULL WEEK SUMMARY

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

;====== END OF BUTTONS FOR FULL WEEK SUMMARY

FULLWEEKSAVEPOS:
Gui, Destroy
Gui, 99Pos:Color, 1d1f21, 383D46
Gui, 99Pos:font, Bold cE8EBF5 s18, Segoe UI
Gui, 99Pos:Add, Text, Center x1 y20 w610, SET POSITION AND CLICK SAVE
Gui, 99Pos:font,
Gui, 99Pos:font, Bold cE8EBF5 s12, Segoe UI
Gui, 99Pos:Add, Button, x232 y100 w120 h40 gWEEKLYSAVE, SAVE
Gui, 99Pos:Show, x0 y0 w610 h762, Set Position
return

SMALLSAVEPOS:
Gui, Destroy
Gui, 99Pos:Color, 1d1f21, 383D46
Gui, 99Pos:font, Bold cE8EBF5 s18, Segoe UI
Gui, 99Pos:Add, Text, Center x1 y20 w450, SET POSITION AND CLICK SAVE
Gui, 99Pos:font,
Gui, 99Pos:font, Bold cE8EBF5 s12, Segoe UI
Gui, 99Pos:Add, Button, x162 y100 w120 h40 gDAILYSAVE, SAVE
Gui, 99Pos:Show, x0 y0 w450 h250, Set Position
return

WEEKLYSAVE:
WinGetPos, gui_x, gui_y,,, ahk_exe script.exe
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, weekly_position
Reload
return

DAILYSAVE:
WinGetPos, gui_x, gui_y,,, ahk_exe script.exe
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, point_position
Reload
return

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


99ButtonUPDATENOW:
gosub 98ButtonUpdate
return

;~ when you close the window, get its position and save it
99GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
reload
return

LoyQA:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

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

LoyInstall:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

IfNotExist, C:\AutoHotKey\Files\LoyaltyInstall.exe
{
	FileCopy, G:\Support\Public Staff Folders\Aaron\tools\LoyaltyInstall.exe, C:\AutoHotKey\Files\
sleep 2000
}

Gui, 2:Destroy
Gui, 30:Destroy

Run, C:\AutoHotKey\Files\LoyaltyInstall.exe
Reload
return

99ButtonSavePos:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 99:Destroy
IniRead, gui_position, C:\AutoHotKey\settings.ini, window position, gui_position, Center
Gui, A1:+Hwndgui_id
Gui, A1:Add, Text, x18 y20 w250, Click save when you're happy with the position of the window
Gui, A1:Add, Button, x180 y55 w100 h30, Save
Gui, A1:Show, %gui_position% w300 h100, Save GUI Position
return


A1ButtonSave:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

99ButtonPasswordGenerator:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 87:-SysMenu +Border
Gui, 87:Color, 1d1f21, 383D46
Gui, 87:Font, cc5c8c6, Segoe UI
Gui, 87:Add, GroupBox, x16 y30 w130 h140,password contains...
Gui, 87:Add, Checkbox, x26 y47 w115 h30 vCheck1 checked,lower case letters
Gui, 87:Add, Checkbox, x26 y77 w115 h30 vCheck2 checked,capital letters
Gui, 87:Add, Checkbox, x26 y107 w115 h30 vCheck3 checked,digits
Gui, 87:Add, Checkbox, x26 y137 w115 h30 vCheck4,special chars
Gui, 87:Add, GroupBox, x154 y30 w100 h50,password length
Gui, 87:Add, Edit, -E0x200 x164 y50 w80 h20 vPasslen, 16
Gui, 87:Add, GroupBox, x154 y82 w100 h88, Info
Gui, 87:Add, Text, x161 y97 w90 h69 , generated password will automatically copied to clipboard!
Gui, 87:Add, Button, x16 y304 w237 h30 Default, &Confirm
Gui, 87:Add, Button, x16 y344 w115 h30, &Back
Gui, 87:Add, Button, x137 y344 w115 h30, &Close
Gui, 87:Add, Edit, -E0x200 x16 y184 w237 -VScroll h100 vNewPass readonly,  
Gui, 87:Show, %Gui_Cord% h398 w271, %A_Space%
Return
;---------------
87ButtonClose:
Reload
return
;---------------
87ButtonBack:
Gui, 87:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return
;---------------
87ButtonConfirm:
Gui, 87:Submit, NoHide ; Save the values of the check buttons.
if (passlen <= 0) 
{
  msgbox,16, Well aren't you a special snowflake..., You want a password with 0 characters? What are you... a Pharmacist?
  GuiControl,, Passlen, 8
  GuiControl,, NewPass,
  Clipboard = 
  return
}
if (passlen > 1000) 
{
  msgbox,64, Info, Attention: Maximum password length is 1000 characters ! ;-)
  GuiControl,, Passlen, 1000
  GuiControl,, NewPass,
  Clipboard = 
  return
}
strpool =
pass =
chAlpha1 = abcdefghijklmnopqrstuvwxyz
chAlpha2 = ABCDEFGHIJKLMNOPQRSTUVWXYZ
chNumeric = 1234567890
chExtra = !"£$`%^&*()_-=+{}[]`;:``@'#~<>,./?\|¬¦
if (check1 = 0) and (check2 = 0) and (check3 = 0) and (check4 = 0)
{
  msgbox,64, Info,Please check a minimum of 1 checkbox !
  GuiControl,, NewPass,
  GuiControl,, check1,1
  GuiControl,, check2,1
  GuiControl,, check3,1
  Clipboard = 
  return
}
if Check1 = 1 
  strpool = %strpool%%chAlpha1%
if Check2 = 1 
  strpool = %strpool%%chAlpha2%
if Check3 = 1 
  strpool = %strpool%%chNumeric%
if Check4 = 1 
  strpool = %strpool%%chExtra%
StringSplit, list, strpool
Loop, % passlen
{
	Random, rnd, 1, % list0
	i := list%rnd%
	pass = %pass%%i%
}
GuiControl,, NewPass, %pass%
Clipboard = %pass%
Return

99ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

99ButtonInstallations:
gosub Q3
return

;=========================================PROCESS LIST PDF

99ButtonProcessCharts:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 86:-SysMenu +Border
Gui, 86:font, bold cE8EBF5 s12, Segoe UI
Gui, 86:Add, Text, center x1 y20 w274 , PROCESS CHARTS
Gui, 86:font, 
Gui, 86:font, bold cE8EBF5 s8, Segoe UI
Gui, 86:Color, 1d1f21, 383D46

Gui, 86:Add, Button, x28 y465 w100 h30 , BACK
Gui, 86:Add, Button, x143 y465 w100 h30 , EXIT

Gui, 86:Add, Tab2, x12 y59 w250 h390 , GENERAL|DISPENSARY|POS|LOYALTY

Gui, 86:Tab, GENERAL


Gui, 86:Add, Button, x28 y120 w102 h30 , QA
Gui, 86:Add, Button, x143 yp+0 w102 h30 , Sanofi QA
Gui, 86:Add, Button, x28 yp+40 w217 h30 , General Installation Help
Gui, 86:Add, Button, yp+40 w217 h30 gEcom , E-Commerce
Gui, 86:Add, Button, yp+40 w217 h30 , Email
Gui, 86:Add, Button, yp+40 w217 h30 , Clients and Services
Gui, 86:Add, Button, yp+40 w217 h30 gGroupAccount, Making a Group Account

Gui, 86:Tab, DISPENSARY
Gui, 86:Add, Button, x28 y120 w102 h30 , Aquarius
Gui, 86:Add, Button, x143 yp+0 y120 w102 h30 gAmfacd, Amfac
Gui, 86:Add, Button, x28 yp+40 w217 h30 gFNd, Fred Next
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSd, LOTS
Gui, 86:Add, Button, x143 yp+0 w102 h30 gLOTSNZd, LOTS NZ
Gui, 86:Add, Button, x28 yp+40 w217 h30 gMINFd, MINFOS
Gui, 86:Add, Button, yp+40 w217 h30 gMTOPd, Mountain Top
Gui, 86:Add, Button, yp+40 w217 h30 gProd, Pharmacy Pro
Gui, 86:Add, Button, yp+40 w217 h30 gToniqd, Toniq
Gui, 86:Add, Button, yp+40 w217 h30 gZedd, Zed

Gui, 86:Tab, POS
Gui, 86:Add, Button, x28 y120 w102 h30 , FRED
Gui, 86:Add, Button, yp+40 w102 h30 gFNp, Fred Next
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSp, LOTS
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSNZp, LOTS NZ
Gui, 86:Add, Button, yp+40 w102 h30 gMINFp, MINFOS
Gui, 86:Add, Button, yp+40 w102 h30 gMTOPp, Mountain Top
Gui, 86:Add, Button, yp+40 w102 h30 gProp, Pharmacy Pro
Gui, 86:Add, Button, yp+40 w102 h30 , POS Browser
Gui, 86:Add, Button, x143 y120 w102 h30 , POS Works
Gui, 86:Add, Button, yp+40 w102 h30 , POS Master
Gui, 86:Add, Button, yp+40 w102 h30 , Simple
Gui, 86:Add, Button, yp+40 w102 h30 gToniqp, Toniq
Gui, 86:Add, Button, yp+40 w102 h30 gZedp, Zed

Gui, 86:Tab, LOYALTY
Gui, 86:Add, Button, x28 y120 w217 h30 , Loyalty Clients
Gui, 86:Add, Button, yp+40 w217 h30 gLoyMinfTrain, Intergrated MINFOS Training
Gui, 86:Add, Button, yp+40 w217 h30 , Install Back Office
Gui, 86:Add, Button, yp+40 w217 h30 , Install Mountain Top
Gui, 86:Add, Button, yp+40 w217 h30 , Install STOPS
Gui, 86:Add, Button, yp+40 w217 h30 , Install LOTS
Gui, 86:Add, Button, yp+40 w217 h30 , Install SIMPLE
Gui, 86:Add, Button, yp+40 w217 h30 , Install Zed

Gui, 86:Show, %Gui_Cord% w274 h513, %A_Space%
return

Amfacd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\AMFAC Dispx.pdf
Reload
return

GroupAccount:
Gui, 86:Destroy
;Gui Wmp:-SysMenu +Border
Gui Wmp:Color, 1d1f21, 383D46
Gui Wmp: +LastFound
Gui Wmp: Add, ActiveX, w1280 h784 vWmp, WMPLayer.OCX
Wmp.Url := "G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\groupaccount.mp4"
;Gui Wmp:Add, Button, x1080 y800 w200 h30 , EXIT
Gui Wmp: Show, , How to create a Group User account
return

WmpGuiClose:
Reload
Return

86ButtonBack:
Gui, 86:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

86ButtonExit:
Reload
return

86ButtonQA:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\QA Process.pdf
Reload
return

86ButtonSanofiQA:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Sanofi QA Process.pdf
Reload
return

86ButtonGeneralInstallationHelp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Posx and Dispx.pdf
Reload
return

Ecom:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Ecom.pdf
Reload
return

86ButtonEmail:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Email.pdf
Reload
return

86ButtonClientsandServices:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Client Requirements and Products\CLIENTS_AND_SERVICES.pdf
Reload
return

86ButtonAquarius:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Aquarius Dispx.pdf
Reload
return

FNd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FREDNXT Dispx.pdf
Reload
return

LOTSd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTS Dispx.pdf
Reload
return

LOTSNZd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTSNZ - RXONE DISPX installation Process.pdf
Reload
return

MINFd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MINFOS Dispx.pdf
Reload
return

MTOPd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MTNTOP Dispx.pdf
Reload
return

Prod:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Pharmacy Pro Dispx.pdf
Reload
return

Zedd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Z Dispx.pdf
Reload
return

86ButtonFRED:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FRED Posx.pdf
Reload
return

FNp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FREDNXT Posx.pdf
Reload
return

LOTSp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTS Posx.pdf
Reload
return

LOTSNZp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTSNZ - RXONE Posx installation Process.pdf
Reload
return

MINFp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MINFOS Posx.pdf
Reload
return

MTOPp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MTNTOP Posx.pdf
Reload
return

Prop:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Pharmacy Pro Posx.pdf
Reload
return

86ButtonPOSBrowser:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\POSB Posx.pdf
Reload
return

86ButtonPOSWorks:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\POSW Posx.pdf
Reload
return

86ButtonPosmaster:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Posmaster Posx.pdf
Reload
return

86ButtonSIMPLE:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\SIMPLE Posx.pdf
Reload
return

Zedp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Z Posx.pdf
Reload
return

86ButtonLoyaltyClients:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Loyalty Clients\websites-loyalty.htm
Reload
return

LoyMinfTrain:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Intergrated MINFOS Loyalty Training TILL.pdf
Reload
return

86ButtonInstallBackOffice:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - Backoffice.pdf
Reload
return

86ButtonInstallMountainTop:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - Mountaintop.pdf
Reload
return

86ButtonInstallSTOPS:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - STOPS.pdf
Reload
return

86ButtonInstallLOTS:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - LOTS.pdf
Reload
return

86ButtonInstallSIMPLE:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - SIMPLE.pdf
Reload
return

86ButtonInstallZed:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - ZED.pdf
Reload
return

Toniqd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\TONIQ DISPX installation Process.pdf
Reload
return

Toniqp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\TONIQ POSX installation Process.pdf
Reload
return

;=====================================================LOYSERV

Q13:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 55:font, bold cE8EBF5 s12, Segoe UI
Gui, 55:Color, 1d1f21, 383D46
Gui, 55:Add, Text, x0 y32 w210 h50 Center, LOYSERV CREATOR
Gui, 55:font,
Gui, 55:Add, Button, x30 y80 w150 h30 gTWChemmart, &1 TerryWhiteChemmart
Gui, 55:Add, Button, x30 y120 w150 h30 , &2 Chempro
Gui, 55:Add, Button, x30 y160 w150 h30 , &3 Pharmacy
Gui, 55:Add, Button, x30 y200 w150 h30 , &4 Restore Rewards
Gui, 55:Add, Button, x30 y240 w150 h30 , &5 Soul Pattinson
Gui, 55:Add, Button, x30 y280 w150 h30 , &6 Pharmacist Advice
Gui, 55:Add, Button, x30 y320 w150 h30 , &7 Ramsay
Gui, 55:Add, Button, x30 y360 w150 h30 , &8 Independant

Gui, 55:font, bold 
Gui, 55:Add, Button, x30 y420 w150 h30 , RESET TEMPLATES
Gui, 55:font,
;Gui, 55:Add, Button, x30 y460 w70 h30 , &Back

Gui, 55:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 55:Add, Button, x12 y670 w184 h30 , &Close

Gui, 55:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

Return

55ButtonBack:
Gui, 55:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

55ButtonClose:
Gui, 55:Destroy
return

55ButtonRESETTEMPLATES:
Gui, Submit
FileRemoveDir, C:\AutoHotKey\Files\LOYSERV\, 1
FileCopyDir, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\, C:\AutoHotKey\Files\LOYSERV\
msgbox, 0, Reset Templates, Loyserv Templates have been reset to default,
gosub, Q13
return

;======= LOYSERVE RAMSAY

55Button7Ramsay:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Ramsay\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Ramsay\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Ramsay\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Ramsay\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG
Gui, RAM:font, s12 bold, Segoe UI
Gui, RAM:Add, Text, center x0 y14 h30 w286 , Ramsay
Gui, RAM:font,
Gui, RAM:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, RAM:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, RAM:Add, Text, x28 y96 w80 h20 , Site Code
Gui, RAM:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, RAM:Add, Text, x28 y126 w80 h20 , Store Name
Gui, RAM:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, RAM:Add, Text, x28 y156 w80 h20 , Username
Gui, RAM:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, RAM:Add, Text, x28 y186 w80 h20 , Password
Gui, RAM:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, RAM:Add, Button, x18 y228 w78 h30 , Confirm
Gui, RAM:Add, Button, x102 y228 w78 h30 , Back
Gui, RAM:Add, Button, x185 y228 w78 h30 , Exit
Gui, RAM:Show, %Gui_Cord% w286 h278, 
return

RAMButtonExit:
Reload
return

RAMButtonBack:
Gui, RAM:Destroy
gosub Q13
return

RAMButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Ramsay\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, RAM2:font, s10, Segoe UI
	Gui, RAM2:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, RAM2:font, 
	Gui, RAM2:Add, Button, x78 y70 w80 h28 , Yes
	Gui, RAM2:Add, Button, x168 y70 w80 h28 , No
	Gui, RAM2:Show, w267 h113, Warning!
	return
	
	RAM2ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	RAM2ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Ramsay\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, RAM3:font, s10, Segoe UI
	Gui, RAM3:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, RAM3:font, 
	Gui, RAM3:Add, Button, x78 y70 w80 h28 , Yes
	Gui, RAM3:Add, Button, x168 y70 w80 h28 , No
	Gui, RAM3:Show, w267 h113, Complete!
	return
	
	RAM3ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	RAM3ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE CHEMMART

TWChemmart:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Chemmart\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 56:font, s12 bold, Segoe UI
Gui, 56:Add, Text, center x0 y14 h30 w286 , TerryWhite Chemmart
Gui, 56:font,
Gui, 56:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 56:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 56:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 56:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 56:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 56:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 56:Add, Text, x28 y156 w80 h20 , Username
Gui, 56:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 56:Add, Text, x28 y186 w80 h20 , Password
Gui, 56:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 56:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 56:Add, Button, x102 y228 w78 h30 , Back
Gui, 56:Add, Button, x185 y228 w78 h30 , Exit
Gui, 56:Show, %Gui_Cord% w286 h278, 
return

56ButtonExit:
Reload
return

56ButtonBack:
Gui, 56:Destroy
gosub Q13
return

56ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 57:font, s10, Segoe UI
	Gui, 57:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 57:font, 
	Gui, 57:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 57:Add, Button, x168 y70 w80 h28 , No
	Gui, 57:Show, w267 h113, Warning!
	return
	
	57ButtonYes:
	run, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	57ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 58:font, s10, Segoe UI
	Gui, 58:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 58:font, 
	Gui, 58:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 58:Add, Button, x168 y70 w80 h28 , No
	Gui, 58:Show, w267 h113, Complete!
	return
	
	58ButtonYes:
	run, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	58ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE CHEMPRO

55Button2Chempro:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Chempro\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 59:font, s12 bold, Segoe UI
Gui, 59:Add, Text, center x0 y14 h30 w286 , Chempro
Gui, 59:font,
Gui, 59:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 59:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 59:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 59:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 59:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 59:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 59:Add, Text, x28 y156 w80 h20 , Username
Gui, 59:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 59:Add, Text, x28 y186 w80 h20 , Password
Gui, 59:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 59:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 59:Add, Button, x102 y228 w78 h30 , Back
Gui, 59:Add, Button, x185 y228 w78 h30 , Exit
Gui, 59:Show, %Gui_Cord% w286 h278, 
return

59ButtonExit:
Reload
return

59ButtonBack:
Gui, 59:Destroy
gosub Q13
return

59ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 60:font, s10, Segoe UI
	Gui, 60:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 60:font, 
	Gui, 60:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 60:Add, Button, x168 y70 w80 h28 , No
	Gui, 60:Show, w267 h113, Warning!
	return
	
	60ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	60ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 61:font, s10, Segoe UI
	Gui, 61:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 61:font, 
	Gui, 61:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 61:Add, Button, x168 y70 w80 h28 , No
	Gui, 61:Show, w267 h113, Complete!
	return
	
	61ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	61ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE PHARMACY

55Button3Pharmacy:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Pharmacy\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Pharmacy\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Pharmacy\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 62:font, s12 bold, Segoe UI
Gui, 62:Add, Text, center x0 y14 h30 w286, Pharmacy
Gui, 62:font,
Gui, 62:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 62:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 62:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 62:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 62:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 62:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 62:Add, Text, x28 y156 w80 h20 , Username
Gui, 62:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 62:Add, Text, x28 y186 w80 h20 , Password
Gui, 62:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 62:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 62:Add, Button, x102 y228 w78 h30 , Back
Gui, 62:Add, Button, x185 y228 w78 h30 , Exit
Gui, 62:Show, %Gui_Cord% w286 h278, 
return


62ButtonExit:
Reload
return

62ButtonBack:
Gui, 62:Destroy
gosub Q13
return

62ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Pharmacy\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 63:font, s10, Segoe UI
	Gui, 63:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 63:font, 
	Gui, 63:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 63:Add, Button, x168 y70 w80 h28 , No
	Gui, 63:Show, w267 h113, Warning!
	return
	
	63ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	63ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Pharmacy\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 64:font, s10, Segoe UI
	Gui, 64:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 64:font, 
	Gui, 64:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 64:Add, Button, x168 y70 w80 h28 , No
	Gui, 64:Show, w267 h113, Complete!
	return
	
	64ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	64ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE RESTORE

55Button4RestoreRewards:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Restore Rewards\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Restore Rewards\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Restore Rewards\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Restore Rewards\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 72:font, s12 bold, Segoe UI
Gui, 72:Add, Text, center x0 y14 h30 w286 , Restore Rewards
Gui, 72:font,
Gui, 72:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 72:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 72:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 72:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 72:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 72:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 72:Add, Text, x28 y156 w80 h20 , Username
Gui, 72:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 72:Add, Text, x28 y186 w80 h20 , Password
Gui, 72:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 72:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 72:Add, Button, x102 y228 w78 h30 , Back
Gui, 72:Add, Button, x185 y228 w78 h30 , Exit
Gui, 72:Show, %Gui_Cord% w286 h278, 
return


72ButtonExit:
Reload
return

72ButtonBack:
Gui, 72:Destroy
gosub Q13
return

72ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Restore Rewards\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 73:font, s10, Segoe UI
	Gui, 73:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 73:font, 
	Gui, 73:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 73:Add, Button, x168 y70 w80 h28 , No
	Gui, 73:Show, w267 h113, Warning!
	return
	
	73ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	73ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Restore Rewards\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 74b:font, s10, Segoe UI
	Gui, 74b:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 74b:font, 
	Gui, 74b:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 74b:Add, Button, x168 y70 w80 h28 , No
	Gui, 74b:Show, w267 h113, Complete!
	return
	
	74ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	74ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE SOUL PAT

55Button5SoulPattinson:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Soul Pattinson\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Soul Pattinson\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Soul Pattinson\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Soul Pattinson\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 75:font, s12 bold, Segoe UI
Gui, 75:Add, Text, center x0 y14 h30 w286 , Soul Pattinson
Gui, 75:font,
Gui, 75:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 75:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 75:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 75:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 75:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 75:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 75:Add, Text, x28 y156 w80 h20 , Username
Gui, 75:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 75:Add, Text, x28 y186 w80 h20 , Password
Gui, 75:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 75:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 75:Add, Button, x102 y228 w78 h30 , Back
Gui, 75:Add, Button, x185 y228 w78 h30 , Exit
Gui, 75:Show, %Gui_Cord% w286 h278, 
return


75ButtonExit:
Reload
return

75ButtonBack:
Gui, 72:Destroy
gosub Q13
return

75ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Soul Pattinson\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 76:font, s10, Segoe UI
	Gui, 76:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 76:font, 
	Gui, 76:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 76:Add, Button, x168 y70 w80 h28 , No
	Gui, 76:Show, w267 h113, Warning!
	return
	
	76ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	76ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Soul Pattinson\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 77:font, s10, Segoe UI
	Gui, 77:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 77:font, 
	Gui, 77:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 77:Add, Button, x168 y70 w80 h28 , No
	Gui, 77:Show, w267 h113, Complete!
	return
	
	77ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	77ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;======= LOYSERVE PHARM ADVICE

55Button6PharmacistAdvice:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Pharmacist Advice\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 80:font, s12 bold, Segoe UI
Gui, 80:Add, Text, center x0 y14 h30 w286 , Pharmacist Advice
Gui, 80:font,
Gui, 80:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 80:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 80:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 80:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 80:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 80:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 80:Add, Text, x28 y156 w80 h20 , Username
Gui, 80:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 80:Add, Text, x28 y186 w80 h20 , Password
Gui, 80:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 80:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 80:Add, Button, x102 y228 w78 h30 , Back
Gui, 80:Add, Button, x185 y228 w78 h30 , Exit
Gui, 80:Show, %Gui_Cord% w286 h278, 
return


80ButtonExit:
Reload
return

80ButtonBack:
Gui, 72:Destroy
gosub Q13
return

80ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 81:font, s10, Segoe UI
	Gui, 81:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 81:font, 
	Gui, 81:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 81:Add, Button, x168 y70 w80 h28 , No
	Gui, 81:Show, w267 h113, Warning!
	return
	
	81ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	81ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 82:font, s10, Segoe UI
	Gui, 82:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 82:font, 
	Gui, 82:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 82:Add, Button, x168 y70 w80 h28 , No
	Gui, 82:Show, w267 h113, Complete!
	return
	
	82ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	82ButtonNo:
	Reload
	return
}
return

;======= LOYSERVE END

;=====================================================END LOYSERV

;=====================================================LOYALTY JAZZ

Q8:
LoyOther:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, 30:+ToolWindow -SysMenu +Border
Gui, 30:font, bold cE8EBF5 s12, Segoe UI
Gui, 30:Color, 1d1f21, 383D46
Gui, 30:Add, Text, center x0 y26 w210 h50 , LOYALTY`nSUB-MENU
Gui, 30:font, s9 bold, Segoe UI
Gui, 30:font,
Gui, 30:Add, Picture, x73 yp+60 w64 h64, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\loylogo.png
;Gui, 30:Add, Button, x30 yp+100 w150 h30 gCardOrders, &1 Card Orders
;Gui, 30:Add, Button, xp yp+40 w150 h30 , &2 Loyalty Cancelation
;Gui, 30:Add, Button, xp yp+40 w150 h30 gQ13 , &3 Loyserv Creator
Gui, 30:font, bold, Segoe UI
;Gui, 30:Add, Button, xp yp+40 w150 h30 gTWCMRoll , &4 TWCM Rollout
Gui, 30:font,
Gui, 30:Add, Button, xp yp+80 w150 h30 , CLOSE

Gui, 30:Add, Picture, xp+30 yp+120 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 30:Show, x%gui_x% y%gui_y% h655 w210,%A_Space%
Gui, 2:Hide

Return

30ButtonCLOSE:
Gui, 30:Destroy
return

30ButtonBack:
Gui, 30:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

TWCMRoll:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

run, C:\AutoHotKey\Files\Loyalty TWCM.exe

reload
return


;=====================================================LOYALTY CANCELATION

LoyaltyCancelation:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 77:Color, 1d1f21, 383D46
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

Gui, 77:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 77:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, 77:Add, Button, x12 y670 w184 h30 , &Close

Gui, 77:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%
return


77ButtonBack:
Gui, 77:Destroy
gosub Q1
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Cancelation - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
Return

;=====================================================CARD ORDERS

CardOrders:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

list1 = 500|1000|2000|5000
Gui, 30:Color, 1d1f21, 383D46
Gui, 30:font, s12 bold cE8EBF5, Segoe UI
Gui, 30:Add, Text, Center x0 y22 w210 h50, CARD ORDERS
Gui, 30:font,
Gui, 30:font, s8 cE8EBF5, Segoe UI
Gui, 30:Add, Text, x30 yp+50 w180 h50, Was the proof approved by the client?
Gui, 30:Add, Radio, x54 yp+45 vRadio1, YES
Gui, 30:Add, Radio, x114 yp+0 vRadio2, NO
Gui, 30:Add, Text,
Gui, 30:Add, Text, x30 yp+50 h15, How many cards for the order?
Gui, 30:Add, Radio, x55 yp+30 v500, 500
Gui, 30:Add, Radio, x55 yp+20 v1000, 1000
Gui, 30:Add, Radio, x55 yp+20 v2000, 2000
Gui, 30:Add, Radio, x55 yp+20 v5000, 5000
;Gui, 30:Add, DropDownList, x30 w150 vChoiceCO, %list1%

Gui, 30:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 30:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, 30:Add, Button, x12 y670 w184 h30 , &Close

Gui, 30:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%
Return

30ButtonConfirm:
Gui, Submit, NoHide

If(Radio1=1)
	GuiControlGet, Radio_1,, Radio1, Text
If(Radio2=1)
	GuiControlGet, Radio_2,, Radio2, Text
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Card Order - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
Clipboard =%Time% - #CARDORDER - %500%%1000%%2000%%5000% x card order sent - Proof approved by client: %Radio_1%%Radio_2%
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

reload
Return

;=====================================================DATA OUT LOY

30Button2SuperButton:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 31: -SysMenu +Border
Gui, 31:font, bold cE8EBF5 s12, Segoe UI
Gui, 31:Color, 1d1f21, 383D46
Gui, 31:font, s8, Segoe UI
Gui, 31:font, bold,
Gui, 31:Add, Text, x18 y22 h15, Was it a phone call or Email?
Gui, 31:font,
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Text, x18 y46, Email
Gui, 31:Add, Text, x88 y46, or
Gui, 31:Add, Radio, x46 y46 vRadio2, from
Gui, 31:Add, Radio, x106 y46 vRadio1, Spoke to
Gui, 31:font, bold,
Gui, 31:Add, Text, x18 y82 h15, Name of the contact?
Gui, 31:Add, Edit, w150 -E0x200 vBox1,
Gui, 31:Add, Text,
Gui, 31:font, bold,
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Text, x18 h15, What type of call was it?
Gui, 31:Add, Checkbox, x18 y168 vCb_1, #IN%A_Space%
Gui, 31:Add, Checkbox, x18 y188 vCb_2, #OUT%A_Space%
Gui, 31:Add, Checkbox, x18 y208 vCb_3, #EMAIL%A_Space%
Gui, 31:Font, bold c85EB6F
Gui, 31:Add, Checkbox, x18 y248 vCb_8, - GREEN Icon location:%A_Space% 
Gui, 31:Font, bold c6FC7EB
Gui, 31:Add, Checkbox, x18 y298 vCb_9, - BLUE Icon location:%A_Space%
Gui, 31:Add, Edit, x18 y268 w150 h18 -E0x200 vBox5, 
Gui, 31:Add, Edit, x18 y318 w150 h18 -E0x200 vBox6, 
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Text, x95 y168 h15, (Incoming call)
Gui, 31:Add, Text, x95 y188 h15, (Outgoing call)
Gui, 31:Add, Text, x95 y208 h15, (Email from)
Gui, 31:font, bold,
Gui, 31:Add, Text, x18 y350 h15, Additional Notes
Gui, 31:Add, Edit, w150 h100 -E0x200 vBox2,
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x18 y495 vCB_26, Ticket: LOYSUP-
Gui, 31:font,
Gui, 31:Add, Edit, x122 y493 w48 h18 -E0x200 vBox7,

;checkboxes for v2 loyalty

Gui, 31:font, s16 bold cE8EBF5, Segoe UI
Gui, 31:Add, Text, x210 y15 h15, PRODUCTS
Gui, 31:font, 
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x210 y46 vCb_4, %A_Space%#LOYV2%A_Space% ;Loyalty Version 2
Gui, 31:Add, Checkbox, x210 y66 vCb_5, %A_Space%#LOYV3%A_Space% ;Loyalty Version 3
Gui, 31:font, s16 bold cE8EBF5, Segoe UI
Gui, 31:Add, Text, x210 y110 h15, INSTALLATION
Gui, 31:font, 
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x210 y145 vCb_10, #LOYINSTALL%A_Space% ;Installtion
Gui, 31:Add, Checkbox, x210 y165 vCb_11, #TRAINED -%A_Space% ;Name of Person...
Gui, 31:Add, Edit, x310 y165 w100 h15 -E0x200 vBox3 ;TRAINED
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x210 y185 vCb_14, #CANCEL%A_Space% ;Issue not listed
Gui, 31:Add, Checkbox, x210 y205 vCb_13, #LEGACYDB%A_Space% ;Issue not listed
Gui, 31:Add, Checkbox, x340 y205 vCb_38, #LOYADMIN%A_Space% ;Issue not listed
Gui, 31:font, s16 bold cE8EBF5, Segoe UI
Gui, 31:Add, Text, x210 y250 h15, ISSUES
Gui, 31:font, 
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x210 y285 vCb_12, #RETRAINED -%A_Space% ;Name of Person...
Gui, 31:Add, Edit, x310 y285 w100 h15 -E0x200 vBox4
Gui, 31:font, cE8EBF5,
Gui, 31:Add, Checkbox, x210 y305 vCb_15, #LOYRESTALL%A_Space% ;Reinstallation
Gui, 31:Add, Checkbox, x210 y325 vCb_16, #PRS%A_Space%
Gui, 31:Add, Checkbox, x210 y345 vCb_17, #REDEMP%A_Space%
Gui, 31:Add, Checkbox, x210 y365 vCb_18, #ADJUST%A_Space%
Gui, 31:Add, Checkbox, x210 y385 vCb_19, #POINTEXCL%A_Space%
Gui, 31:Add, Checkbox, x210 y405 vCb_20, #LEGACYMEM%A_Space%
Gui, 31:Add, Checkbox, x210 y425 vCb_21, #REPORTS%A_Space%
Gui, 31:Add, Checkbox, x210 y445 vCb_22, #ICL%A_Space% ;Web access query
Gui, 31:Add, Checkbox, x210 y465 vCb_23, #PIN%A_Space%
Gui, 31:Add, Checkbox, x340 y325 vCb_24, #PL%A_Space% ;PLPrompter
Gui, 31:Add, Checkbox, x340 y345 vCb_25, #REMAP%A_Space% ;Remap fixed issue
Gui, 31:Add, Checkbox, x340 y365 vCb_27, #PRINTERS%A_Space% ;PLPrompter
Gui, 31:Add, Checkbox, x340 y385 vCb_28, #WIN10%A_Space% ;Upgraded to Windows 10
Gui, 31:Add, Checkbox, x340 y405 vCb_29, #CRYPTO%A_Space% ;Store got Crypto
Gui, 31:Add, Checkbox, x340 y425 vCb_30, #POSXFIX%A_Space% ;Posx fix
Gui, 31:Add, Checkbox, x340 y445 vCb_31, #CARDHOLDER%A_Space% ;Posx fix
Gui, 31:Add, Checkbox, x340 y465 vCb_32, #OTHER%A_Space% ;Issue not listed
Gui, 31:Add, Checkbox, x210 y505 vCb_33, #MINFUI%A_Space% ;Minfos UI errors
Gui, 31:Add, Checkbox, x210 y525 vCb_34, #MINFDIRECT%A_Space% ;Told customer to call Minfos
Gui, 31:Add, Checkbox, x210 y545 vCb_35, #MINFBOUNCE%A_Space% ;Minfos told customer to calls us
Gui, 31:Add, Checkbox, x210 y565 vCb_36, #MLUE%A_Space% ;Loyalty unavailable error
Gui, 31:Add, Checkbox, x210 y585 vCb_37, #NORESPONSE%A_Space% ;No response from loyalty
Gui, 31:Add, Text, x340 y505, Minfos Loyalty UI ERROR
Gui, 31:Add, Text, x340 y525, Told customer to call Minfos
Gui, 31:Add, Text, x340 y545, Minfos told customer to call us
Gui, 31:Add, Text, x340 y565, Loyalty unavailable error
Gui, 31:Add, Text, x340 y585, No response from loyalty
Gui, 31:Show, %Gui_Cord% h614 w500, Loyalty Team Page
Gui, 31:Add, Button, x18 y534 h30 w150, &Confirm
Gui, 31:Add, Button, x18 y572 h30 w72, &Back
Gui, 31:Add, Button, x96 y572 h30 w72, E&xit
Return

31ButtonBack:
Gui, 31:Destroy
gosub Q8
return

31ButtonExit:
Reload
return

31ButtonConfirm:
Gui, Submit, NoHide

;radial text grabs
If(Radio1=1)
GuiControlGet, Radio_1,, Radio1, Text
If(Radio2=1)
GuiControlGet, Radio_2,, Radio2, Text
;all the text grabs for the checkboxes... so fucking many holy fucking shit
;there's probably an easier way to do this but this is the only way I know how...
;seems ecessive but oh well
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
If(Cb_9=1)
 GuiControlGet, Cb_9_Text,, Cb_9, Text
If(Cb_10=1)
 GuiControlGet, Cb_10_Text,, Cb_10, Text
If(Cb_11=1)
 GuiControlGet, Cb_11_Text,, Cb_11, Text
If(Cb_12=1)
 GuiControlGet, Cb_12_Text,, Cb_12, Text
If(Cb_13=1)
 GuiControlGet, Cb_13_Text,, Cb_13, Text
If(Cb_14=1)
 GuiControlGet, Cb_14_Text,, Cb_14, Text
If(Cb_15=1)
 GuiControlGet, Cb_15_Text,, Cb_15, Text
If(Cb_16=1)
 GuiControlGet, Cb_16_Text,, Cb_16, Text
If(Cb_17=1)
 GuiControlGet, Cb_17_Text,, Cb_17, Text
If(Cb_18=1)
 GuiControlGet, Cb_18_Text,, Cb_18, Text
If(Cb_19=1)
 GuiControlGet, Cb_19_Text,, Cb_19, Text
If(Cb_20=1)
 GuiControlGet, Cb_20_Text,, Cb_20, Text
If(Cb_21=1)
 GuiControlGet, Cb_21_Text,, Cb_21, Text
If(Cb_22=1)
 GuiControlGet, Cb_22_Text,, Cb_22, Text
If(Cb_23=1)
 GuiControlGet, Cb_23_Text,, Cb_23, Text
If(Cb_24=1)
 GuiControlGet, Cb_24_Text,, Cb_24, Text
If(Cb_25=1)
 GuiControlGet, Cb_25_Text,, Cb_25, Text
If(Cb_26=1)
 GuiControlGet, Cb_26_Text,, Cb_26, Text
If(Cb_27=1)
 GuiControlGet, Cb_27_Text,, Cb_27, Text
If(Cb_28=1)
 GuiControlGet, Cb_28_Text,, Cb_28, Text
If(Cb_29=1)
 GuiControlGet, Cb_29_Text,, Cb_29, Text
If(Cb_30=1)
 GuiControlGet, Cb_30_Text,, Cb_30, Text
If(Cb_31=1)
 GuiControlGet, Cb_31_Text,, Cb_31, Text
If(Cb_32=1)
 GuiControlGet, Cb_32_Text,, Cb_32, Text
If(Cb_33=1)
 GuiControlGet, Cb_33_Text,, Cb_33, Text
If(Cb_34=1)
 GuiControlGet, Cb_34_Text,, Cb_34, Text
If(Cb_35=1)
 GuiControlGet, Cb_35_Text,, Cb_35, Text
If(Cb_36=1)
 GuiControlGet, Cb_36_Text,, Cb_36, Text
If(Cb_37=1)
 GuiControlGet, Cb_37_Text,, Cb_37, Text
If(Cb_38=1)
 GuiControlGet, Cb_38_Text,, Cb_38, Text
If(Cb_39=1)
 GuiControlGet, Cb_39_Text,, Cb_39, Text
If(Cb_40=1)
 GuiControlGet, Cb_40_Text,, Cb_40, Text
If(Cb_41=1)
 GuiControlGet, Cb_41_Text,, Cb_41, Text
  
 ;well... that was a cunt to put together... good luck making sense of that
 
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% %Cb_8_Text%%Box5% %Cb_9_Text%%Box6% %Cb_1_Text%%Cb_2_Text%%Cb_3_Text%%Radio_1%%Radio_2%: %Box1% - %Cb_26_Text%%Box7%%Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text%%Cb_10_Text%%Cb_11_Text%%Box3% %Cb_12_Text%%Box4% %Cb_13_Text%%Cb_14_Text%%Cb_15_Text%%Cb_16_Text%%Cb_17_Text%%Cb_18_Text%%Cb_19_Text%%Cb_20_Text%%Cb_21_Text%%Cb_22_Text%%Cb_23_Text%%Cb_24_Text%%Cb_25_Text%%Cb_27_Text%%Cb_28_Text%%Cb_29_Text%%Cb_30_Text%%Cb_31_Text%%Cb_32_Text%%Cb_33_Text%%Cb_34_Text%%Cb_35_Text%%Cb_36_Text%%Cb_37_Text%%Cb_38_Text%%Cb_39_Text%%Cb_40_Text%%Cb_41_Text%- %Box2%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Data Out Loyalty - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
reload
Return

;=====================================================GENERAL WINDOW

Q2:
SupGeneral:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, 25:Destroy
Gui, 7:Destroy
Gui, BC:Destroy
Gui, 67:Destroy
Gui, 21:Destroy
Gui, 12:Destroy
Gui, 13:Destroy
Gui, 78:Destroy

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 2:+ToolWindow -SysMenu +Border
Gui, 2:font, s12 cE8EBF5 bold, Segoe UI
Gui, 2:Color, 1d1f21, 383D46
Gui, 2:Add, Text, center x0 y20 w210 h50, SUPPORT`nSUB-MENU
Gui, 2:font,
Gui, 2:font, cE8EBF5,
Gui, 2:Add, GroupBox, x15 y80 w180 h225 , 

Gui, 2:Add, GroupBox, x15 yp+50 w180 h185 , 
;Gui, 2:Add, Button, yp+40 w150 h30 gDeclinedConnection , &7 Declined Connection
;Gui, 2:Add, GroupBox, x15 yp+55 w180 h85, 
;Gui, 2:Add, Button, yp+40 w150 h30 , &7 Ecom Order
;Gui, 2:Add, Button, yp+40 w150 h30 , &8 Ecom Excel Creation
Gui, 2:Add, Button, yp+75 w150 h30 , CLOSE

Gui, 2:Add, Picture, xp+30 y585 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 2:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

Gui, 30:Destroy
Return

2ButtonCLOSE:
Gui, 2:Destroy
return

logviewer:
If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

run C:\AutoHotKey\Files\Staff Logs.exe
reload
return

SupportQAs:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, 2:Destroy
Gui, 30:Destroy

IfNotExist, C:\AutoHotKey\Files\QAComplete.exe
	{
	FileCreateDir, C:\AutoHotKey\Files\
	FileCopy, G:\Support\Public Staff Folders\Aaron\tools\QAComplete.exe, C:\AutoHotKey\Files\QAComplete.exe,1
	}

Run, C:\AutoHotKey\Files\QAComplete.exe
Reload
return

SupPaths:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, 2:Destroy
Clipboard =
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, Paths:+ToolWindow -SysMenu +Border
Gui, Paths:font, s12 cE8EBF5 bold, Segoe UI
Gui, Paths:Color, 1d1f21, 383D46
Gui, Paths:Add, Text, center x0 y20 w210 h50, COMMON`nPATHS
Gui, Paths:font,
Gui, Paths:font, cE8EBF5,
;Gui, Paths:Add, GroupBox, x15 y80 w180 h185 , 
Gui, Paths:Add, Button, x30 yp+75 w150 h30 gPathsINT, INTPHARM Directory
Gui, Paths:Add, Button, yp+40 w70 h30 gPathsCRON, CRON
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsDISP, DISPX
Gui, Paths:Add, Button, xp-80 yp+40 w70 h30 gPathsHSNET, HSNET
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsPOSX, POSX
Gui, Paths:Add, Button, xp-80 yp+40 w150 h30 gPathsMSOAP, MSOAP
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsMSOAPClient, MINSOAP CLIENT
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsRECron, RESTART CRON
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsREHsnet, RESTART HSNET

;Gui, Paths:Add, Button, yp+40 w150 h30 , &8 Ecom Excel Creation

Gui, Paths:font, s9 cE8EBF5 bold, Segoe UI
Gui, Paths:Add, Text, center x0 yp+50 w210 h50 vPreview,

Gui, Paths:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, Paths:Add, Button, x12 y670 w184 h30 gBackCancel, Close

Gui, Paths:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

loop
{
    Gui, Paths:Submit, NoHide
    msgText = %Clipboard%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, Paths:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
Return

EXIT:
Gui, Destroy
Return

PathsINT:
Clipboard = C:\INTPHARM\
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsCRON:
Clipboard = C:\INTPHARM\CRON\cron.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsDISP:
Clipboard = C:\INTPHARM\DISPX\dispx.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsHSNET:
Clipboard = C:\INTPHARM\HSNET\hsnet.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsPOSX:
Clipboard = C:\INTPHARM\POSX\PRG\posx.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsMSOAP:
Clipboard = C:\INTPHARM\MSOAP\msoap.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsMSOAPClient:
Clipboard = C:\INTPHARM\MSOAP\minsoapclient.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsRECron:
Clipboard = C:\INTPHARM\CRON\restarteverything.bat
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsREHsnet:
Clipboard = C:\INTPHARM\HSNET\restarteverything.bat
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

BackCancel:
Gui, Paths:destroy
Return

SupCancellation:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
Gui, BC:-SysMenu +Border
Gui, BC:font, s16 bold cE8EBF5, Segoe UI
Gui, BC:Color, 1d1f21, 383D46
Gui, BC:Add, Text, x20 y12 , STORE CANCELATION
Gui, BC:font, 
Gui, BC:font, cE8EBF5, Segoe UI
Gui, BC:Add, Checkbox, x18 y65 vIN, Incoming Call
Gui, BC:Add, Checkbox, yp+20 vOUT, Outgoing Call
Gui, BC:Add, Checkbox, yp+20 vEMAIL, Email

Gui, BC:Add, Text, yp+35 h20 w254 vPreviewCODE, 

Gui, BC:Add, Text, yp+30 h15 , STORE ID:
Gui, BC:Add, Text, yp+30 h15 , Name of the person who cancelled
Gui, BC:Add, Text, yp+30 h15 , Role of the person who cancelled

Gui, BC:Add, Edit, xp+190 yp-60 -E0x200 w90 vSCODE ,
Gui, BC:Add, Edit, yp+30 -E0x200 w90 vSpoke ,
Gui, BC:Add, Edit, yp+30 -E0x200 w90 vRole ,

Gui, BC:Add, Checkbox, x320 y95 vAPI, API
Gui, BC:Add, Checkbox, yp+20 vApotex, Apotex
Gui, BC:Add, Checkbox, yp+20 vLoyalty, Loyalty
Gui, BC:Add, Checkbox, yp+20 vPrivate, Private Label
Gui, BC:Add, Checkbox, yp+20 vRanbaxy, Ranbaxy
Gui, BC:Add, Checkbox, yp+20 vSandoz, Sandoz
Gui, BC:Add, Checkbox, yp+20 vSanofi, Sanofi
Gui, BC:Add, Checkbox, yp+20 vStoreIQ, Store IQ

Gui, BC:Add, Text, x18 yp+40 w180 h20, Additional Notes:
Gui, BC:Add, Edit, -E0x200 yp+20 w388 h40 -VScroll vAdditional ,

Gui, BC:Add, GroupBox, yp+50 w265 h120, Preview
Gui, BC:Add, Text, xp+20 yp+20 w215 h90 vPreview, 

Gui, BC:Add, Button, xp+265 yp-13 w100 h30 , Confirm
Gui, BC:Add, Button, yp+41 w100 h30 , Back
Gui, BC:Add, Button, yp+41 w100 h30 , Exit

Gui, BC:Show, %Gui_Cord% , %A_Space%

loop
{
    Gui, BC:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, BC:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	IN := In ? " #IN " : ""
	Out := Out ? "#OUT " : ""
	Email := Email ? "#EMAIL " : ""
	
	API := API ? "#APID " : ""
	Apotex := Apotex ? "#APOD " : ""
	Loyalty := Loyalty ? "#LOYALTY " : ""
	Private := Private ? "#PRIVATE " : ""
	Ranbaxy := Ranbaxy ? "#NAV " : ""
	Sandoz := Sandoz ? "#DI " : ""
	Sanofi := Sanofi ? "#SANCEN " : ""
	StoreIQ := StoreIQ ? "#STOREIQ " : ""
	
    msgText = %Time% - #CANCEL REQUEST •• %IN%%OUT%%EMAIL%•• SPOKE TO: %Spoke% the %role% who requested the cancellation. •• CLIENTS CANCELLED: %API%%APOTEX%%LOYALTY%%PRIVATE%%RANBAXY%%SANDOZ%%SANOFI%%STOREIQ%•• %Additional%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, BC:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

BCButtonExit:
reload
return

BCButtonBack:
	Gui, BC:destroy
	gosub, Q1
return

BCButtonConfirm:
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}


Clipboard = %msgText%

	If clipboard Contains #SANCEN
		{

		#Include csv.ahk

		CSV_Load("G:\Support\Clients\SANOFI\Territory List\sanaccts.csv","A",",")

		TheID = % CSV_MatchCellColumn("A", SCODE, 4, 1)

		TheCol = % CSV_ReadCell("A", TheID, 2)
		TheName = % CSV_ReadCell("A", TheID, 3)
		ThePHCode = % CSV_ReadCell("A", TheID, 1)

		;msgbox % ThePHCode

		Gui, BC:hide
		Gui, A:+AlwaysOnTop
		Gui, A:Margin, 16, 16
		Gui, A:Color, 1d1f21, 383D46
		Gui, A:-SysMenu +Border
		Gui, A:Add, Edit, x-100 y-100 -E0x200 , dummy
		Gui, A:font, cE8EBF5 bold s16, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , SANOFI CANCELATION
		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI

		Gui, A:Add, Text, xm -E0x200 , Please confirm the below information is correct.`nMake any changes required.
		
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , Store Name:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vStoreName, %TheCol%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , PH Code:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vThePHCode, %ThePHCode%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , Rep Name:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vTheName, %TheName%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		

		Gui, A:Add, Button, xm w120 h30 gSanCancConf , CONFIRM
		Gui, A:Add, Button, x+10 w120 h30 gBackCancel, BACK
		Gui, A:Add, Button, x15 y+10 w250 h30 gEXIT, EXIT
		Gui, A:Show, , %A_Space%
		return

		SanCancConf:
		Gui, A:Submit
		;#Include csv.ahk

		;CSV_Load("G:\Support\Clients\SANOFI\Territory List\sanaccts.csv","A",",")

		;TheCol = % CSV_MatchCellColumn("A", StoreName, 2, 1)

		;TheName = % CSV_ReadCell("A", TheCol, 3)

		;ThePHCode = % CSV_ReadCell("A", TheCol, 1)

		IfEqual, TheName, Cristina Lo Giudice
			{
				TheName = Cristina LoGiudice
			}

		StringReplace, TheEmail, TheName, %A_Space%, ., All

		;MsgBox % TheName "`n" TheEmail "@sanofi.com.au"

		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := TheEmail "@sanofi.com"
		email.Cc := "support@intellipharm.com.au"
		email.Subject := "Sanofi Cancellation - " ThePHCode " - " StoreName
		email.Body := "Hi " TheName ",`n`nThis email is to advise you that " ThePHCode " " StoreName " has requested the Sanofi reporting service be cancelled for their store.`n`nTo reinstate the reporting service for this store, please arrange for the store to complete a new signup via Sanofi Central.`n`n"
		email.Display

		gosub continuecancel
		return
		}

continuecancel:
Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Cancellation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
reload
return

;=====================================================REMOTE RESET

RemoteReset:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

;Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, RR:Color, 1d1f21, 383D46
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
Gui, RR:Add, Text, xp+10 yp+20 w164 h70 vPreview, 

Gui, RR:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, RR:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, RR:Add, Button, x12 y670 w184 h30 , &Close

Gui, RR:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

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

;=====================================================VOICEMAIL

2Button8EcomExcelCreation:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 78:font, s12 bold, Segoe UI
Gui, 78:Add, Text, x18 y24, Ecom Order Acknowledgments
Gui, 78:font,
Gui, 78:Add, Text, x18 y54, Enter the list of orders here
Gui, 78:Add, Edit, x18 y74 w250 h325 vBox1,
Gui, 78:Add, Button, x18 y418 w250 h30 , &Confirm
Gui, 78:Add, Button, x18 y458 w120 h30 , &Back
Gui, 78:Add, Button, x148 y458 w120 h30 , &Exit
Gui, 78:Show, %Gui_Cord% w286 h502, 
return

78ButtonExit:
	reload
return

78ButtonBack:
	Gui, 78:Destroy
	gosub Q7
return

78ButtonConfirm:

IfNotExist, C:\AutoHotKey\Files\Template ECOMM order acknowledgement.xlsx
{
FileCopy, G:\Support\Clients\CHEMMART\ECOMMERCE\Orders pending acknowledgement\Template ECOMM order acknowledgement.xltx, C:\AutoHotKey\Files\Template ECOMM order acknowledgement.xltx
}
	Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Ecom Excel Creation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

sleep 1000
Run, C:\AutoHotKey\Files\Template ECOMM order acknowledgement.xltx
gosub ExcelCheck2
WinWaitClose, ahk_class AutoHotkeyGUI
Clipboard = %Box1%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

i:= ; make sure `i` is empty, we use it to count columns/cells 
Loop, parse, clipboard,`n, `r, ; loop through clipboard with each line being separate item
{
    i++ ; add 1 to our i 
    if (i=1) ; means it's first line from your set of 3 - meaning it's first column
        SendInput % A_LoopField "{TAB}" ; so just send the line since you didn't wanted to alter it
    else if (i=2) ; means it's second line, with the order number
        SendInput % SubStr(A_LoopField, RegExMatch(A_LoopField, "\d")) "{TAB}" ; find first number in line and return rest of string starting from its position
    else if (i=3) { ; third item, date 
        SendInput % SubStr(A_LoopField, RegExMatch(A_LoopField, "\d"))  "{ENTER}" ; find first number in line and return rest of string starting from its position
        i:=0 ; reset `i` to 0 since it was our 3rd and last item
    }
} 
return

ExcelCheck2:
Gui, Destroy
Gui, 32:font, s8, Segoe UI
Gui, 32:Add, Text, x18 y22 h15, PLEASE CLICK ENABLE EDITING IF REQUIRED
Gui, 32:Add, Text, x18, NOW SELECT CELL "A1"
Gui, 32:Add, Picture, x18 y75 w288 h40 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\ecomexcel.png
Gui, 32:Add, Text, x18, `nAFTER SELECTING "A1", CLICK CONFIRM, THEN WAIT
Gui, 32:Add, Button, x115 y178 w90 h30, Confirm
Gui, 32:Add, Button, x220 y178 w90 h30, Exit
Gui, 32:Show, h220 w325, FRED Excel
return

;=====================================================END VOICEMAIL

;=====================================================GENERAL ALL TAGS

SupADMIN:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\AutoHotKey\Files\all_tag_6.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png
}

Loop,
 {
  FileReadLine, AID%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AIT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Gui, Destroy

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74:-SysMenu +Border
Gui, 74:Color, 1d1f21, 383D46
Gui, 74:Add, Picture, x375 y174 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 74:Add, Text, x18 y18 , CONTACT INITIATION
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x18 y45 vCb_1, #IN%A_Space%
Gui, 74:Add, Checkbox, x18 y65 vCb_2, #OUT%A_Space%
Gui, 74:Add, Checkbox, x18 y85 vCb_3, #EMAIL%A_Space%
Gui, 74:Add, Text, x118 y45 w150 h50 , Incoming Call	
Gui, 74:Add, Text, x118 y65 w150 h50 , Outgoing Call
Gui, 74:Add, Text, x118 y85 w150 h50 , Email contact
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x306 y18, INSTALL RELATED
Gui, 74:font, s8 bold, Segoe UI
Gui, 74:Add, Checkbox, x306 y45 vCb_4, %AinT1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x306 y65 vCb_5, %AinT2%
Gui, 74:Add, Checkbox, x306 y85 vCb_6, %AinT3%
Gui, 74:Add, Checkbox, x306 y105 vCb_7, %AinT4%
Gui, 74:Add, Checkbox, x306 y125 vCb_8, %AinT5%
Gui, 74:Add, Checkbox, x306 y145 vCb_9, %AinT6%
Gui, 74:font, s8 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y45, %AinD1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y65, %AinD2%
Gui, 74:Add, Text, x406 y85, %AinD3%
Gui, 74:Add, Text, x406 y105, %AinD4%
Gui, 74:Add, Text, x406 y125, %AinD5%
Gui, 74:Add, Text, x406 y145, %AinD6%
Gui, 74:Add, Text, x18 y110 h15, CONTACT NAME:
Gui, 74:font, s10 cE8EBF5 bold, Segoe UI
Gui, 74:Add, Text, x18 y130 h15, S I T E   C O D E :
Gui, 74:Add, Text, yp+30 h20 w254 vPreviewCODE, 
Gui, 74:font, 
Gui, 74:font, s8 cE8EBF5
Gui, 74:Add, Edit, x152 y104 w120 h20 -E0x200 vBox1GF, 
Gui, 74:Add, Edit, x152 y129 w120 h20 -E0x200 vSCODE, 
Gui, 74:Add, Text, x18 y192 h15, Notes section:
Gui, 74:Add, Edit, x17 y207 w254 h70 -E0x200 -VScroll vBox2GF, 
Gui, 74:font, s8 , Segoe UI
Gui, 74:Add, GroupBox, x18 y290 h150 w255 , Preview
Gui, 74:Add, Text, x30 y310 h118 w238 vPreviewALL, 
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x586 y18, ISSUES
Gui, 74:font, s8 bold cE8EBF5, Segoe UI

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 74:Add, Button, x686 y18 w80 h20 gADMINedit, EDIT
	}
If Dog = Aaron
	{
	Gui, 74:Add, Button, x686 y18 w80 h20 gADMINedit, EDIT
	}

Gui, 74:Add, Checkbox, x586 y45 vCb_10, %AIT1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x586 y65 vCb_11, %AIT2%
Gui, 74:Add, Checkbox, x586 y85 vCb_12, %AIT3%
Gui, 74:Add, Checkbox, x586 y105 vCb_13, %AIT4%
Gui, 74:Add, Checkbox, x586 y125 vCb_40, %AIT5%
Gui, 74:Add, Checkbox, x586 y145 vCb_14, %AIT6%
Gui, 74:Add, Checkbox, x586 y165 vCb_15, %AIT7%
Gui, 74:Add, Checkbox, x586 y185 vCb_16, %AIT8%
Gui, 74:Add, Checkbox, x586 y205 vCb_17, %AIT9%
Gui, 74:Add, Checkbox, x586 y225 vCb_18, %AIT10%
Gui, 74:Add, Checkbox, x586 y245 vCb_19, %AIT11%
Gui, 74:Add, Checkbox, x586 y265 vCb_20, %AIT12%
Gui, 74:Add, Checkbox, x586 y285 vCb_21, %AIT13%
Gui, 74:Add, Checkbox, x586 y305 vCb_22, %AIT14%
Gui, 74:Add, Checkbox, x586 y325 vCb_41, %AIT15%
Gui, 74:Add, Checkbox, x586 y345 vCb_42, %AIT16%
Gui, 74:Add, Checkbox, x586 y365 vCb_23, %AIT17%
Gui, 74:Add, Checkbox, x586 y385 vCb_24, %AIT18%
Gui, 74:Add, Checkbox, x586 y405 vCb_25, %AIT19%
Gui, 74:Add, Checkbox, x586 y425 vCb_26, %AIT20%
Gui, 74:Add, Checkbox, x586 y445 vCb_27, %AIT21%
Gui, 74:Add, Checkbox, x586 y465 vCb_28, %AIT22%
Gui, 74:Add, Checkbox, x586 y485 vCb_38, %AIT23%
Gui, 74:font, s8 bold cE8EBF5 , Segoe UI
Gui, 74:Add, Text, x686 y45, %AID1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, x686 y65, %AID2%
Gui, 74:Add, Text, x686 y85, %AID3%
Gui, 74:Add, Text, x686 y105, %AID4%
Gui, 74:Add, Text, x686 y125, %AID5%
Gui, 74:Add, Text, x686 y145, %AID6%
Gui, 74:Add, Text, x686 y165, %AID7%
Gui, 74:Add, Text, x686 y185, %AID8%
Gui, 74:Add, Text, x686 y205, %AID9%
Gui, 74:Add, Text, x686 y225, %AID10%
Gui, 74:Add, Text, x686 y245, %AID11%
Gui, 74:Add, Text, x686 y265, %AID12%
Gui, 74:Add, Text, x686 y285, %AID13%
Gui, 74:Add, Text, x686 y305, %AID14%
Gui, 74:Add, Text, x686 y325, %AID15%
Gui, 74:Add, Text, x686 y345, %AID16%
Gui, 74:Add, Text, x686 y365, %AID17%
Gui, 74:Add, Text, x686 y385, %AID18%
Gui, 74:Add, Text, x686 y405, %AID19%
Gui, 74:Add, Text, x686 y425, %AID20%
Gui, 74:Add, Text, x686 y445, %AID21%
Gui, 74:Add, Text, x686 y465, %AID22%
Gui, 74:Add, Text, x686 y485, %AID23%
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x306 y278 , PRODUCTS
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y280 , (optional)
Gui, 74:Add, Checkbox, x306 y305 vCb_29, %APT1%
Gui, 74:Add, Checkbox, x306 y325 vCb_30, %APT2%
Gui, 74:Add, Checkbox, x306 y345 vCb_31, %APT3%
Gui, 74:Add, Checkbox, x306 y365 vCb_32, %APT4%
Gui, 74:Add, Checkbox, x306 y385 vCb_33, %APT5%
Gui, 74:Add, Checkbox, x306 y405 vCb_34, %APT6%
Gui, 74:Add, Checkbox, x306 y425 vCb_35, %APT7%
Gui, 74:Add, Checkbox, x306 y445 vCb_36, %APT8%
Gui, 74:Add, Checkbox, x306 y465 vCb_37, %APT9%
Gui, 74:Add, Checkbox, x306 y485 vCb_39, %APT10%
Gui, 74:Add, Text, x406 y305 -E0x200, %APD1%
Gui, 74:Add, Text, x406 y325 -E0x200, %APD2%
Gui, 74:Add, Text, x406 y345 -E0x200, %APD3%
Gui, 74:Add, Text, x406 y365 -E0x200, %APD4%
Gui, 74:Add, Text, x406 y385 -E0x200, %APD5%
Gui, 74:Add, Text, x406 y405 -E0x200, %APD6%
Gui, 74:Add, Text, x406 y425 -E0x200, %APD7%
Gui, 74:Add, Text, x406 y445 -E0x200, %APD8%
Gui, 74:Add, Text, x406 y465 -E0x200, %APD9%
Gui, 74:Add, Text, x406 y485 -E0x200, %APD10%
Gui, 74:Add, Button, x18 y468 w80 h30 -E0x200, Confirm
Gui, 74:Add, Button, x105 y468 w80 h30 -E0x200, Back
Gui, 74:Add, Button, x192 y468 w80 h30 -E0x200, Exit

Gui, 74:font,
Gui, 74:font, s6 cE8EBF5, Segoe UI
;Gui, 74:Add, Button, x18 y447 w80 h15 , Repeat

Gui, 74:Show, %Gui_Cord% w910 h512,%A_space%
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 74:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 74:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    Cb_1_Text := Cb_1 ? "- #IN " : ""
	Cb_2_Text := Cb_2 ? "- #OUT " : ""
	Cb_3_Text := Cb_3 ? "- #EMAIL " : ""
	Cb_4_Text := Cb_4 ? "#INSTALL" : ""
	Cb_5_Text := Cb_5 ? "#DISPXIN " : ""
	Cb_6_Text := Cb_6 ? "#POSXIN " : ""
	Cb_7_Text := Cb_7 ? "#QA " : ""
    Cb_8_Text := Cb_8 ? "#QACOMP " : ""
	Cb_9_Text := Cb_9 ? "#CANCEL " : ""
	Cb_10_Text := Cb_10 ? "#DATAOUT " : ""
	Cb_11_Text := Cb_11 ? AIT2 : ""
	Cb_12_Text := Cb_12 ? AIT3 : ""
	Cb_13_Text := Cb_13 ? AIT4 : ""
	Cb_14_Text := Cb_14 ? AIT6 : ""
	Cb_15_Text := Cb_15 ? AIT7 : ""
	Cb_16_Text := Cb_16 ? AIT8 : ""
	Cb_17_Text := Cb_17 ? AIT9 : ""
	Cb_18_Text := Cb_18 ? AIT10 : ""
	Cb_19_Text := Cb_19 ? AIT11 : ""
	Cb_20_Text := Cb_20 ? AIT12 : ""
	Cb_21_Text := Cb_21 ? AIT13 : ""
	Cb_22_Text := Cb_22 ? AIT14 : ""
	Cb_23_Text := Cb_23 ? AIT17 : ""
	Cb_24_Text := Cb_24 ? AIT18 : ""
	Cb_25_Text := Cb_25 ? AIT19 : ""
	Cb_26_Text := Cb_26 ? AIT20 : ""
	Cb_27_Text := Cb_27 ? AIT21 : ""
	Cb_28_Text := Cb_28 ? AIT22 : ""
	Cb_29_Text := Cb_29 ? APT1 : ""
	Cb_30_Text := Cb_30 ? APT2 : ""
	Cb_31_Text := Cb_31 ? APT3 : ""
	Cb_32_Text := Cb_32 ? APT4 : ""
	Cb_33_Text := Cb_33 ? APT5 : ""
	Cb_34_Text := Cb_34 ? APT6 : ""
	Cb_35_Text := Cb_35 ? APT7 : ""
	Cb_36_Text := Cb_36 ? APT8 : ""
	Cb_37_Text := Cb_37 ? APT9 : ""
	Cb_38_Text := Cb_38 ? AIT23 : ""
	Cb_39_Text := Cb_39 ? APT10 : ""
	Cb_40_Text := Cb_40 ? AIT5 : ""
	Cb_41_Text := Cb_41 ? AIT15 : ""
	Cb_42_Text := Cb_42 ? AIT16 : ""

	ConN := ConN ? " - Contact Name:" : ""

	Box1GF := Box1GF ? " Spoke to: " Box1GF " " : ""

	msgText = % Time " #ATG " Box1GF Cb_1_Text Cb_2_Text Cb_3_Text Cb_4_Text Cb_5_Text Cb_6_Text Cb_7_Text Cb_8_Text Cb_9_Text Cb_10_Text Cb_11_Text Cb_12_Text Cb_13_Text Cb_14_Text Cb_15_Text Cb_16_Text Cb_17_Text Cb_18_Text Cb_19_Text Cb_20_Text Cb_21_Text Cb_22_Text Cb_23_Text Cb_24_Text Cb_25_Text Cb_26_Text Cb_27_Text Cb_28_Text Cb_29_Text Cb_30_Text Cb_31_Text Cb_32_Text Cb_33_Text Cb_34_Text Cb_35_Text Cb_36_Text Cb_37_Text Cb_38_Text Cb_39_Text Cb_40_Text Cb_41_Text Cb_42_Text " •• " Box2GF

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 74:Text, PreviewALL, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}



Return

74ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

74Buttonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

74ButtonConfirm:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - General Full Tags`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt	
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

reload
Return


ADMINedit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy

Loop,
 {
  FileReadLine, AID%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AIT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74EDIT:-SysMenu +Border
Gui, 74EDIT:Color, 1d1f21, 383D46


Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x18 y18, INSTALL RELATED
Gui, 74EDIT:font, s8 bold, Segoe UI
Gui, 74EDIT:Add, Checkbox, x18 y45 , %AinT1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN1, %AinT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN2, %AinT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN3, %AinT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN4, %AinT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN5, %AinT6%
Gui, 74EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x118 y45, %AinD1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd1, %AinD2%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd2, %AinD3%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd3, %AinD4%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd4, %AinD5%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd5, %AinD6%
Gui, 74EDIT:font, 

Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x318 y18, ISSUES
Gui, 74EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Checkbox, x318 y45 , %AIT1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI1, %AIT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI2, %AIT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI3, %AIT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI4, %AIT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI5, %AIT6%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI6, %AIT7%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI7, %AIT8%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI8, %AIT9%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI9, %AIT10%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI10, %AIT11%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI11, %AIT12%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI12, %AIT13%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI13, %AIT14%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI14, %AIT15%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI15, %AIT16%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI16, %AIT17%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI17, %AIT18%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI18, %AIT19%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI19, %AIT20%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI20, %AIT21%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI21, %AIT22%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI22, %AIT23%
Gui, 74EDIT:font, s8 bold cE8EBF5 , Segoe UI
Gui, 74EDIT:Add, Text, x418 y45, %AID1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID1, %AID2%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID2, %AID3%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID3, %AID4%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID4, %AID5%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID5, %AID6%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID6, %AID7%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID7, %AID8%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID8, %AID9%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID9, %AID10%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID10, %AID11%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID11, %AID12%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID12, %AID13%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID13, %AID14%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID14, %AID15%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID15, %AID16%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID16, %AID17%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID17, %AID18%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID18, %AID19%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID19, %AID20%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID20, %AID21%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID21, %AID22%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID22, %AID23%

Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x18 y278 , PRODUCTS
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x118 y280 , (optional)
Gui, 74EDIT:Add, edit, x18 y305 w98 -E0x200 , %APT1%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP1, %APT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP2, %APT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP3, %APT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP4, %APT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP5, %APT6%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP6, %APT7%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP7, %APT8%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP8, %APT9%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP9, %APT10%
Gui, 74EDIT:Add, edit, x118 y305 w190 -E0x200, %APD1%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD1, %APD2%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD2, %APD3%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD3, %APD4%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD4, %APD5%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD5, %APD6%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD6, %APD7%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD7, %APD8%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD8, %APD9%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD9, %APD10%

Gui, 74EDIT:Add, Button, x418 y18 w80 h20 gADMINsave, SAVE
Gui, 74EDIT:Add, Button, x588 y18 w80 h20 gADMINexit, EXIT

Gui, 74EDIT:Add, Button, x18 y180 w80 h20 gOPENadminINSTALLt, OPEN
Gui, 74EDIT:Add, Button, x18 y520 w80 h20 gOPENadminPRODUCTSt, OPEN
Gui, 74EDIT:Add, Button, x318 y520 w80 h20 gOPENadminISSUESt, OPEN

Gui, 74EDIT:Add, Button, x118 y180 w80 h20 gOPENadminINSTALLd, OPEN
Gui, 74EDIT:Add, Button, x118 y520 w80 h20 gOPENadminPRODUCTSd, OPEN
Gui, 74EDIT:Add, Button, x418 y520 w80 h20 gOPENadminISSUESd, OPEN

Gui, 74EDIT:Add, Text, x18 y213 h20, Open text files directly.

Gui, 74EDIT:font,
Gui, 74EDIT:font, s6 cE8EBF5, Segoe UI
;Gui, 74EDIT:Add, Button, x18 y447 w80 h15 , Repeat

Gui, 74EDIT:Show, %Gui_Cord% ,%A_space%
return

ADMINexit:
reload
return

ADMINsave:
Gui, 74EDIT:Submit
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt

FileAppend, 
(
#INSTALL
%IN1%
%IN2%
%IN3%
%IN4%
%IN5%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt

FileAppend,
(
%P1%
%P2%
%P3%
%P4%
%P5%
%P6%
%P7%
%P8%
%P9%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt

FileAppend,
(
#DATA
%I1%
%I2%
%I3%
%I4%
%I5%
%I6%
%I7%
%I8%
%I9%
%I10%
%I11%
%I12%
%I13%
%I14%
%I15%
%I16%
%I17%
%I18%
%I19%
%I20%
%I21%
%I22%
%I23%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt

FileAppend,
(
Software installation
%INd1%
%INd2%
%INd3%
%INd4%
%INd5%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt

FileAppend,
(
%PD1%
%PD2%
%PD3%
%PD4%
%PD5%
%PD6%
%PD7%
%PD8%
%PD9%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt

FileAppend,
(
Use this tag for all data issues
%ID1%
%ID2%
%ID3%
%ID4%
%ID5%
%ID6%
%ID7%
%ID8%
%ID9%
%ID10%
%ID11%
%ID12%
%ID13%
%ID14%
%ID15%
%ID16%
%ID17%
%ID18%
%ID19%
%ID20%
%ID21%
%ID22%
%ID23%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt

Msgbox, 0, UPDATE TAGS, Update Complete

RELOAD
return

OPENadminINSTALLt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt
return

OPENadminPRODUCTSt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt
return

OPENadminISSUESt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt
return

OPENadminINSTALLd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt
return

OPENadminPRODUCTSd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt
return

OPENadminISSUESd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt
return



;=====================================================END GENERAL ALL TAGS

;=====================================================LOYALTY ALL TAGS

LoyADMIN:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

;IfNotExist, C:\AutoHotKey\Files\all_tag_6.png
;{
;	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png
;}

Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, LoyAdmin:-SysMenu +Border
Gui, LoyAdmin:Color, 1d1f21, 383D46
;Gui, LoyAdmin:Add, Picture, x375 y174 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png
Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,

Gui, LoyAdmin:Add, Text, x18 y18 , CONTACT INITIATION
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x18 y45 vIN, #IN
Gui, LoyAdmin:Add, Checkbox, yp+20 vOUT, #OUT
Gui, LoyAdmin:Add, Checkbox, yp+20 vEMAIL, #EMAIL
Gui, LoyAdmin:Add, Text, x151 y45 w150 h50 , Incoming Call	
Gui, LoyAdmin:Add, Text, yp+20 w150 h50 , Outgoing Call
Gui, LoyAdmin:Add, Text, yp+20 w150 h50 , Email contact

Gui, LoyAdmin:Add, Text, x18 y110 h15, CONTACT NAME:
Gui, LoyAdmin:font, s10 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x18 y130 h15, S I T E   C O D E :
Gui, LoyAdmin:Add, Text, yp+30 h20 w254 vPreviewCODE, 
Gui, LoyAdmin:font, 
Gui, LoyAdmin:font, s8 cE8EBF5
Gui, LoyAdmin:Add, Edit, x152 y104 w120 h20 -E0x200 vConName, 
Gui, LoyAdmin:Add, Edit, x152 y129 w120 h20 -E0x200 vSCODE, 
Gui, LoyAdmin:Add, Text, x18 y192 h15, Notes section:
Gui, LoyAdmin:Add, Edit, x17 y207 w254 h70 -E0x200 -VScroll vNotes, 
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, GroupBox, x18 y290 h240 w255 , Preview
Gui, LoyAdmin:Add, Text, x30 y310 h208 w238 vPreviewALL, 
Gui, LoyAdmin:font,

Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y18, INSTALL RELATED
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y45 , #APPOINTMENT
Gui, LoyAdmin:Add, Text, yp+20 , #TRAINED 
Gui, LoyAdmin:Add, Checkbox, yp+20 vLegacyDB, #LEGACYDB
Gui, LoyAdmin:Add, Checkbox, yp+20 vLoyAdmin, #LOYADMIN
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y45 w120 h16 vAppointment, 
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y65 w120 h16 vTrained,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x416 y85, Import/export legacy database
Gui, LoyAdmin:Add, Text, x416 y105, Pre-install, general admin etc.


Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y135 , PRODUCTS
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y160 vLoyV2, #LOYV2
Gui, LoyAdmin:Add, Checkbox, checked x306 y180 vLoyV3 , #LOYV3
Gui, LoyAdmin:Add, Text, x416 y160, Loyalty Version 2
Gui, LoyAdmin:Add, Text, x416 y180, Loyalty Version 3


Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y215 , MINFOS
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y240 vMINFd, #MINFDIRECT
Gui, LoyAdmin:Add, Checkbox, x306 y260 vMINFb, #MINFBOUNCE
Gui, LoyAdmin:Add, Text, x416 y240, Told customer to call Minfos
Gui, LoyAdmin:Add, Text, x416 y260, Minfos told customer to call us

Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y295, ISSUES
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y320 vIssue1 , #ICL
Gui, LoyAdmin:Add, Checkbox, x306 y340 vIssue2 , #LOYOUTAGE
Gui, LoyAdmin:Add, Checkbox, x306 y360 vIssue3 , #OTHER
Gui, LoyAdmin:Add, Checkbox, x306 y380 vIssue4 , #PINS
Gui, LoyAdmin:Add, Checkbox, x306 y400 vIssue5 , #PL
Gui, LoyAdmin:Add, Checkbox, x306 y420 vIssue6 , #POINTEXCL
Gui, LoyAdmin:Add, Checkbox, x306 y440 vIssue7 , #POINTSINV
Gui, LoyAdmin:Add, Checkbox, x306 y460 vIssue8 , #PRINTERS
Gui, LoyAdmin:Add, Checkbox, x306 y480 vIssue9 , #REDEMP
Gui, LoyAdmin:Add, Checkbox, x306 y500 vIssue10 , #REMAP
Gui, LoyAdmin:Add, Checkbox, x306 y520 vIssue11 , #REPORTS
Gui, LoyAdmin:Add, Text, x306 y540 , #RETRAINED
Gui, LoyAdmin:Add, Checkbox, x306 y560 vIssue13 , #WIN10
Gui, LoyAdmin:Add, Text, x416 y320, Store has difficulties logging in
Gui, LoyAdmin:Add, Text, x416 y340, Intpharm-side service outage
Gui, LoyAdmin:Add, Text, x416 y360, Unrelated to other tags 
Gui, LoyAdmin:Add, Text, x416 y380, Loyalty PINs
Gui, LoyAdmin:Add, Text, x416 y400, Prompter/Balance Checker/Till 
Gui, LoyAdmin:Add, Text, x416 y420, Settings rules (Points + Exclusions)
Gui, LoyAdmin:Add, Text, x416 y440, Points investigation
Gui, LoyAdmin:Add, Text, x416 y460, Printer issues
Gui, LoyAdmin:Add, Text, x416 y480, Loyalty Redemptions
Gui, LoyAdmin:Add, Text, x416 y500, Running Remap resolved issue
Gui, LoyAdmin:Add, Text, x416 y520, Loyalty Reports 
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y540 w120 h16 vRetrain,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x416 y560, Upgraded to Windows 10


Gui, LoyAdmin:font, s12 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x620 y18, NEW STORE -
Gui, LoyAdmin:Add, Checkbox, x735 y18 vNewStore , 
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x620 y45 vNS1 , Store record created
Gui, LoyAdmin:Add, Checkbox, x620 y65 vNS2 , UI features updated (CM and Choice)
Gui, LoyAdmin:Add, Checkbox, x620 y85 vNS3 , Welcome && Birthday Emails (Choice)
Gui, LoyAdmin:Add, Checkbox, x620 y105 vNS4 , Credentials added to Wiki 
Gui, LoyAdmin:Add, Checkbox, x620 y125 vNS5 , POSX installed and up-to-date
Gui, LoyAdmin:Add, Checkbox, x620 y145 vNS6 , Waiting on Fred Credentials
Gui, LoyAdmin:Add, Checkbox, x620 y165 vNS7 , Stock Imported

Gui, LoyAdmin:font, s12 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x620 y210, POS CHANGE - 
Gui, LoyAdmin:Add, Checkbox, x745 y210 vPOSChange , 
Gui, LoyAdmin:font,  
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Edit, -E0x200 x716 y240 w100 h16 vOldID ,
Gui, LoyAdmin:Add, Text, x620 y240 vOID , Old Store ID:
Gui, LoyAdmin:Add, Checkbox, x620 y260 vPC1, Name and Sitecode olded
Gui, LoyAdmin:Add, Checkbox, x620 y280 vPC2, Passwords changed
Gui, LoyAdmin:Add, Checkbox, x620 y300 vPC3, Removed email from web account
Gui, LoyAdmin:Add, Checkbox, x620 y320 vPC4, New record created
Gui, LoyAdmin:Add, Checkbox, x620 y340 vPC5, UI features updated
Gui, LoyAdmin:Add, Checkbox, x620 y360 vPC6, Wiki credentials updated

Gui, LoyAdmin:Add, Text, x620 y400 vNID , New Store ID:
Gui, LoyAdmin:Add, Edit, -E0x200 x716 y400 w100 h16 vNewID,
Gui, LoyAdmin:Add, Checkbox, x620 y420 vPC7, Requested dev update import record
Gui, LoyAdmin:Add, Checkbox, x620 y440 vPC8, Import record updated
Gui, LoyAdmin:Add, Checkbox, x620 y460 vPC9, Waiting for Site Reset
Gui, LoyAdmin:Add, Checkbox, x620 y480 vPC10, Site Reset Complete
Gui, LoyAdmin:Add, Checkbox, x620 y500 vPC11, Stock Imported
Gui, LoyAdmin:Add, Checkbox, x620 y520 vPC12, Members moved to new store

Gui, LoyAdmin:Add, Button, x18 y545 w80 h30 , Confirm
Gui, LoyAdmin:Add, Button, x105 y545 w80 h30 , Back
Gui, LoyAdmin:Add, Button, x192 y545 w80 h30 , Exit

Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s6 cE8EBF5, Segoe UI
;Gui, LoyAdmin:Add, Button, x18 y447 w80 h15 , Repeat

Gui, LoyAdmin:Show, %Gui_Cord% w840 h590, %A_Space%
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, LoyAdmin:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, LoyAdmin:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    IN 				:= IN ? " #IN" : ""
	OUT 			:= OUT ? " #OUT" : ""
	EMAIL 			:= EMAIL ? " #EMAIL" : ""
	ConN 			:= ConN ? " •• Contact Name: " : ""
	LoyAdmin 		:= LoyAdmin ? " #LOYADMIN" : ""
	LegacyDB 		:= LegacyDB ? " #LEGACYDB" : ""
	Appointment 	:= Appointment ? " [ #APPOINTMENT: " Appointment " ]" : ""
	Trained 		:= Trained ? " [ #TRAINED: " Trained " ]" : ""

	LoyV2 			:= LoyV2 ? " #LOYV2" : ""
	LoyV3 			:= LoyV3 ? " #LOYV3" : ""
	MinfD 			:= MinD ? " #MINFDIRECT" : ""
	MinfB 			:= MinfB ? " #MINFBOUNCE" : ""

	Issue1 			:= Issue1 ? " #ICL" : ""
	Issue2 			:= Issue2 ? " #LOYOUTAGE" : ""
	Issue3 			:= Issue3 ? " #OTHER" : ""
	Issue4 			:= Issue4 ? " #PINS" : ""
	Issue5 			:= Issue5 ? " #PL" : ""
	Issue6 			:= Issue6 ? " #POINTEXCL" : ""
	Issue7 			:= Issue7 ? " #POINTSINV" : ""
	Issue8 			:= Issue8 ? " #PRINTERS" : ""
	Issue9 			:= Issue9 ? " #REDEMP" : ""
	Issue10 		:= Issue10 ? " #REMAP" : ""
	Issue11 		:= Issue11 ? " #REPORTS" : ""
	Retrain 		:= Retrain ? " [ #RETRAINED: " Retrain " ] " : ""
	Issue13 		:= Issue13 ? "#WIN10 " : ""

	NewStoreOpen 	:= NewStore ? "[ NEW STORE: " : ""
	NewStoreClose 	:= NewStore ? " ] " : ""
	NS1 			:= NS1 ? "Store record created • " : ""
	NS2 			:= NS2 ? "UI features updated (CM and Choice) • " : ""
	NS3 			:= NS3 ? "Welcome & Birthday Emails (Choice) • " : ""
	NS4 			:= NS4 ? "Credentials added to Wiki • " : ""
	NS5 			:= NS5 ? "POSX installed and up-to-date • " : ""
	NS6 			:= NS6 ? "Waiting on Fred credentials • " : ""
	NS7 			:= NS7 ? "Stock imported" : ""

	POSChangeOpen 	:= POSChange ? "[ POS CHANGE: " : ""
	POSChangeClose 	:= POSChange ? " ] " : ""

	OldID			:= OldID ? " (Old ID: " OldID ") " : ""

	PC1				:= PC1 ? "Name and Sitecode olded • " : ""
	PC2				:= PC2 ? "Passwords changed • " : ""
	PC3				:= PC3 ? "Removed email from web account • " : ""
	PC4				:= PC4 ? "New record created • " : ""
	PC5				:= PC5 ? "UI features updated • " : ""
	PC6				:= PC6 ? "Wiki credentials updated" : ""

	NewID			:= NewID ? " (New ID: " NewID ") " : ""

	PC7				:= PC7 ? "Requested dev update import record • " : ""
	PC8				:= PC8 ? "Import record updated • " : ""
	PC9				:= PC9 ? "Waiting for Site Reset • " : ""
	PC10			:= PC10 ? "Site Reset complete • " : ""
	PC11			:= PC11 ? "Stock imported • " : ""
	PC12			:= PC12 ? "Members moved to new store" : ""

	ConName := ConName ? " Spoke to: " ConName " " : ""


    msgText = % Time " - " IN OUT EMAIL LoyV2 LoyV3 LoyAdmin LegacyDB ConName Appointment Trained MinfD MinfB Issue1 Issue2 Issue3 Issue4 Issue5 Issue6 Issue7 Issue8 Issue9 Issue10 Issue11 Retrain Issue13 NewStoreOpen NS1 NS2 NS3 NS4 NS5 NS6 NS7 NewStoreClose POSChangeOpen OldID PC1 PC2 PC3 PC4 PC5 PC6 NewID PC7 PC8 PC9 PC10 PC11 PC12 POSChangeClose " •• " Notes

    if NOT (msgText == oldMsgText)
    {
       GuiControl, LoyAdmin:Text, PreviewALL, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

Return

LoyAdminButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

LoyAdminButtonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LoyAdmin:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

LoyAdminButtonConfirm:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loy Admin`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt	
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

reload
Return
;=====================================================END LOYALTY GENERAL ALL TAGS

;=====================================================VOICEMAIL

PhoneRangOut:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

list1 = Voicemail|Rang out|Failed to establish call
list2 = #INSTALL|#DATAOUT

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 67:-SysMenu +Border
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

Gui, 67:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 67:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, 67:Add, Button, x12 y670 w184 h30 , &Close

Gui, 67:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%
return

67ButtonClose:
	Gui, 67:Destroy
return

67ButtonBack:
	Gui, 67:Destroy
	gosub Q2
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

;=====================================================END VOICEMAIL

QAPass:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, QAP:Color, 1d1f21, 383D46
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
Gui, QAP:Add, Text, xp+10 yp+20 w162 h70 vPreview, 

Gui, QAP:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, QAP:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, QAP:Add, Button, x12 y670 w184 h30 , &Close

Gui, QAP:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

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


QAPButtonBack:
Gui, QAP: Destroy
gosub Q2
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

;=====================================================KNOCKBACK

DeclinedConnection:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

list1 = #DATAOUT|#INSTALL

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, 21:Color, 1d1f21, 383D46
Gui, 21:font, s12 bold cE8EBF5, Segoe UI
Gui, 21:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 21:Add, Text, Center x0 y24 w210, KNOCKBACK
Gui, 21:font,
Gui, 21:font, cE8EBF5, Segeo UI
Gui, 21:Add, Text, x28 y82 h30, Reason `nfor the call:
Gui, 21:Add, Radio, x100 y73 h20 vRadio1, Data Outage
Gui, 21:Add, Radio, x100 y98 h20 vRadio2, Installation
Gui, 21:Add, Text, x12 y144 h30, Spoke to:
Gui, 21:Add, Text, x12 y174 h30, SITE CODE:
Gui, 21:Add, Edit, -E0x200 x78 y140 w122 vSpoke,
Gui, 21:Add, Edit, -E0x200 x118 y170 w82 vSCODE,
Gui, 21:Add, Text, x12 y200 w220 , What was the reason for being declined?
Gui, 21:Add, Edit, -E0x200 x12 y225 w186 h50 -VScroll vBox2KB,

Gui, 21:Add, GroupBox, yp+70 w186 h110, Preview
Gui, 21:Add, Text, xp+15 yp+15 w154 h80 vPreview, 

Gui, 21:Add, Picture, x56 y500 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 21:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, 21:Add, Button, x12 y670 w184 h30 , &Close
Gui, 21:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

loop
{
    Gui, 21:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 21:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	Radio1 := Radio1 ? " Data Outage " : ""
	Radio2 := Radio2 ? " Installation " : ""

	Spoke := Spoke ? " •• SPOKE TO: " Spoke : ""
	Box2KB := Box2KB ? " •• ADDITIONALLY: " Box2KB : ""

	msgText = % Time " - #OUT" Radio1 Radio2 Spoke " - #KNOCKBACK" Box2KB

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 21:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

21ButtonBack:
Gui, 21: Destroy
gosub Q2
return


21ButtonClose:
	Gui, 21:Destroy
return

21ButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Knockback`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
Reload
return

;=====================================================KNOCKBACK END

;=====================================================SITE RESET

SupSiteReset:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

list1 = No|Yes
list2 = Yes|No|TBA
list3 = Brodie|Ricky|N/A
Gui, Destroy
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
gui_x +=450
Gui, 12:-SysMenu +Border
Gui, 12:Color, 1d1f21, 383D46
Gui, 12:font, s12 cE8EBF5 bold, Segoe UI
Gui, 12:Add, Text, center x0 y50 w266 , SITE RESET`nCONFIRMATION
Gui, 12:font,
Gui, 12:font, cE8EBF5, Segoe UI
Gui, 12:Add, GroupBox, x25 yp+100 w212 h120,
Gui, 12:Add, CheckBox, x50 yp+25 h20 vCLIENT, - Clients Confirmed
Gui, 12:Add, CheckBox, yp+25 h20 vLOY, - ACN, API or Loyalty on Site
Gui, 12:Add, CheckBox, yp+25 h20 vEMAIL, - Reset email sent
Gui, 12:Add, Button, x32 yp+300 w200 h30 , Confirm
Gui, 12:Add, Button, x32 yp+50 w200 h30 , Close
Gui, 12:Add, Picture, xp+50 yp-220 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png
Gui, 12:Show, x%gui_x% y%gui_y% w266 h655,
return

12ButtonClose:
	Gui, 12:Destroy
return

12ButtonConfirm:
Gui, Submit

If(CLIENT=1)
	GuiControlGet, CLIENTCHECK,, CLIENT, Text
If(LOY=1)
	GuiControlGet, LOYCHECK,, LOY, Text
If(EMAIL=1)
	GuiControlGet, EMAILCHECK,, EMAIL, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Site Reset`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Clipboard = %Time% - SITE RESET %CLIENTCHECK% %EMAILCHECK% %LOYCHECK%
		TrayTip, Clipboard Ready, %clipboard%, 5, 16
	;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
	reload
return

;=====================================================SITE RESET END

;=====================================================ECOM ORDER
2Button7EcomOrder:
    Gosub, MakeGUI13
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
Clipboard = %Time% - #ECOM, #OUT - ECOM ORDER PENDING ACKNOWLEDGEMENT %Choice1EO% #%Box2EO% - I called and spoke to %Box1EO% in regards to the order that needed to be acknowledged. I asked them to acknowledge the order today.
	TrayTip, Clipboard Ready, %clipboard%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Ecom Order - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
	reload
return

MakeGui13:
list1 = 1/2|2/2
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 13:font, s10 bold, Segoe UI
Gui, 13:Add, Text, x108 y9 w90 h20 , Ecom Order
Gui, 13:font,
Gui, 13:font, s8, Segoe UI
Gui, 13:Add, Text, x18 y45 h15, Name of the person you spoke to?
Gui, 13:Add, Text, x18 y75 w190 h20 , Order number:
Gui, 13:Add, Text, x18 y105 w160, Pending acknowledgment call no.
Gui, 13:Add, Edit, x192 y45 w80 h20 vBox1EO,
Gui, 13:Add, Edit, x192 y75 w80 h20 vBox2EO,
Gui, 13:Add, DropDownList, x192 y105 w80 vChoice1EO, %list1%
Gui, 13:Add, Button, x18 y140 w120 h30 , Confirm
Gui, 13:Add, Button, x148 y140 w120 h30 , Exit
Gui, 13:Show, %Gui_Cord% w286 h180,  
return

13ButtonConfirm:
	Gui, Submit
return

13ButtonExit:
Reload
return

;=====================================================ECOM ORDER END

;=====================================================SEQUENCE ISSUE

2Button8SequenceIssue:
    Gosub, MakeGUI14
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - #SEQISSUE #OUT - Spoke to %Box1SI% - Reason for issue: %Box2SI% - Resolution: %Box3SI%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Sequence Issue`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
return

MakeGui14:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 14:font, s8, Segoe UI
Gui, 14:Add, Text, x18 y22 h15, What was the name of the 
Gui, 14:Add, Text, x18, person you spoke to?
Gui, 14:Add, Edit, w150 vBox1SI
Gui, 14:Add, Text,
Gui, 14:Add, Text, x18 h15, What was the reason for the
Gui, 14:Add, Text, x18, sequence issue?
Gui, 14:Add, Edit, w150 vBox2SI
Gui, 14:Add, Text,
Gui, 14:Add, Text, x18 h15, What was the resolution?
Gui, 14:Add, Edit, w150 vBox3SI
Gui, 14:Add, Text,
Gui, 14:Show, %Gui_Cord% h304 w186, Sequence Issue
Gui, 14:Add, Button, x18 y260 w70 h30, Confirm
Gui, 14:Add, Button, x98 y260 w70 h30, Exit
return

14ButtonConfirm:
	Gui, Submit
return

14ButtonExit:
	reload
return

;=====================================================SEQUENCE ISSUE END

;=====================================================GENERIC FIX

SupDO:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\Autohotkey\Files\issues.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\issues.png, C:\Autohotkey\Files\issues.png
}

IfNotExist, C:\Autohotkey\Files\fix.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\fix.png, C:\Autohotkey\Files\fix.png
}

Loop,
 {
  FileReadLine, Tags%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

 Loop,
 {
  FileReadLine, TagDesc%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }


Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list2GF = |Top Right|Bottom Right|Top Left|Bottom Left|Random
list3GF = |Yes|No|NA
Gui, 15:-SysMenu +Border
Gui, 15:font, s16 bold cE8EBF5, Segoe UI
Gui, 15:Color, 1d1f21, 383D46
Gui, 15:Add, Text, x20 y12 , GENERAL FIX
Gui, 15:Add, Text, x306 y12 , ISSUES
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Text, x40 y87 w120h50 , What was the fix for
Gui, 15:Add, Checkbox, x172 y70 vPFIX , #POSXFIX%A_Space%
Gui, 15:Add, Checkbox, x172 y90 vDFIX, #DISPXFIX%A_Space%
Gui, 15:Add, Checkbox, x172 y110 vHFIX, #HSNETFIX%A_Space%
Gui, 15:font, s10 bold cE8EBF5, Segoe UI
Gui, 15:Add, Text, x18 y150 h20 w254 vPreviewCODE, 
Gui, 15:font,
Gui, 15:font, cE8EBF5, Segoe UI
Gui, 15:Add, Text, yp+30 h15 , SITE CODE
Gui, 15:Add, Text, yp+30 h15 , Spoke to
Gui, 15:Add, Text, yp+30 h20, Reason for the outage
Gui, 15:Add, Text, yp+30 h20, Changes made to the site
Gui, 15:Add, Text, yp+30 h20, Resolution
Gui, 15:Add, Text, yp+30 h20, Antivirus in use
Gui, 15:Add, Text, yp+30 h20, Exceptions added
Gui, 15:Add, Text, yp+30 h20, Help Icon location
Gui, 15:Add, Edit, xp+175 y178 w80 h20 -E0x200 vSCODE , 
Gui, 15:Add, Edit, yp+30 w80 h20 -E0x200 vSpoke , 
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vOutage , 
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vChange , 	
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vRes , 
Gui, 15:Add, Edit, yp+30 w80 readonly -E0x200 vBox5GF , Set on Site IQ
Gui, 15:Add, DropDownList, yp+30 w80 vAV , %list3GF%
Gui, 15:Add, DropDownList, yp+30 w80 vHelp , %list2GF%
Gui, 15:font, s8 bold cE8EBF5, Segoe UI
Gui, 15:Add, Checkbox, checked x300 y45 vDO, #DATAOUT
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Checkbox, yp+20 vCb_1 , %Tags1%
Gui, 15:Add, Checkbox, yp+20 vCb_2 , %Tags2%
Gui, 15:Add, Checkbox, yp+20 vCb_3 , %Tags3%
Gui, 15:Add, Checkbox, yp+20 vCb_4 , %Tags4%
Gui, 15:Add, Checkbox, yp+20 vCb_5 , %Tags5%
Gui, 15:Add, Checkbox, yp+20 vCb_6 , %Tags6%
Gui, 15:Add, Checkbox, yp+20 vCb_7 , %Tags7%
Gui, 15:Add, Checkbox, yp+20 vCb_8 , %Tags8%
Gui, 15:Add, Checkbox, yp+20 vCb_9 , %Tags9%
Gui, 15:Add, Checkbox, yp+20 vCb_10 , %Tags10%
Gui, 15:Add, Checkbox, yp+20 vCb_11 , %Tags11%
Gui, 15:Add, Checkbox, yp+20 vCb_12 , %Tags12%
Gui, 15:Add, Checkbox, yp+20 vCb_13 , %Tags13%
Gui, 15:Add, Checkbox, yp+20 vCb_14 , %Tags14%
Gui, 15:Add, Checkbox, yp+20 vCb_15 , %Tags15%
Gui, 15:Add, Checkbox, yp+20 vCb_16 , %Tags16%
Gui, 15:Add, Checkbox, yp+20 vCb_17 , %Tags17%
Gui, 15:Add, Checkbox, yp+20 vCb_18 , %Tags18%
Gui, 15:Add, Checkbox, yp+20 vCb_19 , %Tags19%
Gui, 15:Add, Checkbox, yp+20 vCb_20 , %Tags20%
Gui, 15:Add, Checkbox, yp+20 vCb_21 , %Tags21%
Gui, 15:Add, Checkbox, yp+20 vCb_22 , %Tags22%
Gui, 15:Add, Checkbox, yp+20 vCb_23 , %Tags23%
Gui, 15:Add, Checkbox, yp+20 vCb_24 , %Tags24%
;Gui, 15:Add, Checkbox, yp+20 vCb_25 , %Tags25%
;Gui, 15:Add, Checkbox, yp+20 vCb_26 , %Tags26%
;Gui, 15:Add, Checkbox, yp+20 vCb_27 , %Tags27%
;Gui, 15:Add, Checkbox, yp+20 vCb_28 , %Tags28%
;Gui, 15:Add, Checkbox, yp+20 vCb_29 , %Tags29%
;Gui, 15:Add, Checkbox, yp+20 vCb_30 , %Tags30%
Gui, 15:font, s8 bold cE8EBF5, Segoe UI
Gui, 15:Add, Text, x400 y45, Use this tag for all Data Issues
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Text, yp+20 w250, %TagDesc1%
Gui, 15:Add, Text, yp+20 w250, %TagDesc2%
Gui, 15:Add, Text, yp+20 w250, %TagDesc3%
Gui, 15:Add, Text, yp+20 w250, %TagDesc4%
Gui, 15:Add, Text, yp+20 w250, %TagDesc5%
Gui, 15:Add, Text, yp+20 w250, %TagDesc6%
Gui, 15:Add, Text, yp+20 w250, %TagDesc7%
Gui, 15:Add, Text, yp+20 w250, %TagDesc8%
Gui, 15:Add, Text, yp+20 w250, %TagDesc9%
Gui, 15:Add, Text, yp+20 w250, %TagDesc10%
Gui, 15:Add, Text, yp+20 w250, %TagDesc11%
Gui, 15:Add, Text, yp+20 w250, %TagDesc12%
Gui, 15:Add, Text, yp+20 w250, %TagDesc13%
Gui, 15:Add, Text, yp+20 w250, %TagDesc14%
Gui, 15:Add, Text, yp+20 w250, %TagDesc15%
Gui, 15:Add, Text, yp+20 w250, %TagDesc16%
Gui, 15:Add, Text, yp+20 w250, %TagDesc17%
Gui, 15:Add, Text, yp+20 w250, %TagDesc18%
Gui, 15:Add, Text, yp+20 w250, %TagDesc19%
Gui, 15:Add, Text, yp+20 w250, %TagDesc20%
Gui, 15:Add, Text, yp+20 w250, %TagDesc21%
Gui, 15:Add, Text, yp+20 w250, %TagDesc22%
Gui, 15:Add, Text, yp+20 w250, %TagDesc23%
Gui, 15:Add, Text, yp+20 w250, %TagDesc24%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc25%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc26%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc27%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc28%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc29%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc30%

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 15:Add, Button, x400 y18 w80 h20 gEDITdo, EDIT
	}
If Dog = Aaron
	{
	Gui, 15:Add, Button, x400 y18 w80 h20 gEDITdo, EDIT
	}

Gui, 15:Add, Button, x60 y448 w170 h30 , Confirm
Gui, 15:Add, Button, x60 y488 w80 h30 , Back
Gui, 15:Add, Button, x150 y488 w80 h30 , Exit
Gui, 15:Add, GroupBox, x16 y550 w620 h110, Preview
Gui, 15:Add, Text, x30 y570 w590 h70 vPreview, 
Gui, 15:Show, %Gui_Cord% w650,  
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 15:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 15:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	DO := DO ? " - #DATAOUT " : ""

    PFIX := PFIX ? " #POSXFIX" : ""
	DFIX := DFIX ? " #DISPXFIX" : ""
	HFIX := HFIX ? " #HSNETFIX" : ""

	Spoke := Spoke ? " •• SPOKE TO: " Spoke : ""
	Outage := Outage ? " •• OUTAGE CAUSE: " Outage : ""
	Change := Change ? " •• CHANGES MADE: " Change : ""
	Res := Res ? " •• RESOLUTION: " Res : ""
	Help := Help ? " •• HELP ICON: " Help : ""
	AV := AV ? " •• AV EXCEP ADDED: " AV : ""

	CB1 := Cb_1 ? " " Tags1 : ""
	CB2 := Cb_2 ? " " Tags2 : ""
	CB3 := Cb_3 ? " " Tags3 : ""
	CB4 := Cb_4 ? " " Tags4 : ""
	CB5 := Cb_5 ? " " Tags5 : ""
	CB6 := Cb_6 ? " " Tags6 : ""
	CB7 := Cb_7 ? " " Tags7 : ""
	CB8 := Cb_8 ? " " Tags8 : ""
	CB9 := Cb_9 ? " " Tags9 : ""
	CB10 := Cb_10 ? " " Tags10 : ""
	CB11 := Cb_11 ? " " Tags11 : ""
	CB12 := Cb_12 ? " " Tags12 : ""
	CB13 := Cb_13 ? " " Tags13 : ""
	CB14 := Cb_14 ? " " Tags14 : ""
    CB15 := Cb_15 ? " " Tags15 : ""
	CB16 := Cb_16 ? " " Tags16 : ""
	CB17 := Cb_17 ? " " Tags17 : ""
	CB18 := Cb_18 ? " " Tags18 : ""
	CB19 := Cb_19 ? " " Tags19 : ""
	CB20 := Cb_20 ? " " Tags20 : ""
	CB21 := Cb_21 ? " " Tags21 : ""
	CB22 := Cb_22 ? " " Tags22 : ""
	CB23 := Cb_23 ? " " Tags23 : ""
	CB24 := Cb_24 ? " " Tags24 : ""
	CB25 := Cb_25 ? " " Tags25 : ""
	CB26 := Cb_26 ? " " Tags26 : ""
	CB27 := Cb_27 ? " " Tags27 : ""
	CB28 := Cb_28 ? " " Tags28 : ""
	CB29 := Cb_29 ? " " Tags29 : ""
	CB30 := Cb_30 ? " " Tags30 : ""
	
	msgText = % Time DO PFIX DFIX HFIX CB1 CB2 CB3 CB4 CB5 CB6 CB7 CB8 CB9 CB10 CB11 CB12 CB13 CB14 CB15 CB16 CB17 CB18 CB19 CB20 CB21 CB22 CB23 CB24 CB25 CB26 CB27 CB28 CB29 CB30 " #OUT " Spoke Outage Change Res Help AV

    ;msgText = %Time% - %Cb_22_Text%%Cb_1_Text%%Cb_2_Text%%Cb_3_Text% #OUT - SPOKE TO: %Box1GF% - OUTAGE WAS CAUSED BY: %Box2GF% - CHANGES MADE: %Box3GF% - RESOLUTION: %Box4GF% - HELP ICON: %Choice2GF% - AV EXCEPTIONS ADDED: %Choice1GF% - TAGS: %Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text%%Cb_8_Text%%Cb_9_Text%%Cb_10_Text%%Cb_11_Text%%Cb_12_Text%%Cb_13_Text%%Cb_14_Text%%Cb_15_Text%%Cb_16_Text%%Cb_17_Text%%Cb_18_Text%%Cb_19_Text%%Cb_20_Text%%Cb_21_Text%%Cb_23_Text%%Cb_24_Text%%Cb_25_Text%%Cb_26_Text%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 15:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

15ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

15Buttonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 15:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

15ButtonConfirm:

Clipboard = %msgText%

If clipboard Contains #NEWPC
	{
	;WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
	Gui, 15:hide
	Gui, A:+AlwaysOnTop
	Gui, A:Margin, 16, 16
	Gui, A:Color, 247BA0, 383D46 ;, 282a2e
	Gui, A:-SysMenu -Border
	Gui, A:Font, s11, Segoe UI

	Gui, A:Add, Text, xm cF3FFBD -E0x200 , You selected the #NEWPC tag.
	Gui, A:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

	Gui, A:Add, Button, xm w120 h30 gAcnNEWPC, ACNIELSEN
	Gui, A:Add, Button, x+10 w120 h30 gApiNEWPC, API
	Gui, A:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
	Gui, A:Show, , #NEWPC
	return
	
	AcnNEWPC:
	Gui, A:Destroy
	Gui, B:+AlwaysOnTop
	Gui, B:Margin, 16, 16
	Gui, B:Color, 247BA0, 383D46 ;, 282a2e
	Gui, B:-SysMenu -Border
	Gui, B:Font, s11, Segoe UI

	Gui, B:Add, Text, xm cF3FFBD -E0x200 , Was a backup used for the reinstall?
	
	Gui, B:Add, Button, xm w120 h30 gBackupYES, Yes
	Gui, B:Add, Button, x+10 w120 h30 gBackupNO, No
	Gui, B:Show, , #NEWPC
	return

	ApiNewPC:
		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := "ricky.white@intellipharm.com.au"
		email.Cc := "brodie.creaser@intellipharm.com.au, renae.hutchinson@intellipharm.com.au"
		email.Subject := "API - " SCODE
		email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #NEWPC`nCompleted by:`t   " Name "`n`n`n "
		email.Send
		gosub Neither
		return

	BackupNO:
		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := "aaron.beecham@intellipharm.com.au"
		email.Cc := "brodie.creaser@intellipharm.com.au"
		email.Subject := "ACNIELSEN - " SCODE
		email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #NEWPC`nCompleted by:`t   " Name "`n`n`n "
		email.Send
		gosub Neither
		return

	} 
	else If clipboard contains #POSCHANGE
		{
			Gui, 15:hide
			Gui, C:+AlwaysOnTop
			Gui, C:Margin, 16, 16
			Gui, C:Color, 247BA0, 383D46 ;, 282a2e
			Gui, C:-SysMenu -Border
			Gui, C:Font, s11, Segoe UI

			Gui, C:Add, Text, xm cF3FFBD -E0x200 , You selected the #POSCHANGE tag.
			Gui, C:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

			Gui, C:Add, Button, xm w120 h30 gAcnPOS, ACNIELSEN
			Gui, C:Add, Button, x+10 w120 h30 gApiPOS, API
			Gui, C:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
			Gui, C:Show, , #POSCHANGE
			return

				AcnPOS:
				email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
				email.To := "aaron.beecham@intellipharm.com.au"
				email.Cc := "brodie.creaser@intellipharm.com.au"
				email.Subject := "ACNIELSEN - " SCODE
				email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #POSCHANGE`nCompleted by:`t   " Name "`n`n`n "
				email.Send
				gosub Neither
				return

				ApiPOS:
				email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
				email.To := "ricky.white@intellipharm.com.au"
				email.Cc := "brodie.creaser@intellipharm.com.au, renae.hutchinson@intellipharm.com.au"
				email.Subject := "API - " SCODE
				email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #POSCHANGE`nCompleted by:`t   " Name "`n`n`n "
				email.Send
				gosub Neither
				return

		}
		else If clipboard contains #DISPCHANGE
			{
				Gui, 15:hide
				Gui, D:+AlwaysOnTop
				Gui, D:Margin, 16, 16
				Gui, D:Color, 247BA0, 383D46 ;, 282a2e
				Gui, D:-SysMenu -Border
				Gui, D:Font, s11, Segoe UI

				Gui, D:Add, Text, xm cF3FFBD -E0x200 , You selected the #DISPCHANGE tag.
				Gui, D:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

				Gui, D:Add, Button, xm w120 h30 gAcnDIS, ACNIELSEN
				Gui, D:Add, Button, x+10 w120 h30 gApiDIS, API
				Gui, D:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
				Gui, D:Show, , #DISPCHANGE
				return

					AcnDIS:
					email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
					email.To := "aaron.beecham@intellipharm.com.au"
					email.Cc := "brodie.creaser@intellipharm.com.au"
					email.Subject := "ACNIELSEN - " SCODE
					email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #DISPCHANGE`nCompleted by:`t   " Name "`n`n`n "
					email.Send
					gosub Neither
					return

					ApiDIS:
					email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
					email.To := "ricky.white@intellipharm.com.au"
					email.Cc := "brodie.creaser@intellipharm.com.au, renae.hutchinson@intellipharm.com.au"
					email.Subject := "API - " SCODE
					email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #DISPCHANGE`nCompleted by:`t   " Name "`n`n`n "
					email.Send
					gosub Neither
					return
			}


BackupYES:
Neither:
Gui, A:Destroy
Gui, B:Destroy
Gui, C:Destroy
Gui, D:Destroy

;WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
;IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, 15:Submit, NoHide
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	;Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Data Out Fix`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%Name%\
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Data Out.txt

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
Points++  ; This adds 1 to your variable TimesOpened.
Points++
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

reload
Return

EDITdo:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\Autohotkey\Files\issues.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\issues.png, C:\Autohotkey\Files\issues.png
}

IfNotExist, C:\Autohotkey\Files\fix.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\fix.png, C:\Autohotkey\Files\fix.png
}

Loop,
 {
  FileReadLine, Tags%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

 Loop,
 {
  FileReadLine, TagDesc%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }


Gui, Destroy

Gui, 15EDIT:-SysMenu +Border
Gui, 15EDIT:font, s16 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Color, 1d1f21, 383D46
Gui, 15EDIT:Add, Text, x20 y12 , ISSUES
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Add, Checkbox, checked x20 y45 vDO, #DATAOUT
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_1 vTags1, %Tags1%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_2 vTags2, %Tags2%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_3 vTags3, %Tags3%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_4 vTags4, %Tags4%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_5 vTags5, %Tags5%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_6 vTags6, %Tags6%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_7 vTags7, %Tags7%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_8 vTags8, %Tags8%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_9 vTags9, %Tags9%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_10 vTags10, %Tags10%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_11 vTags11, %Tags11%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_12 vTags12, %Tags12%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_13 vTags13, %Tags13%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_14 vTags14, %Tags14%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_15 vTags15, %Tags15%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_16 vTags16, %Tags16%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_17 vTags17, %Tags17%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_18 vTags18, %Tags18%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_19 vTags19, %Tags19%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_20 vTags20, %Tags20%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_21 vTags21, %Tags21%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_22 vTags22, %Tags22%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_23 vTags23, %Tags23%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_24 vTags24, %Tags24%

Gui, 15EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Add, Text, x120 y45, Use this tag for all Data Issues
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc1, %TagDesc1%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc2, %TagDesc2%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc3, %TagDesc3%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc4, %TagDesc4%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc5, %TagDesc5%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc6, %TagDesc6%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc7, %TagDesc7%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc8, %TagDesc8%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc9, %TagDesc9%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc10, %TagDesc10%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc11, %TagDesc11%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc12, %TagDesc12%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc13, %TagDesc13%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc14, %TagDesc14%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc15, %TagDesc15%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc16, %TagDesc16%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc17, %TagDesc17%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc18, %TagDesc18%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc19, %TagDesc19%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc20, %TagDesc20%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc21, %TagDesc21%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc22, %TagDesc22%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc23, %TagDesc23%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc24, %TagDesc24%

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 15EDIT:Add, Button, x120 y18 w80 h20 gSAVEdo, SAVE
	}
If Dog = Aaron
	{
	Gui, 15EDIT:Add, Button, x120 y18 w80 h20 gSAVEdo, SAVE
	}

Gui, 15EDIT:Add, Button, x290 y18 w80 h20 gEXIT, EXIT

Gui, 15EDIT:Add, Button, x20 y560 w80 h20 gOPENhashDO, OPEN
Gui, 15EDIT:Add, Button, x120 y560 w80 h20 gOPENdescDO, OPEN

Gui, 15EDIT:Add, Text, x220 y564 h20, Open text files directly.

Gui, 15EDIT:Show, %Gui_Cord% h595, Data Out Tags
return

OPENhashDO:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt
return


OPENdescDO:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt
return

SAVEdo:
Gui, 15EDIT:Submit
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt

FileAppend, %Tags1%`n%Tags2%`n%Tags3%`n%Tags4%`n%Tags5%`n%Tags6%`n%Tags7%`n%Tags8%`n%Tags9%`n%Tags10%`n%Tags11%`n%Tags12%`n%Tags13%`n%Tags14%`n%Tags15%`n%Tags16%`n%Tags17%`n%Tags18%`n%Tags19%`n%Tags20%`n%Tags21%`n%Tags22%`n%Tags23%`n%Tags24% ,G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt
FileAppend, %TagDesc1%`n%TagDesc2%`n%TagDesc3%`n%TagDesc4%`n%TagDesc5%`n%TagDesc6%`n%TagDesc7%`n%TagDesc8%`n%TagDesc9%`n%TagDesc10%`n%TagDesc11%`n%TagDesc12%`n%TagDesc13%`n%TagDesc14%`n%TagDesc15%`n%TagDesc16%`n%TagDesc17%`n%TagDesc18%`n%TagDesc19%`n%TagDesc20%`n%TagDesc21%`n%TagDesc22%`n%TagDesc23%`n%TagDesc24%,G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt

Msgbox, 0, UPDATE TAGS, Update Complete
reload
return

;=====================================================GENERIC FIX END

;=====================================================TILL CONFIG

LoyTillConfig:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LT:-SysMenu +Border
Gui, LT:font, s16 bold cE8EBF5, Segoe UI
Gui, LT:Color, 1d1f21, 383D46
;Gui, LT:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
Gui, LT:Add, Text, x20 y12 , LOYALTY TILL CONFIG
;Gui, LT:Add, Text, x306 y12 , ISSUES


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
Gui, LT:Add, Text, yp+20, Computer upgraded to Windows 10

Gui, LT:Add, GroupBox, x18 yp+40 w498 h120, Preview
Gui, LT:Add, Text, xp+15 yp+20 w470 h90 vPreview, 

Gui, LT:Add, Button, xp+505 yp-12 w100 h30 , Confirm
Gui, LT:Add, Button, yp+40 w100 h30 , Back
Gui, LT:Add, Button, yp+40 w100 h30 , Exit

Gui, LT:Add, Picture, x450 y48 w64 h64, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\loylogo.png

Gui, LT:Show, %Gui_Cord%, %A_Space%
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
	
	msgText = % Time Out IN Install Rein Fix " #TILLFIX •• " Spoke Reason Change Reso " •• TAGS:" Cryp NewPC PL Print Remap UAC Win10

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

;=====================================================TILL CONFIG END

;=====================================================INCOMING CALL

2ButtonIncomingCall:
    Gosub, MakeGUI16
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Basic Incoming Call`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Clipboard = %Time% - #IN - Spoke to: %Box1BC% - Issue: %Box2BC% - Resolution %Box3BC%
		TrayTip, Clipboard Ready, %clipboard%, 5, 16
	;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
	reload
return

MakeGui16:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 16:font, s8, Segoe UI 
Gui, 16:Add, Text, x18 y22 h15, Who did you speak to?
Gui, 16:Add, Edit, w150 vBox1BC
Gui, 16:Add, Text,
Gui, 16:Add, Text, x18 h15, What was the issue?
Gui, 16:Add, Edit, w150 h95 vBox2BC
Gui, 16:Add, Text,
Gui, 16:Add, Text, x18 h15, What was the resolution?
Gui, 16:Add, Edit, w150 h95 vBox3BC
Gui, 16:Add, Text,
Gui, 16:Show, %Gui_Cord% h394 w186, Sequence Issue
Gui, 16:Add, Button, x33 y359 w120, Copy To Clipboard
return

16ButtonCopyToClipboard:
	Gui, Submit
return

;=====================================================INCOMING CALL END

;=====================================================OUTGOING CALL

2ButtonOutgoingCall:
    Gosub, MakeGUI17
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - #OUT %Choice1OC% - Spoke to: %Box1OC% - Issue: %Box2OC% - Resolution: %Box3OC%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Basic Outgoing Call`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
return

MakeGui17:
list1OC = #INSTALL|#DATAOUT
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 17:font, s8, Segoe UI
Gui, 17:Add, Text, x12 y30 w110 h20 , Who did you speak to?
Gui, 17:Add, Edit, x132 y29 w80 h20 vBox1OC, 
Gui, 17:Add, Text, x12 y71 w100 h20 , What type of call?
Gui, 17:Add, DropDownList, x132 y69 w80 vChoice1OC, %list1OC%
Gui, 17:Add, Text, x232 y9 w120 h20 , What was the issue?
Gui, 17:Add, Edit, x232 y29 w150 h60 vBox2OC, 
Gui, 17:Add, Text, x232 y99 w150 h20 , What was the resolution?
Gui, 17:Add, Edit, x232 y119 w150 h60 vBox3OC, 
Gui, 17:Add, Button, x22 y129 w80 h40 , Confirm
Gui, 17:Add, Button, x122 y129 w90 h40 , Exit
Gui, 17:Show, %Gui_Cord% w400 h195, Basic Outgoing Call
return

17ButtonExit:
reload
return

17ButtonConfirm:
	Gui, Submit
return

;=====================================================OUTGOING CALL END

;=====================================================INSTALLATIONS WINDOW

Q3:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 3:font, s10 bold, Segoe UI
Gui, 3:Add, Text, x68 y25 w180 h50 , Installations
Gui, 3:font,
Gui, 3:Add, Button, x30 y90 w150 h30 , &General
Gui, 3:Add, Button, x30 y140 w150 h30 , &Fred Confirmation
Gui, 3:Add, Button, x30 y200 w70 h30 , &Back
Gui, 3:Add, Button, x110 y200 w70 h30 , E&xit
Gui, 3:Show, %Gui_Cord% h260 w210 ,  
Return

3ButtonBack:
Gui, 3:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

3ButtonExit:
Reload
return

;=====================================================INSTALLATIONS WINDOW END

;=====================================================INSTALL GENERAL

SupINSTALL:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\AutoHotKey\Files\thumbsup.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\thumbsup.png, C:\AutoHotKey\Files\thumbsup.png
}
IfNotExist, C:\AutoHotKey\Files\bau.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\bau.png, C:\AutoHotKey\Files\bau.png
}

IfNotExist, C:\AutoHotKey\Files\flash.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\flash.png, C:\AutoHotKey\Files\flash.png
}

Gui, Destroy 
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
Gui, 18:-SysMenu +Border
Gui, 18:font, cE8EBF5, Segoe UI
Gui, 18:Color, 1d1f21, 383D46
Gui, 18:Add, Checkbox, x18 y59 vHSNET, HSNET%A_Space%
Gui, 18:Add, Checkbox, x18 y79 vDIN, #DISPXIN%A_Space%
Gui, 18:Add, Checkbox, x18 y99 vPIN, #POSXIN%A_Space%
Gui, 18:Add, Checkbox, x18 y119 vJUMP, #JUMPSHIP%A_Space%
Gui, 18:Add, Text, x110 y59 w100 h50 , HSNET Installed
Gui, 18:Add, Text, x110 y79 w100 h50 , DISPX Installed
Gui, 18:Add, Text, x110 y99 w100 h50 , POSX Installed
Gui, 18:Add, Text, x110 y119 w200 h50 , Disconnected before extraction completed
Gui, 18:font, s10 cE8EBF5 bold, Segoe UI
Gui, 18:Add, Text, x18 y180 h20 w254 vPreviewCODE, 
Gui, 18:font,
Gui, 18:font, cE8EBF5 , Segoe UI
Gui, 18:Add, Text, yp+30 h15, SITE CODE
Gui, 18:Add, Text, yp+30 h15, Name of the person you spoke to
Gui, 18:Add, Text, yp+30 w180 h20, Checked the network for installs
Gui, 18:Add, Text, yp+30 w180 h20, Resolution
Gui, 18:Add, Text, yp+30 w180 h20, Antivirus in use
Gui, 18:Add, Text, yp+30 w180 h20, Exceptions added
Gui, 18:Add, Text, yp+30 w180 h20, Help Icon location?
Gui, 18:Add, Edit, xp+190 yp-184 w80 h20 -E0x200 vSCODE,
Gui, 18:Add, Edit, yp+30 w80 h20 -E0x200 vConName,
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vNetwork, |Yes|No
Gui, 18:Add, Edit, yp+30 w80 -E0x200 vRes,
Gui, 18:Add, Edit, yp+30 w80 readonly -E0x200 -VScroll vBox3G,%A_space%Set on Site IQ
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vExc, |Yes|No
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vIco, |Top Right|Bottom Right|Top Left|Bottom Left|Random
Gui, 18:Add, Checkbox, x326 y59 vIN, #IN
Gui, 18:Add, Checkbox, x326 y79 vOUT, #OUT
Gui, 18:Add, Checkbox, x326 y99 vEMAIL, #EMAIL
Gui, 18:font, s16 cE8EBF5 bold, Segoe UI
Gui, 18:Add, Text, x326 y14 , CONTACT INITIATION
Gui, 18:Add, Text, x18 y14 , INSTALLATION
Gui, 18:font,
Gui, 18:font, s8 cE8EBF5, Segoe UI
Gui, 18:Add, Text, x406 y59, An incoming call initiated the install
Gui, 18:Add, Text, x406 y79, An outgoing call initiated the install
Gui, 18:Add, Text, x406 y99, An email initiated the install
Gui, 18:Add, Button, x326 y388 w90 h30 , Confirm
Gui, 18:Add, Button, x432 y388 w90 h30 , Back
Gui, 18:Add, Button, x536 y388 w90 h30 , Exit
Gui, 18:Add, GroupBox, x326 y159 w300 h210, Preview
Gui, 18:Add, Text, x336 y179 w280 h180 vPreview
Gui, 18:Show, %Gui_Cord% w652 h432,  
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 18:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 18:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    HSNET := HSNET ? " HSNET" : ""
	DIN := DIN ? " #DISPXIN" : ""
	PIN := PIN ? " #POSXIN" : ""
	IN := IN ? " #IN" : ""
	OUT := OUT ? " #OUT" : ""
	EMAIL := EMAIL ? " #EMAIL" : ""
	JUMP := JUMP ? " #JUMPSHIP" : ""
	
	ConName := ConName ? " •• SPOKE TO: " ConName : ""
	Network := Network ? " •• DUAL IN CHECKED: " Network : ""
	Res := Res ? " •• RESOLUTION: " Res " " Jump : ""
	Exc := Exc ? " •• AV EXCEPTIONS ADDED: " Exc : ""
	Ico := Ico ? " •• HELP ICON: " Ico : ""

    msgText= % Time " - #INSTALL •• SYSTEMS INSTALLED:" HSNET DIN PIN IN OUT EMAIL ConName Network Res Exc Ico

	;msgText=%Time% - #INSTALL %Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text% - Spoke to %Box1G% - CHANGES MADE: Installed %Cb_1_Text% %Cb_2_Text% %Cb_3_Text% - Checked network for alternate installs: %Choice1G% - RESOLUTION: %Box2G% - HELP ICON: %Choice2G% - AV EXCEPTIONS ADDED: %Choice3G%


    if NOT (msgText == oldMsgText)
    {
       GuiControl, 18:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

18ButtonBack:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 18:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

18ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

18ButtonConfirm:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, Submit,

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

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Installation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%Name%\
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Install.txt

;ADDING POINTS
IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
Points++  ; This adds 1 to your variable TimesOpened.
Points++
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

Gui, 18:Destroy
Gui, 73:Add, Picture, x-88 y-51 w400 h800 , C:\AutoHotKey\Files\flash.png
Gui, 73:Font, S10 Bold, Segoe UI
Gui, 73:Add, Text, x202 y29 w230 h30 , Remember install dates for Site IQ!
Gui, 73:Add, Button, x290 y199 w150 h30 , Close
Gui, 73:Show, w466 h263,  
return

73ButtonClose:
Reload
return

;=====================================================INSTALL GENERAL END

;=====================================================FRED CONFIRMATION

FredConf:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

list1FC = Yes|No
;Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 25:-SysMenu +Border
Gui, 25:font, cE8EBF5
Gui, 25:Color, 1d1f21, 383D46
Gui, 25:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,

Gui, 25:font, s12 bold cE8EBF5, Segoe UI
Gui, 25:Add, Text, center x0 y24 w210 , FRED CONFIRMATION

Gui, 25:font, 
Gui, 25:font, cE8EBF5, Segoe UI
Gui, 25:Add, Text, x12 yp+50 h30, Who did you speak to?
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox1FC
Gui, 25:Add, Text, yp+40 w170 , Confirmed they are using STOPS?
Gui, 25:Add, DropDownList, yp+20 w184 vChoice1FC, %list1FC%

Gui, 25:font, 
Gui, 25:font, s12 bold cE8EBF5, Segoe UI
Gui, 25:Add, Text, center x0 yp+40 w210 , Required Names
Gui, 25:font, 
Gui, 25:font, cE8EBF5, Segoe UI

Gui, 25:Add, Text, x12 yp+40 , First point of contact:
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox2FC

Gui, 25:Add, Text, yp+40 , Second point of contact:
Gui, 25:Add, Edit, -E0x200 yp+20 w184 vBox3FC

Gui, 25:Add, GroupBox, yp+40 h140 w184 , Preview
Gui, 25:Add, Text, xp+13 yp+13 h110 w149 vFredConPre, 

Gui, 25:Add, Picture, x56 y510 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png

Gui, 25:Add, Button, x12 y620 w184 h30 , &Confirm
Gui, 25:Add, Button, x12 y670 w184 h30 , &Close

Gui, 25:Show, x%gui_x% y%gui_y% w210 h719, %A_Space%

loop
{
    Gui, 25:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    msgText = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box1FC% (confirmed using STOPS - %Choice1FC%) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box2FC% 2. %Box3FC%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 25:Text, FredConPre, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

25Buttonback:
Gui, 25:Destroy
gosub Q2
return

25ButtonConfirm:
	Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
Clipboard = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box1FC% (confirmed using STOPS - %Choice1FC%) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box2FC% 2. %Box3FC%
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Fred Confirmation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt
reload
return

25ButtonClose:
	Gui, 25:Destroy
return

;=====================================================FRED CONFIRMATION END 

;=====================================================EMAIL WINDOW

Q7:
SupEMAILS:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

;WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
;IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy 
Gui, 99:Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 7:+ToolWindow -SysMenu +Border
Gui, 7:font, s16 cE8EBF5 bold, Segoe UI
Gui, 7:Color, 1d1f21, 383D46
Gui, 7:Add, Text, center x1 y32 w420 h50 , ✉ Email Templates ✉
Gui, 7:font,
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Text, center x80 y62 w250 , Outlook MUST be running before you click any of these buttons. It will not work if you do not.
;Gui, 7:Add, Button, x30 y125 w150 h30 , &1 Site Reset
Gui, 7:Add, Button, x30 y165 w150 h30 , &2 FRED Excel Form
Gui, 7:Add, Button, x30 y205 w150 h30 , &3 Bugs Reporting Tool
Gui, 7:Add, Button, x30 y265 w150 h30 , &4 ACNIELSEN Email
Gui, 7:Add, Button, x30 y305 w150 h30 , &5 MINFOS Webservice
Gui, 7:Add, Button, x30 y365 w150 h30 , &6 Loyalty Escalation
Gui, 7:Add, Button, x30 y405 w150 h30 , &7 Loyalty Reinstallation
Gui, 7:font, s8 cE8EBF5 bold,
Gui, 7:Add, GroupBox, x215 y120 w180 h230 , EMAILS TO REPS
Gui, 7:font, 
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Button, x230 y145 w150 h30 , Data Outage Resolved
Gui, 7:Add, Button, x230 y185 w150 h30 , Installation Complete `n(Pending QA)
Gui, 7:Add, Button, x230 y225 w150 h30 , Installation Complete
Gui, 7:Add, Button, x230 y265 w150 h30 , Knock Back (Data Outage)
Gui, 7:Add, Button, x230 y305 w150 h30 , Knock Back (Installation)
Gui, 7:Add, Button, x230 y365 w150 h30 , POS Browser Batch Reader
Gui, 7:Add, Button, x230 y405 w70 h30 , &Back
Gui, 7:Add, Button, x310 y405 w70 h30 , E&xit
Gui, 7:Show, %Gui_Cord% w420 h465, %A_Space% ;✉ ;w210 h620, 
return

7ButtonBack:
Gui, 7:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

7ButtonEXIT:
Reload
return

;=====================================================EMAIL WINDOW END

7Button3BugsReportingTool:
run, https://support.intellipharm.com.au
reload
return

7ButtonDataOutageResolved:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 79:Color, 1d1f21, 383D46
Gui, 79:font, s14 bold cE8EBF5, Segoe UI
Gui, 79:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 79:Add, Text, x18 y18 w289 h50, DATA OUTAGE RESOLVED
Gui, 79:font,
Gui, 79:font, cE8EBF5, Segoe UI
Gui, 79:Add, Text, x18 y83 h30, Contact Email
Gui, 79:font, s6 cE8EBF5, Segoe UI
Gui, 79:Add, Text, x98 y85 h30, (optional)
Gui, 79:font, 
Gui, 79:font, cE8EBF5, Segoe UI
Gui, 79:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 79:Add, Text, x18 y113 h30, Contact Name
Gui, 79:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 79:Add, Text, x18 y143 h30, Store Name
Gui, 79:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 79:Add, Text, x38 y195 , Additional Information
Gui, 79:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 79:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 79:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 79:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 79:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 79:Add, Button, x38 y328 w100 h30 , &Back
Gui, 79:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 79:Show, %Gui_Cord% w686 h395, 

loop
{
    Gui, 79:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tData Outage Resolved - %Box2%`n`n`nHi %Box1%`n`nThe data outage at %Box2% has been resolved.`n`nThe data for this store should be loaded by tomorrow.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 79:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

79ButtonExit:
	reload
return

79ButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

79ButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Data Outage Resolved`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Data Outage Resolved - " Box2
	email.Body := "Hi " Box1 "`n`nThe data outage at " Box2 " has been resolved.`n`nThe data for this store should be loaded by tomorrow.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ DATA OUTAGE RESOLVED END

;================================ INSTALL COMPLETE PENDING QA

7ButtonInstallationComplete(PendingQA):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90:-SysMenu +Border
Gui, 90:Color, 1d1f21, 383D46
Gui, 90:font, s14 bold cE8EBF5, Segoe UI
Gui, 90:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90:Add, Text, x18 y18 w289 h50, INSTALLATION COMPLETE`n(PENDING QA)
Gui, 90:font,
Gui, 90:font, cE8EBF5, Segoe UI
Gui, 90:Add, Text, x18 y83 h30, Contact Email
Gui, 90:font, 
Gui, 90:font, s6 cE8EBF5, Segoe UI
Gui, 90:Add, Text, x98 y85 h30, (optional)
Gui, 90:font, 
Gui, 90:font, cE8EBF5, Segoe UI
Gui, 90:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 90:Add, Text, x18 y113 h30, Contact Name
Gui, 90:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 90:Add, Text, x18 y143 h30, Store Name
Gui, 90:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 90:Add, Text, x38 y195 , Additional Information
Gui, 90:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tInstallation Complete - %Box2% - Pending QA`n`n`nHi %Box1%`n`nThe installation for %Box2% has been completed.`n`nThe stores data will be reviewed over the next few days before account details are emailed to the store.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90ButtonExit:
	reload
return

90ButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90ButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Installation Complete Pending QA`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Pending QA"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed.`n`nThe stores data will be reviewed over the next few days before account details are emailed to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ INSTALL COMPLETE PENDING QA END

;================================ INSTALL COMPLETE PENDING QA

7ButtonInstallationComplete:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90A:-SysMenu +Border
Gui, 90A:Color, 1d1f21, 383D46
Gui, 90A:font, s14 bold cE8EBF5, Segoe UI
Gui, 90A:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90A:Add, Text, x18 y18 w289 h50, INSTALLATION COMPLETE
Gui, 90A:font,
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Text, x18 y83 h30, Contact Email
Gui, 90A:font, 
Gui, 90A:font, s6 cE8EBF5, Segoe UI
Gui, 90A:Add, Text, x98 y85 h30, (optional)
Gui, 90A:font, 
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 90A:Add, Text, x18 y113 h30, Contact Name
Gui, 90A:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 90A:Add, Text, x18 y143 h30, Store Name
Gui, 90A:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 90A:Add, Text, x38 y195 , Additional Information
Gui, 90A:Add, Edit, -E0x200 x38 y220 w212 -VScroll h50 vBox3,
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90A:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90A:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90A:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90A:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90A:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90A:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90A:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tInstallation Complete - %Box2% - Details Sent`n`n`nHi %Box1%`n`nThe installation for %Box2% has been completed and account details have been sent to the store.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90A:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90AButtonExit:
	reload
return

90AButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90AButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Installation Complete Pending QA`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Details Sent"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed and account details have been sent to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ INSTALL COMPLETE PENDING QA END

;================================ KNOCK BACK DATA OUT CONNECTION REQ

7ButtonKnockBack(DataOutage):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90B:-SysMenu +Border
Gui, 90B:Color, 1d1f21, 383D46
Gui, 90B:font, s14 bold cE8EBF5, Segoe UI
Gui, 90B:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90B:Add, Text, x18 y18 w289 h50, KNOCK BACK (DATA OUTAGE)
Gui, 90B:font,
Gui, 90B:font, cE8EBF5, Segoe UI
Gui, 90B:Add, Text, x18 y63 h30, Contact Email
Gui, 90B:font, 
Gui, 90B:font, s6 cE8EBF5, Segoe UI
Gui, 90B:Add, Text, x98 y65 h30, (optional)
Gui, 90B:font, 
Gui, 90B:font, cE8EBF5, Segoe UI
Gui, 90B:Add, Edit, -E0x200 x142 y60 w130 vBox4, 
Gui, 90B:Add, Text, x18 y93 h30, Contact Name
Gui, 90B:Add, Edit, -E0x200 x142 y90 w130 vBox1, 
Gui, 90B:Add, Text, x18 y123 h30, Store Name
Gui, 90B:Add, Edit, -E0x200 x142 y120 w130 vBox2,
Gui, 90B:Add, Text, x18 y145 h30, Dates Connection`nAttempted
Gui, 90B:Add, Edit, -E0x200 x142 y150 w130 vBox5,
Gui, 90B:Add, Text, x38 y195 , Additional Information
Gui, 90B:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90B:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90B:Add, Text, x320 y76 w330 h260 vPreviewDOR, 
Gui, 90B:Add, Text, x335 y358 w340 h250 , Please ensure your signature is attached before sending...
Gui, 90B:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90B:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90B:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90B:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90B:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tConnection Attempted - %Box2%`n`nHi %Box1%`n`nThe data is currently behind for %Box2%. We have contacted the store on %Box5% and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90B:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90BButtonExit:
	reload
return

90BButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90BButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Knock Back Data Out`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Connection Attempted - " Box2
	email.Body := "Hi " Box1 "`n`nThe data is currently behind for " Box2 ". We have contacted the store on " Box5 " and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n " Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ KNOCK BACK DATA OUT CONNECTION REQ END

;================================ KNOCK BACK INSTALLATIONCONNECTION REQ

7ButtonKnockBack(Installation):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90C:-SysMenu +Border
Gui, 90C:Color, 1d1f21, 383D46
Gui, 90C:font, s14 bold cE8EBF5, Segoe UI
Gui, 90C:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90C:Add, Text, x18 y18 w289 h50, KNOCK BACK (INSTALLATION)
Gui, 90C:font,
Gui, 90C:font, cE8EBF5, Segoe UI
Gui, 90C:Add, Text, x18 y63 h30, Contact Email
Gui, 90C:font, 
Gui, 90C:font, s6 cE8EBF5, Segoe UI
Gui, 90C:Add, Text, x98 y65 h30, (optional)
Gui, 90C:font, 
Gui, 90C:font, cE8EBF5, Segoe UI
Gui, 90C:Add, Edit, -E0x200 x142 y60 w130 vBox4, 
Gui, 90C:Add, Text, x18 y93 h30, Contact Name
Gui, 90C:Add, Edit, -E0x200 x142 y90 w130 vBox1, 
Gui, 90C:Add, Text, x18 y123 h30, Store Name
Gui, 90C:Add, Edit, -E0x200 x142 y120 w130 vBox2,
Gui, 90C:Add, Text, x18 y145 h30, Dates Connection`nAttempted
Gui, 90C:Add, Edit, -E0x200 x142 y150 w130 vBox5,
Gui, 90C:Add, Text, x38 y195 , Additional Information
Gui, 90C:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90C:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90C:Add, Text, x320 y76 w330 h260 vPreviewDOR, 
Gui, 90C:Add, Text, x335 y358 w340 h250 , Please ensure your signature is attached before sending...
Gui, 90C:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90C:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90C:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90C:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90C:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tConnection Attempted - %Box2%`n`nHi %Box1%`n`nWe have not been able to complete the installation request for %Box2%. We have contacted the store on %Box5% and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90C:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90CButtonExit:
	reload
return

90CButtonBack:
	Gui, 90C:Destroy
	gosub Q7
return

90CButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Knock Back Installation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Details Sent"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed and account details have been sent to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ KNOCK BACK INSTALLATION CONNECTION REQ END

;================================ POSBROWSER BATCH READER END

7ButtonPosbrowserbatchreader:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90D:-SysMenu +Border
Gui, 90D:Color, 1d1f21, 383D46
Gui, 90D:font, s12 bold cE8EBF5, Segoe UI
Gui, 90D:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90D:Add, Text, x38 y26 w200 , POSBROWSER BATCH READER ACCESS REQUEST
Gui, 90D:font,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Text, x38 y103 h30, Store Name:
Gui, 90D:Add, Edit, -E0x200 x120 y100 w130 vBox2,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Text, x38 y195 , Additional Information
Gui, 90D:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90D:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90D:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90D:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90D:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90D:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90D:Show, %Gui_Cord% w686 h395, 

loop
{
    Gui, 90D:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`tsupport@possolutions.com.au`nSubject: `tBatch Reader Access Request - %Box2%`n`n`nHi POS Solutions`n`nI am emailing in regards to %Box2%. The pharmacy has signed up for our data collection service. Would you be able to please provide batch reader access for us? If you have any questions, please give me a call.`n%Box3%`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90D:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90DButtonExit:
	reload
return

90DButtonBack:
	Gui, 90D:Destroy
	gosub Q7
return

90DButtonConfirm:
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Batch Reader Access`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@possolutions.com.au"
	email.Cc := "support@intellipharm.com.au"
	email.Subject := "Batch Reader Access Request - " Box2
	email.Body := "Hi POS Solutions`n`nI am emailing in regards to " Box2 ". The pharmacy has signed up for our data collection service. Would you be able to please provide batch reader access for us? If you have any questions, please give me a call.`n" Box3 "`nKind Regards`n"
	email.Display

	reload
return

;================================ POSBROWSER BATCH READER END

;=====================================================MINFOS WEB

7Button5MinfosWebservice:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 76:font, s12 bold, Segoe UI
Gui, 76:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 76:Add, Text, x23 y24 , Minfos Webservice Unavailable
Gui, 76:font,
Gui, 76:font, s8, Segoe UI
Gui, 76:Add, Text, x18 y78 h30, Store Name
Gui, 76:Add, Edit, x18 y98 w250 vBox1,
Gui, 76:Add, Text, x18 y138 h30, Webservice address
Gui, 76:Add, Edit, x18 y158 w250 vBox2,
Gui, 76:Add, Button, x16 y210 w80 h30 , Confirm
Gui, 76:Add, Button, x104 y210 w80 h30 , Back
Gui, 76:Add, Button, x192 y210 w80 h30 , Exit
Gui, 76:Show, %Gui_Cord% w286 h252, 
return

76ButtonExit:
Reload
return

76ButtonBack:
Gui, 76:Destroy
gosub Q7
return

76ButtonConfirm:
	Gui, Submit
	
GuiControlGet, MyDateTime
	
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - MINFOS Webservices Email`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	
	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "minfos_support@minfos.com.au"
	email.Cc := "support@intellipharm.com.au"
	email.Subject := Box1 " - Webservices Unavailable - Please double check Midas"
	email.Body := "Hi Minfos Support,`n`nCan you please double check Midas is running correctly at this store?`nWe are having troubles accessing the webservice:`n" Box2 "`n`nIf you have any questions, please let me know.`n`nRegards,`n" Name " " Surname "`nIntellipharm`n1300 255 160"
	email.Display

return

;=====================================================END MINFOS WEB

;=====================================================ACNIELSEN

7Button4ACNIELSENEmail:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 53:Margin, 16, 16
Gui, 53:Color, 1d1f21, 383D46 ;, 282a2e
Gui, 53:-SysMenu +Border
Gui, 53:Font, s11, Segoe UI

Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Site Code
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox1 , 
Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Site Name
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox2 , 
Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Store Contact
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox3 , 

Gui, 53:Add, CheckBox, cc5c8c6 x290 y38 h20 vCb_1 , Reinstalled%A_Space%
Gui, 53:Add, CheckBox, cc5c8c6 x290 y80 h20 vCb_2 , Installed%A_Space%

Gui, 53:Add, Button, x290 y137 w120 h30 , &Confirm
Gui, 53:Add, Button, x+10 w120 h30 , &Back
Gui, 53:Add, Button, x290 y+10 w250 h30 , E&xit

Gui, 53:Show, %Gui_Cord% , ACNIELSEN Email Template
return
 
53ButtonBack:
Gui, 53:Destroy
gosub Q7
return 
 
53ButtonConfirm:
Gui, Submit,

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
 
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - ACNIELSEN Install/Reinstall`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "aaron.beecham@intellipharm.com.au"
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "ACNIELSEN - " Box1 " " Box2
	email.Body := "NIELSEN STORE UPDATE`n`nStore ID:`t`t" Box1 "`nStore Name:`t    " Box2 "`nAction taken:`t     " Cb_1_Text Cb_2_Text "`nCompleted by:`t   " Name "`n`n`n "
	email.Display
	reload
return

53ButtonExit:
Reload
return

;=====================================================ACNIELSEN END

;=====================================================GREENCROSS MISSING ZIPS

7Button8GREENCROSSZIPs:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 45:Add, Text, x12 y9 w50 h20 , Site Code
Gui, 45:Add, Text, x12 y39 w60 h20 , Site Name
Gui, 45:Add, Text, x12 y69 w70 h20 , Client ID
Gui, 45:Add, Text, x12 y99 w70 h20 , Store Contact
Gui, 45:Add, Edit, x92 y9 w80 h20 vBox1,
Gui, 45:Add, Edit, x92 y39 w80 h20 vBox2,
Gui, 45:Add, Edit, x92 y69 w80 h20 vBox3,
Gui, 45:Add, Edit, x92 y99 w80 h20 vBox4,
Gui, 45:Add, CheckBox, x192 y9 w190 h20 vCb_1 , Attempted Intellipharm Extract EXE
Gui, 45:Add, Text, x192 y39 w190 h20 , General Description:
Gui, 45:Add, Edit, x192 y59 w190 h60 vBox5,
Gui, 45:Add, Button, x12 y132 w120 h30 , &Accept
Gui, 45:Add, Button, x138 y132 w120 h30 , &Back
Gui, 45:Add, Button, x263 y132 w120 h30 , E&xit
Gui, 45:Show, %Gui_Cord% w395 h170, Missing ZIPs
return

45ButtonBack:
Gui, 45:Destroy
gosub Q7
return
 
45ButtonAccept:
Gui, Submit,

Gui, 71: -sysmenu
Gui, 71:Font, S12 Bold CDefault, Verdana
Gui, 71:Add, Text, x10 y18 w260 h70 ,Please wait...
Gui, 71:Font,
global WM_USER               := 0x00000400
global PBM_SETMARQUEE        := WM_USER + 10
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
;Flat marquee
;Gui, Add, Progress, x178 y89 w300 h20 hwndMARQ1 +%PBS_MARQUEE%, 50
;DllCall("User32.dll\SendMessage", "Ptr", MARQ1, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
Gui, 71:Add, Progress, x10 y50 w180 h20 hwndMARQ4 -%PBS_SMOOTH% +%PBS_MARQUEE%, 50
DllCall("User32.dll\SendMessage", "Ptr", MARQ4, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
Gui, 71:Show, w200 h80, 

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - GREENCROSS MIssing ZIPs`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\miszip.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, Missing Loyalty ZIPs - %Box1% %Box2% 
	sleep 500
	SendInput, {Tab}%Box1%{Tab}%Box2%{Down}%Box3%{Down}%Box4%{Down}%Box5%{Down}{Enter}Regards{Enter}%Name%{Enter}
Cb_1_Text=
	reload
return

45ButtonExit:
Reload
return

;=====================================================GREENCROSS MISSING ZIPS END

;=====================================================LOYALTY REINSTALLATION

7Button7LoyaltyReinstallation:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = %A_Space%|1|2|3|4|5|6|7|8
Gui, 46:-SysMenu +Border
Gui, 46:Color, 1d1f21, 383D46
Gui, 46:font, s16 bold cE8EBF5, Segoe UI
Gui, 46:Add, Text, x12 y12 w425 , LOYALTY REINSTALLATION
Gui, 46:font, 
Gui, 46:font, cE8EBF5, Segoe UI
Gui, 46:Add, Text, x12 y62 w90 h20 , Site Code
Gui, 46:Add, Edit, -E0x200 x100 y60 w90 h20 vBox1,
Gui, 46:Add, Text, x12 y92 w80 h20 , Site Name
Gui, 46:Add, Edit, -E0x200 x100 y90 w90 h20 vBox2,
Gui, 46:Add, Text, x12 y122 w80 h20 , Store Contact
Gui, 46:Add, Edit, -E0x200 x100 y120 w90 h20 vBox3,
Gui, 46:Add, Text, x12 y152 h20 , POS System
Gui, 46:Add, Edit, -E0x200 x100 y150 w90 h20 vBox4,
Gui, 46:Add, CheckBox, x12 y182 h20 vCb_1, POS Change
Gui, 46:Add, Edit, -E0x200 x100 y180 w90 h20 vBox5,
Gui, 46:Add, Text, x12 y212 w80 h20 , Date of change
Gui, 46:Add, Edit, -E0x200 x100 y210 w90 h20 vBox6,

Gui, 46:Add, Groupbox, x12 y240 w177 h75 , Backup
Gui, 46:Add, Radio, x22 y260 h20 vCb_2, Backup Kept
Gui, 46:Add, Radio, x22 y280 h20 vCb_3, No Backup

Gui, 46:Add, Text, x222 y59 h20 , When did issues begin? (approx date)
Gui, 46:Add, Edit, -E0x200 x222 y79 w190 h20 vBox7,

Gui, 46:Add, Groupbox, x222 y123 w190 h90 , Reinstall locations?
Gui, 46:Add, Radio, x232 y140 h20 vCb_4, Main + Tills
Gui, 46:Add, Radio, x232 y160 h20 vCb_5, Main Computer
Gui, 46:Add, Radio, x232 y180 h20 vCB_6, Tills 
Gui, 46:Add, DropDownList, x362 y140 w40 vChoice1, %A_Space%%List1%
Gui, 46:Add, DropDownList, x362 y180 w40 vChoice2, %A_Space%%List1%

Gui, 46:Add, Groupbox, x222 y225 w190 h90 , Additional information
Gui, 46:Add, CheckBox, x232 y245 h20 vCb_7, Crypto
Gui, 46:Add, CheckBox, x232 y265 h20 vCb_8, Computer Replaced
Gui, 46:Add, CheckBox, x232 y285 h20 vCb_9, Additional Till

Gui, 46:Add, Text, x12 y330 w180 h20 , More information
Gui, 46:Add, Edit, -E0x200 x12 y350 w400 h60 -VScroll vBox8,
Gui, 46:Add, Button, x12 y425 w120 h30 , Send
Gui, 46:Add, Button, x152 y425 w120 h30 , Back
Gui, 46:Add, Button, x292 y425 w120 h30 , Exit

Gui, 46:Add, Groupbox, x440 y30 w385 h410, Preview
Gui, 46:Add, Text, x455 y55 w360 h370 vPreviewLoyIn, 

Gui, 46:Show,  %Gui_Cord% w850 h470, %A_Space%

loop
{
    Gui, 46:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	POSChange := Cb_1 ? "POS Changed: " : ""
	Kept := Cb_2 ? "Kept " : ""
	NotKept := Cb_3 ? "Not Kept " : ""
	MCT := Cb_4 ? "Main Computer + Tills " : ""
	MC := Cb_5 ? "Main Computer " : ""
	T := Cb_6 ? "Tills " : ""
	Cryp := Cb_7 ? "Crypto " : ""
	Comp := Cb_8 ? "Computer Replaced " : ""
	AddT := Cb_9 ? "Additional Till " : ""
	
    msgText = To: `t`tsupport@loyaltyone.com.au`nSubject: `tLoyalty Reinstallation Required - %Box1% %Box2%`n`n`nSite Code:`t`t%Box1%`nSite Name:`t`t%Box2%`nStore Contact:`t`t%Box3%`n`nPOS System:`t`t%Box4%`n%POSChange%`t`t%Box5%`t%Box6%`nBackup:`t`t%Kept%%NotKept%`n`nIssue began around:`t%Box7%`n`nReinstall locations:`t%MCT%%Choice1%%MC%%T%%Choice2%`n`nAdditional Information:`n%Cryp%`n%Comp%`n%AddT%`n`nAdditional Notes:`t%Box8%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 46:Text, PreviewLoyIn, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

46ButtonSend:
Gui, Submit

If(Cb_1=1)
 GuiControlGet, POSChange,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Kept,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, NotKept,, Cb_3, Text
If(Cb_4=1)
 GuiControlGet, MCT,, Cb_4, Text
If(Cb_5=1)
 GuiControlGet, MC,, Cb_5, Text
If(Cb_6=1)
 GuiControlGet, T,, Cb_6, Text
If(Cb_7=1)
 GuiControlGet, Cryp,, Cb_6, Text
 If(Cb_8=1)
 GuiControlGet, Comp,, Cb_8, Text
 If(Cb_9=1)
 GuiControlGet, AddT,, Cb_9, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Email Reinstallation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@loyaltyone.com.au"
	email.Subject := "Loyalty Reinstallation Requied - " SiteCode " " SiteName
	email.Body := "Site Code:`t`t" Box1 "`nSite Name:`t`t" Box2 "`nStore Contact:`t`t" Box3 "`n`nPOS System:`t`t" Box4 "`n" POSChange "`t`t" Box5 "`t" Box6 "`nBackup:`t`t" Kept NotKept "`n`nIssue began around:`t" Box7 "`n`nReinstall locations:`t" MCT Choice1 MC T Choice2 "`n`nAdditional Information:`n" Cryp "`n" Comp "`n" AddT "`n`nAdditional Notes:`t" Box8
	email.Send
	reload
return

46ButtonBack:
Gui, 46:Destroy
gosub Q7
return

46ButtonExit:
Reload
return

;=====================================================LOYALTY REINSTALLATION END

;=====================================================LOYALTY CALL ESCALATION

7Button6LoyaltyEscalation:
Gui, Destroy

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 44:-SysMenu +Border
Gui, 44:Color, 1d1f21, 383D46
Gui, 44:font, s12 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x19 y12 w403 , LOYALTY CALL ESCALATION
Gui, 44:font, 
Gui, 44:font, s8 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y40 h20 , Store Details: 
Gui, 44:font, 
Gui, 44:font, cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y65 w120 h20 , Site Code: 
Gui, 44:Add, Edit, -E0x200 x110 y64 w90 h18 vSiteCode,
Gui, 44:Add, Text, x20 y90 w120 h20 , Site Name: 
Gui, 44:Add, Edit, -E0x200 x110 y89 w90 h18 vSiteName,
Gui, 44:Add, Text, x20 y115 w120 h20 , Store Contact: 
Gui, 44:Add, Edit, -E0x200 x110 y114 w90 h18 vContact,
Gui, 44:Add, Text, x20 y150 w120 h20 , Card Number: 
Gui, 44:Add, Edit, -E0x200 x110 y149 w90 h18 vCardNo,
Gui, 44:Add, Text, x20 y175 w120 h20 , Customer Name: 
Gui, 44:Add, Edit, -E0x200 x110 y174 w90 h18 vCustName,
Gui, 44:Add, Text, x20 y200 w120 h20 , Docket Number: 
Gui, 44:Add, Edit, -E0x200 x110 y199 w90 h18 vDockNo,
Gui, 44:font, s8 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y250 w160 , What Issue/s are they experiencing:
Gui, 44:font, 
Gui, 44:font, cE8EBF5, Segoe UI
Gui, 44:Add, CheckBox, x20 y280 w90 h20 vCb_1 , Prompter
Gui, 44:Add, CheckBox, x20 y300 w90 h20 vCb_2 ,  Website
Gui, 44:Add, CheckBox, x20 y320 w150 h20 vCb_3 , Remap not working
Gui, 44:Add, CheckBox, x20 y340 h20 vCb_4 , Transactions/Points/Redemp

Gui, 44:Add, Text, x212 y50 w190 h20 , Error Message:
Gui, 44:Add, Edit, -E0x200 x212 y65 w170 h50 -VScroll vError, 
Gui, 44:Add, Text, x212 y130 w190 h20 , Describe Issue in Detail:
Gui, 44:Add, Edit, -E0x200 x212 y145 w170 h50 -VScroll vDesc, 
Gui, 44:Add, Text, x212 y210 w190 h20 , Steps Taken to Resolve Issue:
Gui, 44:Add, Edit, -E0x200 x212 y225 w170 h50 -VScroll vSteps, 
Gui, 44:Add, Groupbox, x18 y375 w365 h250, Preview
Gui, 44:Add, Text, x28 y400 w350 h220 vPreviewLoyEsc, 

Gui, 44:Add, Button, x212 y290 w170 h30 , Forward Escalation
Gui, 44:Add, Button, x212 y330 w80 h30 , Back
Gui, 44:Add, Button, x302 y330 w80 h30 , Exit

Gui, 44:Show, %Gui_Cord% h640 w403, %A_Space%

loop
{
    Gui, 44:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	Cb_1_Text := Cb_1 ? "Prompter " : ""
	Cb_2_Text := Cb_2 ? "Website " : ""
	Cb_3_Text := Cb_3 ? "Remap not working " : ""
	Cb_4_Text := Cb_4 ? "Transactions/Points/Redemptions " : ""
	
    msgText = To: `t`tsupport@loyaltyone.com.au`nSubject: `tLoyalty Call Escalation %SiteCode% %SiteName%`n`n`nStore Contact:`t%Contact%`nIssue With:`t%Cb_1_Text%%Cb_2_Text%%Cb_3_Text%%Cb_4_Text%`nError Message:`t%Error%`n`nCard Number:`t%CardNo%`nCustomer Name:`t%CustName%`nDocket Number:`t%DockNo%`nDetails:`t`t%Desc%`n`nSteps Taken to Resolve:`t%Steps%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 44:Text, PreviewLoyEsc, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

44ButtonBack:
Gui, 44:Destroy
gosub Q7
return
 
44ButtonForwardEscalation:
Gui, Submit

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, Cb_3_Text,, Cb_3, Text 
 If(Cb_4=1)
 GuiControlGet, Cb_4_Text,, Cb_4, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Email Escalation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@loyaltyone.com.au"
	;email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Loyalty Call Escalation " SiteCode " " SiteName ;objects like this (the email code) use strange inverted variables. The stuff in commas is plain text, the text without commas are the above variables. To enter a new line it needs to be in commas as it's code. Without commas means it's looking for a variable.
	email.Body := "Store Contact:`t`t" Contact "`n" "Issue With:`t`t" Cb_1_Text " " Cb_2_Text " " Cb_3_Text " " Cb_4_Text "`n" "Error Message:`t`t" Error "`n`n" "Card Number:`t`t" CardNo "`n" "Customer Name:`t`t" CustName "`n" "Docket Number:`t`t" DockNo "`n" "Details:`t`t`t" Desc "`n`n" "Steps Taken to Resolve:`t" Steps "`n`n - `n`n"
	email.Send
	reload
return

44ButtonExit:
Reload
return

;=====================================================LOYALTY CALL ESCALATION END

;=====================================================HSNET ACCOUNT

7ButtonHSNETAccountExistingInstallation:
    Gosub, HAEI
	WinWaitClose, ahk_class AutoHotkeyGUI
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - HSNET Account EXISTING`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\kye.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, Existing Installation - %Box1% - Please confirm Hsnet Account Exists{TAB}Hi Kye,`n`nCan you please confirm that the Hsnet account is set up for %Box1% %Box2%`n`nIf the account does not exist, could you please set it up and Email me back when complete.`n`n%Box4%`n`nKind Regards`n%Name%`n
	reload
return

HAEI:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 40:font, s8, Segoe UI
Gui, 40:font, s8, Segoe UI
Gui, 40:Add, Text, x12 y9 w120 h20 , Site Code:
Gui, 40:Add, Edit, x12 y29 w150 h20 vBox1, 
Gui, 40:Add, Text, x12 y69 w120 h20 , Store Name:
Gui, 40:Add, Edit, x12 y89 w150 h20 vBox2, 
Gui, 40:Add, Text, x182 y9 w190 h20 , Additional notes you'd like to add:
Gui, 40:Add, Edit, x182 y29 w190 h110 vBox4, 
Gui, 40:Add, Text, x195 y251 w7 h14 , 
Gui, 40:Add, Button, x182 y149 w90 h30 , &Accept
Gui, 40:Add, Button, x283 y149 w90 h30 , E&xit
Gui, 40:Show, %Gui_Cord% w386 h190, HSNET Existing
return

40ButtonAccept:
	Gui, Submit
return

40ButtonExit:
Reload
return

7ButtonHSNETAccountNEWInstallation:
    Gosub, HANI
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - HSNET Account NEW`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\kye.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, NEW Installation - %Box1% - Please set up Hsnet Account{TAB}Hi Kye,`n`nCould you please set up the Hsnet account for %Box1% %Box2%`n`n%Box4%`n`nKind Regards`n%Name%`n
	reload
return

HANI:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 41:font, s8, Segoe UI
Gui, 41:Add, Text, x12 y9 w120 h20 , Site Code:
Gui, 41:Add, Edit, x12 y29 w150 h20 vBox1, 
Gui, 41:Add, Text, x12 y69 w120 h20 , Store Name:
Gui, 41:Add, Edit, x12 y89 w150 h20 vBox2, 
Gui, 41:Add, Text, x182 y9 w190 h20 , Additional notes you'd like to add:
Gui, 41:Add, Edit, x182 y29 w190 h110 vBox4, 
Gui, 41:Add, Text, x195 y251 w7 h14 , 
Gui, 41:Add, Button, x182 y149 w90 h30 , &Accept
Gui, 41:Add, Button, x283 y149 w90 h30 , E&xit
Gui, 41:Show, %Gui_Cord% w386 h190, HSNET New
return

41ButtonAccept:
	Gui, Submit
return

41ButtonExit:
Reload
return

;=====================================================HSNET END


;=====================================================SITE RESET EMAIL

7Button1SiteReset:

IfNotExist, C:\AutoHotKey\Files\drfate.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\drfate.png, C:\AutoHotKey\Files\drfate.png
}

Gui, Destroy
Gui, 10A:Color, 1d1f21, 383D46
Gui, 10A:Add, Picture, x-48 y10 w271 h350 , C:\AutoHotKey\Files\drfate.png
Gui, 10A:Font, s10 Bold cE8EBF5, Segoe UI
Gui, 10A:Add, Text, x202 y29 w230 , Remember, if this store has STOPS, SIMPLE or Lots/Other you will need to updated the settings.dbf.`n`n(Lots + Lots does not require this.)
Gui, 10A:Add, Button, x2900 y1990 w150 h30 , Place
Gui, 10A:Add, Button, x290 y199 w150 h30 , Yes... Okay. I get it...
Gui, 10A:Show, %Gui_Cord% w466 h263, Listen to Fate
return 

10AButtonYes...Okay.Igetit...:
list2 = Yes|No|NA
Gui, 10A:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 10:-SysMenu +Border
Gui, 10:Color, 1d1f21, 383D46
Gui, 10:font, s12 bold cE8EBF5, Segoe UI
Gui, 10:Add, Text, x28 y14 h30 , SITE RESET`nEMAIL
Gui, 10:font,
Gui, 10:font, cE8EBF5, Segoe UI

;Gui, 10:Add, Text, x12 y9 w160 h20 , Who's the email being sent to?
;Gui, 10:Add, Edit, x172 y9 w80 h20 gNameCheck vBox7, 
Gui, 10:Add, Button, x152 y46 w110 h20 , Autofill

Gui, 10:Add, Text, x28 y76 w140 h20 , Site Code:
Gui, 10:Add, Edit, -E0x200 x152 y74 w110 h20 vBox1, 
Gui, 10:Add, Text, x28 y106 w150 h20 , Site Name:
Gui, 10:Add, Edit, -E0x200 x152 y104 w110 h20 vBox2, 
Gui, 10:Add, Button, x270 y133 w22 h22 , ?
Gui, 10:Add, Text, x28 y136 h20 , Months of History:
Gui, 10:Add, Edit, -E0x200 x152 y134 w110 h20 vBox3, 
Gui, 10:Add, Text, x28 y166 w140 h20 , Clients:
Gui, 10:Add, Edit, -E0x200 x152 y164 w110 h20 vBox4, 
Gui, 10:Add, Text, x28 y196 w140 h20 , Loyalty:
Gui, 10:Add, DropDownList, x152 y194 w110 vChoice1, V2|V3|NA
Gui, 10:Add, Text, x28 y226 w140 h20 , Loyalty actions
Gui, 10:Add, DropDownList, x152 y224 w110 vChoice2, Carried Balance exported|Settings.dbf updated|NA
Gui, 10:Add, Text, x28 y256 w140 h20 , Change of POS/Catman
Gui, 10:Add, DropDownList, x152 y254 w110 vChoice3, Yes|No|NA
Gui, 10:Add, Text, x28 y286 w140 h30 , Date new POS
Gui, 10:Add, Edit, -E0x200 x152 y284 w110 h20 vBox10, 
Gui, 10:Add, Text, x28 y316 w140 h20 , Staff member name:
Gui, 10:Add, Edit, -E0x200 x152 y314 w110 h20 vBox9, 
Gui, 10:Add, Text, x28 y346 w140 h20 , Reason:
Gui, 10:Add, Edit, -E0x200 x152 y344 w110 h20 vBox6,

Gui, 10:Add, Groupbox, x300 y26 w360 h382, Preview
Gui, 10:Add, Text, x320 y56 w320 h332 vPreviewSR, 

Gui, 10:Add, Button, x23 y379 w75 h30 , &Confirm
Gui, 10:Add, Button, x106 y379 w75 h30 , &Back
Gui, 10:Add, Button, x189 y379 w75 h30 , &Exit
Gui, 10:Show, %Gui_Cord% w686 h430, %A_Space%

loop
{
    Gui, 10:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`tdhobden@intellipharm.com.au`nCC:`t`tbrodie.creaser/rick@intellipharm.com.au`nSubject: `tSITE RESET EMAIL - %Box1% %Box2%`n`n`n%Box1%`n%Box2%`nReason: %Box6%`n`nMonths of History:`t`t%Box3%`nClients:`t`t`t`t%Box4%`n`nLoyalty:`t`t`t`t%Choice1%`nLoyalty Actions:`t`t`t%Choice2%`nChange of POS/Catman:`t`t%Choice3%`nDate of New POS:`t`t%Box10%`n`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 10:Text, PreviewSR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}


return

10Button?:
;InputBox, count, STARTUP TIME,Please set the time you would like HSNET to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,00:15
InputBox, count, DATE, Format: yyyyMMdd

T1=%count%
;T2=20110228010203

x := ElapsedTime(T1)

Answer := x.Yr * (12) + x.Mon

MsgBox % "Months since " T1 "`n"
;. "`n" x.Yr		" Years"
;. "`n" x.Mon	" Months"
. "`n" Answer	" Months"
;. "`n" x.Day	" Days"
;. "`n" x.Hr		" Hours"
;. "`n" x.Min	" Minutes"
;. "`n" x.Sec	" Seconds"

;x := ElapsedTime(T1, T2)
;MsgBox % "Duration between " T1 "`nand " T2 "`n" 
;. "`n" x.Yr		" Years"
;. "`n" x.Mon	" Months"
;. "`n" x.Day	" Days"
;. "`n" x.Hr		" Hours"
;. "`n" x.Min	" Minutes"
;. "`n" x.Sec	" Seconds"
ElapsedTime(T1, T2:=""){  ; http://www.autohotkey.com/board/topic/119833-elapsed-time-calculator/
	;if (T1>T2)
	;	Tx:=T1,T1:=T2,T2:=Tx,Neg:=1
	FormatTime,T1,%T1%,yyyyMMdd
	FormatTime,T2,%T2%,yyyyMMdd
	Yr:=SubStr(T2,1,4)-(Yr1:=SubStr(T1,1,4)),Mon:=SubStr(T2,5,2)-(Mon1:=SubStr(T1,5,2)),Day:=SubStr(T2,7,2)-SubStr(T1,7,2)
	Hr:=SubStr(T2,9,2)-SubStr(T1,9,2),Min:=SubStr(T2,11,2)-SubStr(T1,11,2),Sec:=SubStr(T2,13,2)-SubStr(T1,13,2),Res:=[]
	if Sec<0
		Sec+=60,Min--
	if Min<0
		Min+=60,Hr--
	if Hr<0
		Hr+=24,Day--
	if Day<0
		Day+=(Mon1~="[469]|11")?30:Mon1=2?(Mod(Yr1,4)?28:29):31,Mon--
	if Mon<0
		Mon+=12,Yr--
	for each,v in StrSplit("Yr,Mon,Day,Hr,Min,Sec",",")
		x:=%v%*(Neg?-1:1),Res[v]:=(T1&&T2)?x:"Error"
	return Res
} 
return

10ButtonAutofill:
v1 := "Store ID"
v2 := "Name"
    if errorlevel
        return
    RegExMatch(clipboard, "m)^" v1 "(.+)$", a)
    RegExMatch(clipboard, "m)^" v2 "(.+)$", b)
    if !(a1 and b1)
        MsgBox ,,Error, Not found. Please copy the Site IQ record in full.
    else
		Gui, 10:Destroy
		Gui, Destroy
		IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

		Gui, 10:-SysMenu +Border
		Gui, 10:Color, 1d1f21, 383D46
		Gui, 10:font, s12 bold cE8EBF5, Segoe UI
		Gui, 10:Add, Text, x28 y14 h30 , SITE RESET`nEMAIL
		Gui, 10:font,
		Gui, 10:font, cE8EBF5, Segoe UI

		;Gui, 10:Add, Text, x12 y9 w160 h20 , Who's the email being sent to?
		;Gui, 10:Add, Edit, x172 y9 w80 h20 gNameCheck vBox7, 
		Gui, 10:Add, Button, x152 y46 w110 h20 , Autofill

		Gui, 10:Add, Text, x28 y76 w140 h20 , Site Code:
		Gui, 10:Add, Edit, -E0x200 x152 y74 w110 h20 vBox1, % trim(a1)
		Gui, 10:Add, Text, x28 y106 w150 h20 , Site Name:
		Gui, 10:Add, Edit, -E0x200 x152 y104 w110 h20 vBox2, % trim(b1)
		Gui, 10:Add, Button, x270 y133 w22 h22 , ?
		Gui, 10:Add, Text, x28 y136 h20 , Months of History:
		Gui, 10:Add, Edit, -E0x200 x152 y134 w110 h20 vBox3, 
		Gui, 10:Add, Text, x28 y166 w140 h20 , Clients:
		Gui, 10:Add, Edit, -E0x200 x152 y164 w110 h20 vBox4, 
		Gui, 10:Add, Text, x28 y196 w140 h20 , Loyalty:
		Gui, 10:Add, DropDownList, x152 y194 w110 vChoice1, V2|V3|NA
		Gui, 10:Add, Text, x28 y226 w140 h20 , Loyalty Actions:
		Gui, 10:Add, DropDownList, x152 y224 w110 vChoice2, Carried Balance exported|Settings.dbf updated|NA
		Gui, 10:Add, Text, x28 y256 w140 h20 , Change of POS/Catman
		Gui, 10:Add, DropDownList, x152 y254 w110 vChoice3, Yes|No|NA
		Gui, 10:Add, Text, x28 y286 w140 h30 , Date new POS
		Gui, 10:Add, Edit, -E0x200 x152 y284 w110 h20 vBox10, 
		Gui, 10:Add, Text, x28 y316 w140 h20 , Staff member name:
		Gui, 10:Add, Edit, -E0x200 x152 y314 w110 h20 vBox9, 
		Gui, 10:Add, Text, x28 y346 w140 h20 , Reason:
		Gui, 10:Add, Edit, -E0x200 x152 y344 w110 h20 vBox6,

		Gui, 10:Add, Groupbox, x300 y26 w360 h382, Preview
		Gui, 10:Add, Text, x320 y56 w320 h332 vPreviewSR, 

		Gui, 10:Add, Button, x23 y379 w75 h30 , &Confirm
		Gui, 10:Add, Button, x106 y379 w75 h30 , &Back
		Gui, 10:Add, Button, x189 y379 w75 h30 , &Exit
		Gui, 10:Show, %Gui_Cord% w686 h430, %A_Space%

		loop
		{
			Gui, 10:Submit, NoHide
			FormatTime, Date,, yyyy/MM/dd
			FormatTime, Time,, h:mmtt
			
			msgText = To: `t`tdhobden@intellipharm.com.au`nCC:`t`tbrodie.creaser/rick@intellipharm.com.au`nSubject: `tSITE RESET EMAIL - %Box1% %Box2%`n`n`n%Box1%`n%Box2%`nReason: %Box6%`n`nMonths of History:`t`t%Box3%`nClients:`t`t`t`t%Box4%`n`nLoyalty:`t`t`t`t%Choice1%`nLoyalty Actions:`t`t`t%Choice2%`nChange of POS/Catman:`t`t%Choice3%`nDate of New POS:`t`t%Box10%`n`n%Name%

			if NOT (msgText == oldMsgText)
			{
			GuiControl, 10:Text, PreviewSR, %msgText%
			oldMsgText := msgText
			}

			sleep 100
		}


		return

10ButtonBack:
Gui, 10:Destroy
gosub Q7
return

10ButtonExit:
Reload
return

10ButtonConfirm:
	Gui, Submit
GuiControlGet, MyDateTime
	
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Site Reset Email`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

str = 
( %
<html>
<head>
<title>SITE RESET</title>
</head>
<body style="margin: 0 !important; padding: 0 !important;">
<table border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center" style="font-size: 32px; font-family: Segoe UI, Arial, sans-serif; color: #333333; padding-top: 30px;" class="padding-copy">SITE RESET</td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 0 0 0 0; font-size: 16px; line-height: 25px; font-family: Segoe UI, Arial, sans-serif; color: #666666;" class="padding-copy">
)
str2 =
( %
<br>
)
str3 =
( %
</br><br>Reason: &nbsp;
)
str4 =
( %
 </br></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;" class="padding">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td style="padding: 10px 0 0 0; border-top: 3px solid #eaeaea;">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px; font-weight: bold;">Months of History</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">
)
str5 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px; font-weight: bold;">Clients</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">
)
str6 = 
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 10px 0 0 0; border-top: 3px solid #eaeaea; border-bottom: 3px solid #eaeaea;">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Loyalty</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str7 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Loyalty Actions</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str8 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Change of POS/Catman</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str9 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 10px 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Date of New POS</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str10 = 
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left" style="padding: 0 0 0 0; font-size: 14px; line-height: 18px; font-family: Segoe UI, Arial, sans-serif; color: #aaaaaa; font-style: italic;" class="padding-copy">
)
str11 =
( %
</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="500" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" style="padding-top: 25px;" class="padding">
                                                <table border="0" cellspacing="0" cellpadding="0" class="mobile-button-container">
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
)

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To := "dhobden@intellipharm.com.au"
email.Cc := "brodie.creaser@intellipharm.com.au; rick@intellipharm.com.au"
email.Subject := "SITE RESET EMAIL " Box1 " " Box2 ;objects like this (the email code) use strange inverted variables. The stuff in commas is plain text, the text without commas are the above variables. To enter a new line it needs to be in commas as it's code. Without commas means it's looking for a variable.
email.HTMLBody := str . Box2 . str2 . Box1 . str3 . Box6 . str4 . Box3 . str5 . Box4 . str6 . Choice1 . str7 . Choice2 . str8 . Choice3 . str9 . Box10 . str10 . Name . str11
email.Display
	
	reload
return

;=====================================================SITE RESET EMAIL END

;=====================================================FRED EXCEL

7Button2FredExcelForm:
Gui, Destroy

Gui, 47:-SysMenu +Border
Gui, 47:Color, 1d1f21, 383D46
Gui, 47:font, s12 bold cE8EBF5, Segoe UI
Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
Gui, 47:font,
Gui, 47:font, cE8EBF5, Segoe UI
Gui, 47:Add, Button, x152 y39 w110 h20 , Autofill
Gui, 47:Add, Text, x28 y71 w140 h20 , Store ID:
Gui, 47:Add, Edit, -E0x200 x152 y69 w110 h20 vBox7,
Gui, 47:Add, Text, x28 y101 w160 h20 , Pharmacy Name:
Gui, 47:Add, Edit, -E0x200 x152 y99 w110 h20 vBox1, 
Gui, 47:Add, Text, x28 y131 w150 h20 , Address:
Gui, 47:Add, Edit, -E0x200 x152 y129 w110 h20 vBox3, 
Gui, 47:Add, Text, x28 y161 w140 h20 , Suburb:
Gui, 47:Add, Edit, -E0x200 x152 y159 w110 h20 vBox4, 
Gui, 47:Add, Text, x28 y191 w140 h20 , Phone:
Gui, 47:Add, Edit, -E0x200 x152 y189 w110 h20 vBox5, 
Gui, 47:Add, Text, x28 y221 w140 h20 , Mobile:
Gui, 47:Add, Edit, -E0x200 x152 y219 w110 h20 vBox6,
Gui, 47:Add, Text, x28 y251 w160 h20 , Clients:
Gui, 47:Add, Edit, -E0x200 x152 y249 w110 h20 vBox2, 
Gui, 47:Add, Text, x28 y281 w140 h20 , Primary Contact:
Gui, 47:Add, Edit, -E0x200 x152 y279 w110 h20 vBox8,
Gui, 47:Add, Text, x28 y311 w140 h30 , Secondary Contact:
Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
Gui, 47:Add, Button, x23 y345 w75 h30 , &Confirm
Gui, 47:Add, Button, x106 y345 w75 h30 , &Back
Gui, 47:Add, Button, x189 y345 w75 h30 , &Exit

Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 47:Add, Text, x320 y76 w320 h250 vFredExcelPrev, 

Gui, 47:Show, %Gui_Cord% w686 h395,%A_Space%

loop
{
    Gui, 47:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
	IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

    msgText = To: `t`tdataaccessrequest@fred.com.au`nCC:`t`tsupport@intellipharm.com.au`nSubject:`t`tData Access Request for - %Box1% from Intellipharm`n`n`nHi, `nDocument attached with store details for FRED Credential Request.`nStore name: %Box1%`nSite Code: %Box7%`n`nKind Regards,`n%Name% %Surname%`nIntellipharm`n1300 255 160

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 47:Text, FredExcelPrev, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}


return

47ButtonAutofill:
v1 := "Store ID"
v2 := "Name"
v3 := "Street Address 1"
v4 := "Street Address 2"
v5 := "Suburb"
v6 := "Phone	"
    if errorlevel
        return
    RegExMatch(clipboard, "m)^" v1 "(.+)$", a)
    RegExMatch(clipboard, "m)^" v2 "(.+)$", b)
	RegExMatch(clipboard, "m)^" v3 "(.+)$", c)
    RegExMatch(clipboard, "m)^" v4 "(.+)$", d)
	RegExMatch(clipboard, "m)^" v5 "(.+)$", e)
	RegExMatch(clipboard, "m)^" v6 "(.+)$", f)
    if !(a1 and b1)
        MsgBox ,,Error, Not found. Please copy the Site IQ record in full.
    else

	ad1 	:= % trim(c1)
	ad2 	:= % trim(d1)
	
		Gui, 47:Destroy

		Gui, 47:-SysMenu +Border
		Gui, 47:Color, 1d1f21, 383D46
		Gui, 47:font, s12 bold cE8EBF5, Segoe UI
		Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
		Gui, 47:font,
		Gui, 47:font, cE8EBF5, Segoe UI
		Gui, 47:Add, Button, x152 y39 w110 h20 , Autofill
		Gui, 47:Add, Text, x28 y71 w140 h20 , Store ID:
		Gui, 47:Add, Edit, -E0x200 x152 y69 w110 h20 vBox7, % trim(a1)
		Gui, 47:Add, Text, x28 y101 w160 h20 , Pharmacy Name:
		Gui, 47:Add, Edit, -E0x200 x152 y99 w110 h20 vBox1, % trim(b1)
		Gui, 47:Add, Text, x28 y131 w150 h20 , Address:
		Gui, 47:Add, Edit, -E0x200 x152 y129 w110 h20 vBox3, %ad1% %ad2%
		Gui, 47:Add, Text, x28 y161 w140 h20 , Suburb:
		Gui, 47:Add, Edit, -E0x200 x152 y159 w110 h20 vBox4, % trim(e1)
		Gui, 47:Add, Text, x28 y191 w140 h20 , Phone:
		Gui, 47:Add, Edit, -E0x200 x152 y189 w110 h20 vBox5, % trim(f1)
		Gui, 47:Add, Text, x28 y221 w140 h20 , Mobile:
		Gui, 47:Add, Edit, -E0x200 x152 y219 w110 h20 vBox6,
		Gui, 47:Add, Text, x28 y251 w160 h20 , Clients:
		Gui, 47:Add, Edit, -E0x200 x152 y249 w110 h20 vBox2, 
		Gui, 47:Add, Text, x28 y281 w140 h20 , Primary Contact:
		Gui, 47:Add, Edit, -E0x200 x152 y279 w110 h20 vBox8,
		Gui, 47:Add, Text, x28 y311 w140 h30 , Secondary Contact:
		Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
		Gui, 47:Add, Button, x23 y345 w75 h30 , &Confirm
		Gui, 47:Add, Button, x106 y345 w75 h30 , &Back
		Gui, 47:Add, Button, x189 y345 w75 h30 , &Exit

		Gui, 47:font, cE8EBF5

		Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
		Gui, 47:Add, Text, x320 y76 w320 h250 vFredExcelPrev, 

		Gui, 47:Show, %Gui_Cord% w686 h395, %A_Space%

		loop
		{
			Gui, 47:Submit, NoHide
			FormatTime, Date,, yyyy/MM/dd
			FormatTime, Time,, h:mmtt
			
			IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
			IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

			msgText = To: `t`tdataaccessrequest@fred.com.au`nCC:`t`tsupport@intellipharm.com.au`nSubject:`t`tData Access Request for - %Box1% from Intelllipharm`n`n`nHi, `nDocument attached with store details for FRED Credential Request.`nStore name: %Box1%`nSite Code: %Box7%`n`nKind Regards,`n%Name% %Surname%`nIntellipharm`n1300 255 160

			if NOT (msgText == oldMsgText)
			{
			GuiControl, 47:Text, FredExcelPrev, %msgText%
			oldMsgText := msgText
			}

			sleep 100
		}


		return


47ButtonExit:
Reload
return

47ButtonBack:
Gui, 47:Destroy
gosub Q7
return

47ButtonConfirm:
gui, submit

;WinWaitClose, ahk_class AutoHotkeyGUI

IfNotExist, C:\AutoHotKey\Files\FRED.xlsx
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\FRED.xlsx, C:\AutoHotKey\Files\FRED.xlsx, 1
}

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - FRED Excel Form`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

WorkBookPath		:= "C:\AutoHotKey\Files\FRED.xlsx"											; store the path to the workbook
objExcel					:= ComObjCreate("Excel.Application")        			; create a handle to a new excel application
objWorkBook		:= objExcel.Workbooks.Open(WorkBookPath)    	; opens the existing excel table
objExcel.Visible		:= FALSE                                    									; make excel visible

objExcel.Range("A1").Value := "Pharmacy Name"
objExcel.Range("B1").Value := "Client/Service"
objExcel.Range("C1").Value := "Address"
objExcel.Range("D1").Value := "Suburb"
objExcel.Range("E1").Value := "Phone"
objExcel.Range("F1").Value := "Mobile"
objExcel.Range("G1").Value := "Sitecode"
objExcel.Range("H1").Value := "Primary Contact"
objExcel.Range("I1").Value := "Secondary Contact"

objExcel.Range("A2").Value := Box1
objExcel.Range("B2").Value := Box2
objExcel.Range("C2").Value := Box3
objExcel.Range("D2").Value := Box4
objExcel.Range("E2").Value := Box5
objExcel.Range("F2").Value := Box6
objExcel.Range("G2").Value := Box7
objExcel.Range("H2").Value := Box8
objExcel.Range("I2").Value := Box9

objExcel.Range("A1:I1").Font.Bold := 1

;objExcel.Column("A1:I1").ColumnWidth := 15

objExcel.Range("A1:I1").ColumnWidth := 20
;objExcel.Range("A1:I1").Columns.AutoFit

objWorkBook.Save
objExcel.Quit()
objExcel 	:= ""

FileCopy, C:\AutoHotKey\Files\FRED.xlsx, C:\AutoHotKey\FRED Access %Box1%.xlsx

gosub, FredEmailObject

FredEmailObject:

	Gui, FredConf:+AlwaysOnTop -SysMenu -Border
	Gui, FredConf:Margin, 16, 16
	Gui, FredConf:Color, 1d1f21
	Gui, FredConf:Font, s11, Segoe UI

	Gui, FredConf:Add, Text, xm cFFFFFF -E0x200 , Would you like to copy this for your site note?
	Gui, FredConf:Add, Text, xm w320 c00ff00 -E0x200 , %Time% - POSX Install #OUT #EMAIL - Spoke to %Box8% (confirmed using STOPS - YES) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box8% 2. %Box9%

	Gui, FredConf:Add, Button, xm w150 h30 gFredConYES, YES
	Gui, FredConf:Add, Button, x+20 w150 h30 gFredConNo, NO
	Gui, FredConf:Show, , Fred Confirmation

return

reload
return

FredConYES:
Clipboard = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box8% (confirmed using STOPS - YES) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box8% 2. %Box9%
TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Fred Confirmation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
attach	:= "C:\AutoHotKey\FRED Access " Box1 ".xlsx"

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
;email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intelllipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return

FredConNO:
attach	:= "C:\AutoHotKey\FRED Access " Box1 ".xlsx"

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
;email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intelllipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return

;=====================================================FRED EXCEL END

^NumpadDot::
gosub MM
return

MM:

If (GetKeyState("Shift", "P"))
	{
		MsgBox, ,LINE , %A_LineNumber%
	}

Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
IniRead, vMacro0, C:\AutoHotKey\settings.ini, MACROLIST, MACRO0
IniRead, vMacro1, C:\AutoHotKey\settings.ini, MACROLIST, MACRO1
IniRead, vMacro2, C:\AutoHotKey\settings.ini, MACROLIST, MACRO2
IniRead, vMacro3, C:\AutoHotKey\settings.ini, MACROLIST, MACRO3
IniRead, vMacro4, C:\AutoHotKey\settings.ini, MACROLIST, MACRO4
IniRead, vMacro5, C:\AutoHotKey\settings.ini, MACROLIST, MACRO5
IniRead, vMacro6, C:\AutoHotKey\settings.ini, MACROLIST, MACRO6
IniRead, vMacro7, C:\AutoHotKey\settings.ini, MACROLIST, MACRO7
IniRead, vMacro8, C:\AutoHotKey\settings.ini, MACROLIST, MACRO8
IniRead, vMacro9, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

Gui, 98:-SysMenu +Border
Gui, 98:Margin, 16, 16
Gui, 98:Color, 1d1f21, 383D46

Gui, 98:Font, s11 cc5c8c6 , Segoe UI
Gui, 98:Add, Text, x15 y15 h20 , ] 0
Gui, 98:Add, Text, yp+40 h20 , ] 1
Gui, 98:Add, Text, yp+40 h20 , ] 2
Gui, 98:Add, Text, yp+40 h20 , ] 3
Gui, 98:Add, Text, yp+40 h20 , ] 4
Gui, 98:Add, Text, yp+40 h20 , ] 5
Gui, 98:Add, Text, yp+40 h20 , ] 6
Gui, 98:Add, Text, yp+40 h20 , ] 7
Gui, 98:Add, Text, yp+40 h20 , ] 8
Gui, 98:Add, Text, yp+40 h20 , ] 9

Gui, 98:Font, s8 cc5c8c6, Segoe UI
Gui, 98:Add, Edit, x45 y10 w340 h32 -E0x200 vCTRL0, %vMacro0%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL1, %vMacro1%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL2, %vMacro2%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL3, %vMacro3%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL4, %vMacro4%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL5, %vMacro5%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL6, %vMacro6%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL7, %vMacro7%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL8, %vMacro8%
Gui, 98:Add, Edit, yp+40 w340 h32 -E0x200 vCTRL9, %vMacro9%

Gui, 98:Font, S8 cc5c8c6, Segoe UI
Gui, 98:Add, Text, x12 y414 w160, For key functions, like entering a new line, type {ENTER}. To see more key shortcuts
Gui, 98:Font, S8 CAqua Underline
Gui, 98:Add, Text, yp+40 GLINK , check here.

Gui, 98:Font, 
Gui, 98:Font, bold
Gui, 98:Add, Button, x175 y410 w210 h30 , Save
Gui, 98:Font, 

Gui, 98:Add, Button, x175 y441 w104 h30, Back
Gui, 98:Add, Button, x281 y441 w104 h30 , Exit

Gui, 98:Show, w400 h480,%A_Space%
hCurs:=DllCall("LoadCursor","UInt",NULL,"Int",32649,"UInt") ;IDC_HAND
OnMessage(0x200,"WM_MOUSEMOVE")
return

WM_MOUSEMOVE(wParam,lParam)
{
Global hCurs
MouseGetPos,,,,ctrl
;Only change over certain controls, use Windows Spy to find them.
If ctrl in Static12.
DllCall("SetCursor","UInt",hCurs)
Return
}

LINK:
Run,https://autohotkey.com/docs/KeyList.htm
Return

98ButtonBack:
Gui, 98:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
Return

98ButtonSave:
Gui Submit
IniWrite %CTRL0%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO0
IniWrite %CTRL1%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO1
IniWrite %CTRL2%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO2
IniWrite %CTRL3%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO3
IniWrite %CTRL4%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO4
IniWrite %CTRL5%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO5
IniWrite %CTRL6%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO6
IniWrite %CTRL7%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO7
IniWrite %CTRL8%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO8
GoSub MM
return

98ButtonExit:
Reload
return

!+e::
Send, ^c
sleep 200
run, http://lwoms.chemmart.com.au/lwoms/detail/orderDetail.jsp?orderNumber=%Clipboard%
return

;HOTKEYS
; "ALT + LEFT" for previous 
!Left::Media_Prev

; "ALT + RIGHT" for next 
!Right::Media_Next

; "ALT + UP" for pause
!UP::Media_Play_Pause

;TEXT REPLACE
::=/=::≠
::loyatly::loyalty
::phamracy::pharmacy

GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
reload
return

AppsKey & UP::
InputBox, uName, Backend, Enter your Username, hide, 180, 125
If uName = Gentleman
  InputBox, uPass, Backend, Enter your Password, hide, 180, 125
Else
  {
    Msgbox, 48, Error, Incorrect credentials
    Goto, GuiClose
  }

If uPass = Whisper
  Goto, TheX
Else
  Msgbox, 48, Error, Incorrect credentials
  reload

TheX:

FormatTime, Date,, yyyyMMdd

IniRead, Aaron, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date%.ini, Count Points, Points, 0
IniRead, Craig, G:\Support\Public Staff Folders\Aaron\points\Craig\%date%.ini, Count Points, Points, 0
IniRead, Brodie, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date%.ini, Count Points, Points, 0
IniRead, Jim, G:\Support\Public Staff Folders\Aaron\points\James\%date%.ini, Count Points, Points, 0
IniRead, Joel, G:\Support\Public Staff Folders\Aaron\points\Joel\%date%.ini, Count Points, Points, 0
IniRead, Josh, G:\Support\Public Staff Folders\Aaron\points\Josh\%date%.ini, Count Points, Points, 0
IniRead, Renae, G:\Support\Public Staff Folders\Aaron\points\Renae\%date%.ini, Count Points, Points, 0
IniRead, Rick, G:\Support\Public Staff Folders\Aaron\points\Rick\%date%.ini, Count Points, Points, 0

Gui, EE:-Caption +Border

Gui, EE:Add, Button, x1700 y100, Place

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Color, 1d1f21, 383D46

Gui, EE:Add, Button, x0 y0 w20 h20, AA
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x0 y20 w20 h20, %Aaron%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x20 y00 w20 h20, CD
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x20 y20 w20 h20, %Craig%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x40 y0 w20 h20, BR
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x40 y20 w20 h20, %Brodie%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x60 y0 w20 h20, JA
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x60 y20 w20 h20, %Jim%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x80 y0 w20 h20, JL
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x80 y20 w20 h20, %Joel%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x100 y0 w20 h20, JH
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x100 y20 w20 h20, %Josh%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x120 y0 w20 h20, RE
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x120 y20 w20 h20, %Renae%

Gui, EE:font, s7 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x140 y0 w20 h20, RI
Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x140 y20 w20 h20, %Rick%

Gui, EE:font, s8 bold cE8EBF5, Segoe UI
Gui, EE:Add, Button, x160 y0 w20 h40, X

Gui, EE:Show, x5 y5 w180 h40, ZERO
return

EEButtonAA:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Aaron\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, AARON
return

EEButtonAN:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Craig\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Craig\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Craig\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Craig\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Craig\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, Craig
return

EEButtonBR:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Brodie\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, BRODIE
return

EEButtonJA:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\James\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\James\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\James\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\James\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\James\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, JAMES
return

EEButtonJL:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Joel\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Joel\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Joel\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Joel\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Joel\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, JOEL
return

EEButtonJH:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Josh\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Josh\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Josh\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Josh\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Josh\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, JOSH
return

EEButtonRE:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Renae\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Renae\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Renae\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Renae\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Renae\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, RENAE
return

EEButtonRI:
Gui, EE2:Destroy
FileRead, IN, G:\Support\Public Staff Folders\Aaron\points\Rick\%date% Install.txt
FileRead, DO, G:\Support\Public Staff Folders\Aaron\points\Rick\%date% Data Out.txt
FileRead, QA, G:\Support\Public Staff Folders\Aaron\points\Rick\%date% QA.txt
FileRead, TI, G:\Support\Public Staff Folders\Aaron\points\Rick\%date% Loy Install.txt
FileRead, TC, G:\Support\Public Staff Folders\Aaron\points\Rick\%date% Till Config.txt
Gui, EE2:-Caption +Border
Gui, EE2:font, s7 bold cE8EBF5, Segoe UI
Gui, EE2:Color, 1d1f21, 383D46
Gui, EE2:Add, Edit, x1111 y1111 w202 h84, placeholder
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y0 w60 h80, Install`n%IN%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x60 y0 w60 h80, Data Out`n%DO%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x120 y0 w60 h80, QA`n%QA%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x0 y80 w90 h60, Till Install`n%TI%
Gui, EE2:Add, Edit, readonly -tabstop -VScroll x90 y80 w90 h60, Till Config`n%TC%
Gui, EE2:Show, x5 y46 w180 h140, RICK
return

EEButtonX:
reload
return

FullReport:
AppsKey & Down::
IfNotExist, C:\AutoHotKey\pointreport.xlsx
	{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\pointreport.xlsx, C:\AutoHotKey\pointreport.xlsx
	}

InputBox, uName, Backend, Enter your Username, hide, 180, 125
If uName = Alpha
  InputBox, uPass, Backend, Enter your Password, hide, 180, 125
Else
  {
    Msgbox, 48, Error, Incorrect credentials
    Goto, GuiClose
  }

If uPass = Bravo
  Goto, WeekPoints
Else
  Msgbox, 48, Error, Incorrect credentials
  reload

WeekPoints:

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

IniRead, AaronFri, G:\Support\Public Staff Folders\Aaron\points\Aaron\%fri%.ini, Count Points, Points, 0
IniRead, CraigFri, G:\Support\Public Staff Folders\Aaron\points\Craig\%fri%.ini, Count Points, Points, 0
IniRead, BrodieFri, G:\Support\Public Staff Folders\Aaron\points\Brodie\%fri%.ini, Count Points, Points, 0
IniRead, JimFri, G:\Support\Public Staff Folders\Aaron\points\James\%fri%.ini, Count Points, Points, 0
IniRead, JoelFri, G:\Support\Public Staff Folders\Aaron\points\Joel\%fri%.ini, Count Points, Points, 0
IniRead, JoshFri, G:\Support\Public Staff Folders\Aaron\points\Josh\%fri%.ini, Count Points, Points, 0
IniRead, RenaeFri, G:\Support\Public Staff Folders\Aaron\points\Renae\%fri%.ini, Count Points, Points, 0
IniRead, RickFri, G:\Support\Public Staff Folders\Aaron\points\Rick\%fri%.ini, Count Points, Points, 0

IniRead, AaronThu, G:\Support\Public Staff Folders\Aaron\points\Aaron\%thur%.ini, Count Points, Points, 0
IniRead, CraigThu, G:\Support\Public Staff Folders\Aaron\points\Craig\%thur%.ini, Count Points, Points, 0
IniRead, BrodieThu, G:\Support\Public Staff Folders\Aaron\points\Brodie\%thur%.ini, Count Points, Points, 0
IniRead, JimThu, G:\Support\Public Staff Folders\Aaron\points\James\%thur%.ini, Count Points, Points, 0
IniRead, JoelThu, G:\Support\Public Staff Folders\Aaron\points\Joel\%thur%.ini, Count Points, Points, 0
IniRead, JoshThu, G:\Support\Public Staff Folders\Aaron\points\Josh\%thur%.ini, Count Points, Points, 0
IniRead, RenaeThu, G:\Support\Public Staff Folders\Aaron\points\Renae\%thur%.ini, Count Points, Points, 0
IniRead, RickThu, G:\Support\Public Staff Folders\Aaron\points\Rick\%thur%.ini, Count Points, Points, 0

IniRead, AaronWed, G:\Support\Public Staff Folders\Aaron\points\Aaron\%wed%.ini, Count Points, Points, 0
IniRead, CraigWed, G:\Support\Public Staff Folders\Aaron\points\Craig\%wed%.ini, Count Points, Points, 0
IniRead, BrodieWed, G:\Support\Public Staff Folders\Aaron\points\Brodie\%wed%.ini, Count Points, Points, 0
IniRead, JimWed, G:\Support\Public Staff Folders\Aaron\points\James\%wed%.ini, Count Points, Points, 0
IniRead, JoelWed, G:\Support\Public Staff Folders\Aaron\points\Joel\%wed%.ini, Count Points, Points, 0
IniRead, JoshWed, G:\Support\Public Staff Folders\Aaron\points\Josh\%wed%.ini, Count Points, Points, 0
IniRead, RenaeWed, G:\Support\Public Staff Folders\Aaron\points\Renae\%wed%.ini, Count Points, Points, 0
IniRead, RickWed, G:\Support\Public Staff Folders\Aaron\points\Rick\%wed%.ini, Count Points, Points, 0

IniRead, AaronTue, G:\Support\Public Staff Folders\Aaron\points\Aaron\%tue%.ini, Count Points, Points, 0
IniRead, CraigTue, G:\Support\Public Staff Folders\Aaron\points\Craig\%tue%.ini, Count Points, Points, 0
IniRead, BrodieTue, G:\Support\Public Staff Folders\Aaron\points\Brodie\%tue%.ini, Count Points, Points, 0
IniRead, JimTue, G:\Support\Public Staff Folders\Aaron\points\James\%tue%.ini, Count Points, Points, 0
IniRead, JoelTue, G:\Support\Public Staff Folders\Aaron\points\Joel\%tue%.ini, Count Points, Points, 0
IniRead, JoshTue, G:\Support\Public Staff Folders\Aaron\points\Josh\%tue%.ini, Count Points, Points, 0
IniRead, RenaeTue, G:\Support\Public Staff Folders\Aaron\points\Renae\%tue%.ini, Count Points, Points, 0
IniRead, RickTue, G:\Support\Public Staff Folders\Aaron\points\Rick\%tue%.ini, Count Points, Points, 0

IniRead, AaronMon, G:\Support\Public Staff Folders\Aaron\points\Aaron\%mon%.ini, Count Points, Points, 0
IniRead, CraigMon, G:\Support\Public Staff Folders\Aaron\points\Craig\%mon%.ini, Count Points, Points, 0
IniRead, BrodieMon, G:\Support\Public Staff Folders\Aaron\points\Brodie\%mon%.ini, Count Points, Points, 0
IniRead, JimMon, G:\Support\Public Staff Folders\Aaron\points\James\%mon%.ini, Count Points, Points, 0
IniRead, JoelMon, G:\Support\Public Staff Folders\Aaron\points\Joel\%mon%.ini, Count Points, Points, 0
IniRead, JoshMon, G:\Support\Public Staff Folders\Aaron\points\Josh\%mon%.ini, Count Points, Points, 0
IniRead, RenaeMon, G:\Support\Public Staff Folders\Aaron\points\Renae\%mon%.ini, Count Points, Points, 0
IniRead, RickMon, G:\Support\Public Staff Folders\Aaron\points\Rick\%mon%.ini, Count Points, Points, 0

AaronTotal 		:= AaronFri + AaronThu + AaronWed + AaronTue + AaronMon
CraigTotal 		:= CraigFri + CraigThu + CraigWed + CraigTue + CraigMon
BrodieTotal 	:= BrodieFri + BrodieThu + BrodieWed + BrodieTue + BrodieMon
JimTotal 		:= JimFri + JimThu + JimWed + JimTue + JimMon
JoelTotal 		:= JoelFri + JoelThu + JoelWed + JoelTue + JoelMon
JoshTotal 		:= JoshFri + JoshThu + JoshWed + JoshTue + JoshMon
RenaeTotal 		:= RenaeFri + RenaeThu + RenaeWed + RenaeTue + RenaeMon
RickTotal 		:= RickFri + RickThu + RickWed + RickTue + RickMon

NiceMon = %a_now%
NiceMon += -4, days
FormatTime, NiceMon, %NiceMon%, dd/MM/yyyy
NiceTue = %a_now%
NiceTue += -3, days
FormatTime, NiceTue, %NiceTue%, dd/MM/yyyy
NiceWed = %a_now%
NiceWed += -2, days
FormatTime, NiceWed, %NiceWed%, dd/MM/yyyy
NiceThu = %a_now%
NiceThu += -1, days
FormatTime, NiceThu, %NiceThu%, dd/MM/yyyy
FormatTime, NiceFri, %NiceFri%, dd/MM/yyyy


XL := ComObjCreate("Excel.Application")
XL.WorkBooks.Add

XL.Range("A2").Value := "Aaron"
XL.Range("A3").Value := "Craig"
XL.Range("A4").Value := "Brodie"
XL.Range("A5").Value := "Jim"
XL.Range("A6").Value := "Joel"
XL.Range("A7").Value := "Josh"
XL.Range("A8").Value := "Renae"
XL.Range("A9").Value := "Rick"

XL.Range("B1").Value := Points
XL.Range("B2").Value := AaronTotal
XL.Range("B3").Value := CraigTotal
XL.Range("B4").Value := BrodieTotal
XL.Range("B5").Value := JimTotal
XL.Range("B6").Value := JoelTotal
XL.Range("B7").Value := JoshTotal
XL.Range("B8").Value := RenaeTotal
XL.Range("B9").Value := RickTotal

XL.Range("A1:B9").Select
XL.ActiveSheet.Shapes.AddChart.Select
XL.ActiveChart.ChartType := 51
XL.ActiveChart.ClearToMatchStyle
XL.ActiveChart.ChartStyle := 44
XL.ActiveChart.ClearToMatchStyle

XL.ActiveSheet.ChartObjects("Chart 1").Activate
XL.ActiveChart.SetElement(102)
XL.ActiveChart.SetElement(2)
XL.ActiveChart.ChartTitle.Text := "CURRENT WEEK TOTALS"

XL.ActiveSheet.ChartObjects("Chart 1").Activate
XL.ActiveSheet.Shapes("Chart 1").ScaleWidth(1.21,0,0)  ;Magnified at 130%... use ".8" for 80% above
XL.ActiveSheet.Shapes("Chart 1").ScaleHeight(1,0,0) ;;Magnified at 130%..

XL.Worksheets("Sheet1").ChartObjects(1).Chart.Export("C:\AutoHotKey\Files\pic1.bmp")

XL.ActiveWorkbook.Close(0)
XL.Quit

Data_Source=
(
-	Aaron	Craig	Brodie	James	Joel	Josh	Renae	Rick	
Monday	%AaronMon%	%CraigMon%	%BrodieMon%	%JimMon%	%JoelMon%	%JoshMon%	%RenaeMon%	%RickMon%
Tuesday	%AaronTue%	%CraigTue%	%BrodieTue%	%JimTue%	%JoelTue%	%JoshTue%	%RenaeTue%	%RickTue%
Wednesday	%AaronWed%	%CraigWed%	%BrodieWed%	%JimWed%	%JoelWed%	%JoshWed%	%RenaeWed%	%RickWed%
Thursday	%AaronThu%	%CraigThu%	%BrodieThu%	%JimThu%	%JoelThu%	%JoshThu%	%RenaeThu%	%RickThu%
Friday	%AaronFri%	%CraigFri%	%BrodieFri%	%JimFri%	%JoelFri%	%JoshFri%	%RenaeFri%	%RickFri%
%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%
TOTAL	%AaronTotal%	%CraigTotal%	%BrodieTotal%	%JimTotal%	%JoelTotal%	%JoshTotal%	%RenaeTotal%	%RickTotal%
)	
; Call the function 
LV_Table(Data_Source)
return

LV_Table(Data_Source){
IfNotInString,Data_Source,%A_tab%
	FileRead, Data_Source, %Data_Source% ;Assume path and read into variabl

;***********parse the data******************* 
obj := Object() ;holder for header and rows
loop,parse,Data_Source,`n,`r
{
if (A_Index=1) ;~ IfEqual, A_Index,1,SetEnv,HEADERS,%A_LoopField%   ;~ IfEqual, A_Index,1,continue
	RowHeader:=StrSplit(A_LoopField, A_tab) ;~ splice row into object

rowData:= StrSplit(A_LoopField, A_tab) ;~ splice row into object
obj.Insert(rowData)
maxrows:=A_Index ;
}

dRows:=35 , dCols:=800 ;Set minimum display size for columns and rows
Gui, MyListView: New,,%Data_Source%
Gui, MyListView:Add, Picture, x0 y100, C:\AutoHotKey\Files\pic1.bmp
GuiControl, -Redraw, MyListView  ; Improve performance by disabling redrawing during load. 
	for k,v in obj ;iterate over object
		if (k=1){
			for k1,v1 in obj.1
				strHeader .=  "|" obj.1[k1] ;extract header to concatenated piped list
			dRows:=obj.MaxIndex()
		IfGreaterOrEqual, dRows,25,SetEnv,dRows,26 ;reset display rows if below 26
		IfLessOrEqual, k1,90,SetEnv,dCols,650 ;reset display columns if 
		IfLessOrEqual, k1,10,SetEnv,dCols,400 ;reset display columns if 
	rows:=obj.MaxIndex() ;this might help draw faster
	Gui, Add, ListView, x10 y10 w559 h163 grid hwndHLV , % count%rows% SubStr(strHeader,2) ;define LIstview and headers- Remove firs Pipe
   }  ;end of header section

   Else LV_Add("", Obj[k]*) ;add data rows- LV_Add is a variadic function
   
    LV_ModifyCol(1, 75, "")
    LV_ModifyCol(2, 60)
    LV_ModifyCol(3, 60)
    LV_ModifyCol(4, 60)
    LV_ModifyCol(5, 60)
    LV_ModifyCol(6, 60)
	LV_ModifyCol(7, 60)
	LV_ModifyCol(8, 60)
	LV_ModifyCol(9, 60)

	;LV_Colors.Row(HLV, A_Index, 0xFFECB0, 0x000000)

   	LV_Modify( LV_GetCount(), "Vis" )

   GuiControl, +Redraw, MyListView  ; Re-enable redrawing (it was disabled above).
Gui, +Border -MaximizeBox
;Gui, Add, Button, x10 y185 w100 h25 gExport2Excel, Export to Excel
Gui, Color, 000000
Gui, Add, Button, x468 y395 w100 h25 gClose, Close
Gui, MyListView:Show, w580 h430, POINT COUNTER
}

Close:
Gui, Destroy
return

AppsKey::Send, {AppsKey}

^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return

Nifty:
^F12::
run, G:\Support\Public Staff Folders\Aaron\tools\secret.exe
return