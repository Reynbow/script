#SingleInstance, Force
#NoEnv
#Persistent
	
Gui, -SysMenu -caption -Border
Gui, Color, 1f2130, 2b2e43
Gui, Add, Text, x0 y0 w308 h25 Center GuiMove,

Gui, font, cE8EBF5 Bold s18, SegoeUI
Gui, Add, Text, xp+20 yp+20, HOTKEY INSTALLER
Gui, font,
Gui, font, cE8EBF5 , SegoeUI
Gui, Add, Text, yp+50, Please confirm details below.
Gui, Add, Text, yp+30, First Name
Gui, Add, Edit, xp+60 yp-3 h18 -E0x200 vFirstName, 
Gui, Add, Text, xp-60 yp+30, Surname
Gui, Add, Edit, xp+60 yp-3 h18 -E0x200 vSurname,
Gui, font, 
Gui, font, cE8EBF5 s10, SegoeUI
Gui, Add, Button, xp-60 yp+70 w180 h30 hwndUP1 gInstall, Install

Gui, font,
Gui, font, s14 CWhite Bold , Segoe UI
Gui, Add, Button, x308 y0 w42 h28 Left gExit hwndHBT99, %A_Space%%A_Space%✖

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(UP1, Opt1, Opt2, , , Opt5)
ImageButton.Create(UP2, Opt1, Opt2, , , Opt5)

Opt1 := [0, 0x1F2130    ,       , "WHITE" , , , 0x1F2130, 1]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 1]
Opt5 := [ ,            ,       , "WHITE"]        
ImageButton.Create(HBT99, Opt1, Opt2, , , Opt5)

DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 0)
Gui, Show, w350 h500, INSTALLER
DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 1)
return

Exit:
A1ButtonClose:
GuiClose:
ExitApp

Install:
Gui, Destroy
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

		FileCreateDir, C:\AutoHotKey\
		
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, C:\AutoHotKey\version.txt,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\script.exe, C:\AutoHotKey\script.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\Staff Logs.exe, C:\AutoHotKey\Files\Staff Logs.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png,1

		IniWrite x20 y20, C:\AutoHotKey\settings.ini, window position, gui_position		
		IniWrite x20 y760, C:\AutoHotKey\settings.ini, window position, point_position	
		IniWrite x250 y20, C:\AutoHotKey\settings.ini, window position, weekly_position
		
		;======= UI FILES
		FileCopyDir, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\ui, C:\AutoHotKey\Files\ui ,1

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