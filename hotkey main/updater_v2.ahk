#SingleInstance, Force
#NoEnv
SendMode Input
#Persistent	
SetBatchLines, -1
SendMode, Event
SetKeyDelay 25, 10

; Disable Fading Effect On Guis
DllCall("SystemParametersInfo","UInt",0x1043,"UInt",0,"UInt",0)
Progress, 100,
Progress, Off
DllCall("SystemParametersInfo","UInt",0x1043,"UInt",0,"UInt",1)

FileReadLine, oldver, C:\AutoHotKey\version.txt, 1
FileReadLine, newver, G:\Support\Public Staff Folders\Aaron\Update\version.txt, 1
FileRead, update, G:\Support\Public Staff Folders\Aaron\Update\change.txt
	
Gui, A1:-SysMenu -caption -Border
Gui, A1:Add, Picture, x-150 y-100 , G:\Support\Public Staff Folders\Aaron\Update\files\ui\back-sup-wide.png
Gui, A1:Color, 1f2130, 2b2e43
Gui, A1:Add, Text, x0 y0 w408 h25 Center GuiMove,

Gui, A1:font, cE8EBF5 Bold s18, SegoeUI
Gui, A1:Add, Text, x15 y10 w185 h32 BackGroundTrans, UPDATER
Gui, A1:font,
Gui, A1:font, cE8EBF5 , SegoeUI
Gui, A1:Add, Text, x17 y45 BackGroundTrans, You are on version %oldver%.
Gui, A1:Add, Text, x17 y60 BackGroundTrans, The current versions is %newver%.
Gui, A1:Add, Text, x19 y90 BackGroundTrans, Changes: ;`n%update%
Gui, A1:Add, Edit, readonly -tabstop -E0x200 x17 y108 w476 h105, %update%
Gui, A1:font, 
Gui, A1:font, cE8EBF5 s7 , Helvetica
Gui, A1:Add, Text, x14 y239 BackGroundTrans, Written by 
Gui, A1:font, 
Gui, A1:font, cE8EBF5 s7 Bold, Helvetica
Gui, A1:Add, Text, x60 y239 BackGroundTrans , Aaron Beecham
Gui, A1:font, 
Gui, A1:font, cE8EBF5 s10, SegoeUI
Gui, A1:Add, Button, x302 y219 w90 h30 hwndUP1, Update
Gui, A1:Add, Button, x402 y219 w90 h30 hwndUP2, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(UP1, Opt1, Opt2, , , Opt5)
ImageButton.Create(UP2, Opt1, Opt2, , , Opt5)

DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 0)
Gui, A1:Show, w509 h259, 🔥🔑 Updater
DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 1)
return

A1ButtonClose:
GuiClose:
ExitApp

A1ButtonUpdate:
Gui, A1:Destroy
Gui, +AlwaysOnTop -sysmenu
Gui, Font, S12 Bold CDefault, Verdana
Gui, Add, Text, x10 y18 w260 h70 ,Please wait...
Gui, Font,
global WM_USER               := 0x00000400
global PBM_SETMARQUEE        := WM_USER + 10
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
Gui, Add, Progress, x10 y50 w180 h20 hwndMARQ4 -%PBS_SMOOTH% +%PBS_MARQUEE%, 50
DllCall("User32.dll\SendMessage", "Ptr", MARQ4, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
Gui, Show, w200 h80,Updating...

        Process, Close, script.exe
		FileCopy, G:\Support\Public Staff Folders\Aaron\Update\version.txt, C:\AutoHotKey\version.txt,1
		FileCopy, G:\Support\Public Staff Folders\Aaron\Update\script.exe, C:\AutoHotKey\script.exe,1
		;FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\LoyaltyInstall.exe, C:\AutoHotKey\Files\LoyaltyInstall.exe,1
		;FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\QAComplete.exe, C:\AutoHotKey\Files\QAComplete.exe,1
		;FileCopy, G:\Support\Public Staff Folders\Aaron\Tools\Loyalty TWCM.exe, C:\AutoHotKey\Files\Loyalty TWCM.exe,1
		FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\Staff Logs.exe, C:\AutoHotKey\Files\Staff Logs.exe,1
		FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png,1

		IfNotExist, C:\AutoHotKey\settings.ini
		{
		IniWrite x20 y20, C:\AutoHotKey\settings.ini, window position, gui_position		
		IniWrite x20 y760, C:\AutoHotKey\settings.ini, window position, point_position	
		IniWrite x250 y20, C:\AutoHotKey\settings.ini, window position, weekly_position
		}
		
		;======= UI FILES
		FileCopyDir, G:\Support\Public Staff Folders\Aaron\Update\files\ui, C:\AutoHotKey\Files\ui ,1

		sleep 1500
		Gui, Destroy
		MsgBox,  0, Update Complete, The script has updated succesfully.`nYou may now run the script again using the hotkey.
		Run, C:\AutoHotKey\script.exe
ExitApp

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

#Include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\test files\Sources\Class_ImageButton.ahk