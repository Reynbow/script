#SingleInstance, Force    
#NoEnv

FileCreateDir, %A_WorkingDir%\Files
FileCreateDir, %A_WorkingDir%\Files\images
FileCreateDir, %A_WorkingDir%\Files\icons
FileCreateDir, C:\INTPHARM
FileCreateDir, C:\Loyalty
FileCreateDir, C:\INTPHARM\Inthelp


FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Intellipharm Help.url, %A_WorkingDir%\Files\Intellipharm Help.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\better rewards..url, %A_WorkingDir%\Files\better rewards..url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Chemistworks Loyalty.url, %A_WorkingDir%\Files\Chemistworks Loyalty.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Chemmart Loyalty.url, %A_WorkingDir%\Files\Chemmart Loyalty.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Loyalty One.url, %A_WorkingDir%\Files\Loyalty One.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Restore Rewards v3.url, %A_WorkingDir%\Files\Restore Rewards v3.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Restore Rewards.url, %A_WorkingDir%\Files\Restore Rewards.url, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Soul + Rewards.url, %A_WorkingDir%\Files\Soul + Rewards.url, 1

FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\images\better_rewards.png, %A_WorkingDir%\Files\images\better_rewards.png, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\images\chemmart_rewards.png, %A_WorkingDir%\Files\images\chemmart_rewards.png, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\images\loyalty_one.png, %A_WorkingDir%\Files\images\loyalty_one.png, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\images\restore_rewards.png, %A_WorkingDir%\Files\images\restore_rewards.png, 1
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\images\soul_rewards.png, %A_WorkingDir%\Files\images\soul_rewards.png, 1

FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\better rewards.ico, %A_WorkingDir%\Files\icons\better rewards.ico
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\Chemmart Rewards.ico, %A_WorkingDir%\Files\icons\Chemmart Rewards.ico
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\Loyalty One.ico, %A_WorkingDir%\Files\icons\Loyalty One.ico
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\Restore Rewards.ico, %A_WorkingDir%\Files\icons\Restore Rewards.ico
FileInstall C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\Loyalty Shortcuts\Files\Soul + Rewards.ico, %A_WorkingDir%\Files\icons\Soul + Rewards.ico

	Gui, 1:Margin, 16, 16
    Gui, 1:Color, 1d1f21, 383D46, 282a2e
    Gui, 1:-SysMenu +Border
    Gui, 1:Font, s11, Segoe UI

		{
		IfExist, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		{
		Gui, 1:Add, Text, xm w280 c00ff00 -E0x200 , Chrome Installed (64bit) ✔
		}
		Else
		IfExist, C:\Program Files\Google\Chrome\Application\chrome.exe
		{
		Gui, 1:Add, Text, xm w280 c00ff00 -E0x200 , Chrome Installed (32bit) ✔
		}
		Else
		Gui, 1:Add, Text, xm w280 cff0000 -E0x200 , Chrome NOT Installed ❌
		}

	Gui, 1:Add, Text, xm w280 cc5c8c6 -E0x200 , Would you like to add the Intellipharm Help shortcut to the desktop?
	Gui, 1:Add, Button, xm w130 cc5c8c6 -E0x200 +default gYesIntIcon, Yes
	Gui, 1:Add, Button, xp+150 w130 cc5c8c6 -E0x200 gNoIntIcon, No
    Gui, 1:Show,, Loyalty Selection
	return


YesIntIcon:
FileCopy, %A_WorkingDir%\Files\Intellipharm Help.url, %A_Desktop%\Intellipharm Help.url, 1
gosub NoIntIcon
Return

