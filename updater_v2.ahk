#SingleInstance, Force
#NoEnv
SendMode Input
#Persistent	
SetBatchLines, -1
SendMode, Event
SetKeyDelay 25, 10

FileReadLine, oldver, C:\AutoHotKey\version.txt, 1
FileReadLine, newver, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1
FileRead, update, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\change.txt
	
Gui, A1:Color, 262626
Gui, A1:Add, Picture, x420 y0 w95 h95 , C:\AutoHotKey\Files\all_tag_6.png
Gui, A1:font, cE8EBF5 bold s12, Helvetica
Gui, A1:Add, Picture, x17 y10 w185 h32, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\updater.png
Gui, A1:font,
Gui, A1:font, cE8EBF5 , Helvetica
Gui, A1:Add, Text, x17 y45, You are on version %oldver%.
Gui, A1:Add, Text, x17 y60, The current versions is %newver%.
Gui, A1:Add, Text, x19 y90 w480, Changes: ;`n%update%
Gui, A1:Add, Edit, readonly -tabstop VScroll -E0x200 x17 y108 w476 h105, %update%
Gui, A1:font, cE8EBF5 s7 , Helvetica
Gui, A1:Add, Text, x14 y239, Written by 
Gui, A1:font, cE8EBF5 bold s7, Helvetica
Gui, A1:Add, Text, x60 y239 , Aaron Beecham
Gui, A1:Add, Button, x302 y219 w90 h30 , &Update
Gui, A1:Add, Button, x402 y219 w90 h30 , &Close
Gui, A1:Show, w509 h259, 🔥🔑 Updater
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
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, C:\AutoHotKey\version.txt,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\script.exe, C:\AutoHotKey\script.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\LoyaltyInstall.exe, C:\AutoHotKey\Files\LoyaltyInstall.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\QAComplete.exe, C:\AutoHotKey\Files\QAComplete.exe,1
		FileCopy, G:\Support\Public Staff Folders\Aaron\Tools\Loyalty TWCM.exe, C:\AutoHotKey\Files\Loyalty TWCM.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\Staff Logs.exe, C:\AutoHotKey\Files\Staff Logs.exe,1
		FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png,1

		sleep 1500
		Gui, Destroy
		MsgBox,  0, Update Complete, The script has updated succesfully.`nYou may now run the script again using the hotkey.
		Run, C:\AutoHotKey\script.exe
ExitApp