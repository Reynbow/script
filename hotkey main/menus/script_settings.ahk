script_settings:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Update\codelist.txt
Gui, Set:Add, Edit, x-1000 y-1000 w280 cWHITE -E0x200 , Placeholder

Gui, Set:-SysMenu -caption -Border %OnTopSetting%
Gui, Set:Color, 1f2130, 2b2e43
Gui, Set:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, Set:Add, Picture, x0 y+20 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, Set:font, s16 bold cE8EBF5, Segoe UI
Gui, Set:Add, Text, x20 y18 , SETTINGS - Version %VersionNum%
Gui, Set:font, 
Gui, Set:font, cE8EBF5, Segoe UI

Gui, Set:Add, Text, yp+50 cWHITE -E0x200 , First Name:
Gui, Set:Add, Edit, xp+80 w195 cWHITE -E0x200 vName, %Name%
Gui, Set:Add, Text, xp-80 yp+35 cWHITE -E0x200 , Surname:
Gui, Set:Add, Edit, xp+80 w195 cWHITE -E0x200 vSurname, %Surname%

;=============================== ALWAYS ON TOP
Gui, Set:Add, Text, xp-80 yp+45 BackgroundTrans , Always On Top: 
IniRead, IsOnTop, C:\AutoHotKey\settings.ini, Always On Top, Active
If IsOnTop = +AlwaysOnTop
	{
	OnTop_Yes = Checked
	}
If IsOnTop = -AlwaysOnTop
	{
	OnTop_No = Checked
	}
Gui, Set:Add, Radio, xp+120 %OnTop_Yes% vOnTopYES, YES
Gui, Set:Add, Radio, xp+50 %OnTop_No% vOnTopNO, NO
;=============================== 

;=============================== STARTUP
Gui, Set:Add, Text, xp-170 yp+35 BackgroundTrans , Start with Windows: 
IniRead, Startup, C:\AutoHotKey\settings.ini, Start With Windows, Boot
If Startup = YES
	{
	Startup_Yes = Checked
	}
If Startup = NO
	{
	Startup_No = Checked
	}
Gui, Set:Add, Radio, xp+120 %Startup_Yes% vStartup_Yes, YES
Gui, Set:Add, Radio, xp+50 %Startup_No% vStartup_No, NO
;=============================== 

;=============================== DEFAULT TAB
Gui, Set:Add, Text, xp-170 yp+35 BackgroundTrans , Default Tab: 
IniRead, SupCHECKED, C:\AutoHotKey\settings.ini, Starting Position, Start
If SupCHECKED = Choose1
	{
	supON = Checked
	}
If SupCHECKED = Choose2
	{
	loyON = Checked
	}
Gui, Set:Add, Radio, xp+120 %supON% vTabSup, SUPPORT
Gui, Set:Add, Radio, xp+80 %loyON% vTabLoy, LOYALTY
;================================

Gui, Set:Add, Button, xp-200 yp+40 w125 h25 hwndSet3 gForceUpdate, Manual Update

Gui, Set:Add, Button, yp+40 w125 h30 hwndSet1 gSetSave, Save
Gui, Set:Add, Button, xp+145 w125 h30 hwndSet2 gExit , Exit

FileRead, ChangeLog, G:\Support\Public Staff Folders\Aaron\Update\changelog.txt
Gui, Set:Add, Edit, readonly -tabstop VScroll -E0x200 x315 y0 w337 h350 , %ChangeLog%

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(Set1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Set2, Opt1, Opt2, , , Opt5)
ImageButton.Create(Set3, Opt1, Opt2, , , Opt5)

Gui, Set:Show, %Gui_Cord% w652 h350, %A_Space%
return

SetSave:
Gui, Submit

IniWrite %Name%, C:\AutoHotKey\settings.ini, UserName, Name
IniWrite %Surname%, C:\AutoHotKey\settings.ini, UserName, Surname

If OnTopYES = 1
	{
		IniWrite, +AlwaysOnTop, C:\AutoHotKey\settings.ini, Always On Top, Active
	}

If OnTopNO = 1
	{
		IniWrite, -AlwaysOnTop, C:\AutoHotKey\settings.ini, Always On Top, Active
	}

If TabSup = 1
	{
		IniWrite, Choose1, C:\AutoHotKey\settings.ini, Starting Position, Start
	}

If TabLoy = 1
	{
		IniWrite, Choose2, C:\AutoHotKey\settings.ini, Starting Position, Start
	}

If Startup_Yes = 1
	{
		IniWrite, Yes, C:\AutoHotKey\settings.ini, Start With Windows, Boot
		FileCreateShortcut, C:\AutoHotKey\script.exe, %A_Startup%\Script.lnk
	}

If Startup_No = 1
	{
		IniWrite, No, C:\AutoHotKey\settings.ini, Start With Windows, Boot
		FileDelete, %A_Startup%\Script.lnk
	}
	
Reload
Return