NoIntIcon:
Gui, 1:Destroy
Gui, 2:Margin, 16, 16
Gui, 2:Color, 1d1f21, 383D46, 282a2e
Gui, 2:-SysMenu +Border
Gui, 2:Font, s11, Segoe UI
Gui, 2:Add, Text, xm w280 cc5c8c6 -E0x200 , Would you like to add the Loyalty shortcut to the desktop?`nIf Yes, please select from the drop down menu.
Gui, 2:Add, DropDownList, xm w280 cc5c8c6 -E0x200 vLoyChoice, LO|br.|CML|CWL|S+R|RR|RR3|Custom
Gui, 2:Add, Button, xm w130 cc5c8c6 -E0x200 +default gYesLoyIcon, Yes
Gui, 2:Add, Button, xp+150 w130 cc5c8c6 -E0x200 gBatch, No
Gui, 2:Show,, Loyalty Selection
return

YesLoyIcon:
Gui, 2:Submit, NoHide
IfEqual, LoyChoice, LO
	{
	FileCopy, %A_WorkingDir%\Files\Loyalty One.url, %A_Desktop%\Loyalty One.url, 1
	}
IfEqual, LoyChoice, br.
	{
	FileCopy, %A_WorkingDir%\Files\better rewards..url, %A_Desktop%\better rewards..url, 1
	}
IfEqual, LoyChoice, CML
	{
	FileCopy, %A_WorkingDir%\Files\Chemmart Loyalty.url, %A_Desktop%\Chemmart Loyalty.url, 1
	}
IfEqual, LoyChoice, CWL
	{
	FileCopy, %A_WorkingDir%\Files\Chemistworks Loyalty.url, %A_Desktop%\Chemistworks Loyalty.url, 1
	}
IfEqual, LoyChoice, S+R
	{
	FileCopy, %A_WorkingDir%\Files\Soul + Rewards.url, %A_Desktop%\Soul + Rewards.url, 1
	}
IfEqual, LoyChoice, RR
	{
	FileCopy, %A_WorkingDir%\Files\Restore Rewards.url, %A_Desktop%\Restore Rewards.url, 1
	}
IfEqual, LoyChoice, RR3
	{
	FileCopy, %A_WorkingDir%\Files\Restore Rewards v3.url, %A_Desktop%\Restore Rewards.url, 1
	}
IfEqual, LoyChoice, Custom
	{
	gosub CustomURL
	return
	}
FileRemoveDir, %A_WorkingDir%\Files\, 1
gosub batch
return

CustomURL:
Gui, 2:Destroy
Gui, 3:Margin, 16, 16
Gui, 3:Color, 1d1f21, 383D46, 282a2e
Gui, 3:-SysMenu +Border
Gui, 3:Font, s11, Segoe UI
Gui, 3:Add, Text, xm w280 cc5c8c6 -E0x200 , Shortcut Name
Gui, 3:Add, Edit, xm w280 cc5c8c6 -E0x200 vCustomName, Loyalty
Gui, 3:Add, Text, xm w280 cc5c8c6 -E0x200 , Shortcut URL
Gui, 3:Add, Edit, xm w280 cc5c8c6 -E0x200 vCustomURL, https://pharmacy.loyaltyone.com.au/
Gui, 3:Add, Text, xm w280 cc5c8c6 -E0x200 , Please choose the preferred icon.
Gui, 3:Add, Radio, x10 y210 w20 h20 cc5c8c6 -E0x200 vBR,
Gui, 3:Add, Radio, xp+60 w20 h20 cc5c8c6 -E0x200 vCR,
Gui, 3:Add, Radio, xp+60 w20 h20 cc5c8c6 -E0x200 vLO,
Gui, 3:Add, Radio, xp+60 w20 h20 cc5c8c6 -E0x200 vRR,
Gui, 3:Add, Radio, xp+60 w20 h20 cc5c8c6 -E0x200 vSR,
Gui, 3:Add, Picture, x30 y205 w32 h32 , %A_WorkingDir%\Files\images\better_rewards.png
Gui, 3:Add, Picture, xp+60 w32 h32 , %A_WorkingDir%\Files\images\chemmart_rewards.png
Gui, 3:Add, Picture, xp+60 w32 h32 , %A_WorkingDir%\Files\images\loyalty_one.png
Gui, 3:Add, Picture, xp+60 w32 h32 , %A_WorkingDir%\Files\images\restore_rewards.png
Gui, 3:Add, Picture, xp+60 w32 h32 , %A_WorkingDir%\Files\images\soul_rewards.png
Gui, 3:Add, Button, xm w130 cc5c8c6 -E0x200 +default gCustomDone, Done
Gui, 3:Add, Button, xp+150 w130 cc5c8c6 -E0x200 gExit, Exit
Gui, 3:Show,, Loyalty Selection
Return

CustomDone:
Gui, 3:Submit, NoHide

If (BR=1)
{
FileCopy, %A_WorkingDir%\Files\icons\better rewards.ico, C:\INTPHARM\Inthelp\better rewards.ico, 1
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IDList
IniWrite, %CustomURL%, %A_Desktop%\%CustomName%.url, InternetShortcut, URL
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IconIndex
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, HotKey
IniWrite, C:\INTPHARM\Inthelp\better rewards.ico, %A_Desktop%\%CustomName%.url, InternetShortcut, IconFile
}

If (CR=1)
{
FileCopy, %A_WorkingDir%\Files\icons\Chemmart Rewards.ico, C:\INTPHARM\Inthelp\Chemmart Rewards.ico, 1
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IDList
IniWrite, %CustomURL%, %A_Desktop%\%CustomName%.url, InternetShortcut, URL
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IconIndex
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, HotKey
IniWrite, C:\INTPHARM\Inthelp\Chemmart Rewards.ico, %A_Desktop%\%CustomName%.url, InternetShortcut, IconFile
}

If (LO=1)
{
FileCopy, %A_WorkingDir%\Files\icons\Loyalty One.ico, C:\INTPHARM\Inthelp\Loyalty One.ico, 1
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IDList
IniWrite, %CustomURL%, %A_Desktop%\%CustomName%.url, InternetShortcut, URL
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IconIndex
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, HotKey
IniWrite, C:\INTPHARM\Inthelp\Loyalty One.ico, %A_Desktop%\%CustomName%.url, InternetShortcut, IconFile
}

If (RR=1)
{
FileCopy, %A_WorkingDir%\Files\icons\Restore Rewards.ico, C:\INTPHARM\Inthelp\Restore Rewards.ico, 1
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IDList
IniWrite, %CustomURL%, %A_Desktop%\%CustomName%.url, InternetShortcut, URL
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IconIndex
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, HotKey
IniWrite, C:\INTPHARM\Inthelp\Restore Rewards.ico, %A_Desktop%\%CustomName%.url, InternetShortcut, IconFile
}

If (SR=1)
{
FileCopy, %A_WorkingDir%\Files\icons\Soul + Rewards.ico, C:\INTPHARM\Inthelp\Soul + Rewards.ico, 1
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IDList
IniWrite, %CustomURL%, %A_Desktop%\%CustomName%.url, InternetShortcut, URL
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, IconIndex
IniWrite, 0, %A_Desktop%\%CustomName%.url, InternetShortcut, HotKey
IniWrite, C:\INTPHARM\Inthelp\Soul + Rewards.ico, %A_Desktop%\%CustomName%.url, InternetShortcut, IconFile
}

FileRemoveDir, %A_WorkingDir%\Files\, 1
gosub batch
return

Batch:
Gui, 2:Destroy
Gui, 3:Destroy
Gui, 4:Margin, 16, 16
Gui, 4:Color, 1d1f21, 383D46, 282a2e
Gui, 4:-SysMenu +Border
Gui, 4:Font, s11, Segoe UI
Gui, 4:Add, Text, xm w280 cc5c8c6 -E0x200 , Back Office PC
Gui, 4:Add, Edit, yp+25 w280 cc5c8c6 -E0x200 vPCName,
Gui, 4:Add, Text, xm w280 cc5c8c6 -E0x200 , Username:
Gui, 4:Add, Edit, yp+25 w280 cc5c8c6 -E0x200 vUsername,
Gui, 4:Add, Text, xm w280 cc5c8c6 -E0x200 , Password:
Gui, 4:Add, Edit, yp+25 w280 cc5c8c6 -E0x200 vPassword,
Gui, 4:Add, Text, xm w280 cc5c8c6 -E0x200 , Please choose the required Batch file
Gui, 4:Add, DropDownList, yp+25 w280 cc5c8c6 -E0x200 vBatchFile, STANDARD|STANDARD - AUTO SERVER LOGIN|LOTS|LOTS - AUTO SERVER LOGIN
Gui, 4:Add, Button, xm w130 cc5c8c6 -E0x200 +default gContinue, Complete
Gui, 4:Add, Button, xp+150 w130 cc5c8c6 -E0x200 gExit, Exit
Gui, 4:Show,, Loyalty Selection
return

Continue:
Gui, 4:Submit, NoHide

IfEqual, BatchFile, STANDARD
{
FileDelete, C:\Loyalty\pharmlink re-map.bat
FileAppend, 
(
@echo off


taskkill /f /im plbal.exe 

NET USE L: /DELETE /Y
START /wait NET USE L: \\%PCName%\INTPHARM

start "" "C:\Loyalty\plbal.lnk"

if not exist c:\loyalty\plbal.exe start /min c:\loyalty\plprompt.exe 

exit
), C:\Loyalty\pharmlink re-map.bat
FileCreateShortcut, C:\Loyalty\pharmlink re-map.bat, %A_Desktop%\Loyalty Remap.lnk
}

IfEqual, BatchFile, STANDARD - AUTO SERVER LOGIN
{
FileDelete, C:\Loyalty\pharmlink re-map.bat
FileAppend, 
(
@echo off


NET USE L: /DELETE /Y
net use L: \\sobackoffice1\intpharm  /user:%Username% "%Password%"
START /wait NET USE L: \\%PCName%\INTPHARM


start "" "C:\Loyalty\plbal.lnk"

), C:\Loyalty\pharmlink re-map.bat
FileCreateShortcut, C:\Loyalty\pharmlink re-map.bat, %A_Desktop%\Loyalty Remap.lnk
}

IfEqual, BatchFile, LOTS
{
FileDelete, C:\Loyalty\pharmlink re-map.bat
FileAppend, 
(
@echo off


taskkill /f /im plbal.exe 
NET USE L: /DELETE /Y
START /wait NET USE L: \\%PCName%\INTPHARM


NET USE X: /DELETE /Y
START /wait NET USE X: \\%PCName%\LOTS

start "" "C:\Loyalty\plbal.lnk"

if not exist c:\loyalty\plbal.exe start /min c:\loyalty\plprompt.exe 

exit
), C:\Loyalty\pharmlink re-map.bat
FileCreateShortcut, C:\Loyalty\pharmlink re-map.bat, %A_Desktop%\Loyalty Remap.lnk
}

IfEqual, BatchFile, LOTS - AUTO SERVER LOGIN
{
FileDelete, C:\Loyalty\pharmlink re-map.bat
FileAppend, 
(
@echo off

taskkill /f /im plbal.exe 

NET USE L: /DELETE /Y
net use L: \\%PCName%\intpharm  /user:%Username% "%Password%"
START /wait NET USE L: \\%PCName%\INTPHARM


NET USE X: /DELETE /Y
START /wait NET USE X: \\%PCName%\LOTS

start "" "C:\Loyalty\plbal.lnk"

if not exist c:\loyalty\plbal.exe start /min c:\loyalty\plprompt.exe 

exit
), C:\Loyalty\pharmlink re-map.bat
FileCreateShortcut, C:\Loyalty\pharmlink re-map.bat, %A_Desktop%\Loyalty Remap.lnk
}
FileRemoveDir, %A_WorkingDir%\Files\, 1
ExitApp


Esc::
Exit:
FileRemoveDir, %A_WorkingDir%\Files\, 1
ExitApp