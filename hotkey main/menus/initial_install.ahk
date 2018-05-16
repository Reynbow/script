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