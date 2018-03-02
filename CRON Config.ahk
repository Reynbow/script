#SingleInstance force
/****************************************
GUI
*/
FileRead, STORE, C:\INTPHARM\HSNET\sitecode.txt

;IniRead, STORE, C:\INTPHARM\DISPX\dispx.ini, Settings, SiteCode

Gui, Add, Edit, readonly x10 y10 w400 h462 vConsole
Gui, Show, x100 y100 w420 h482, CRON Config - %STORE%

/****************************************
Main
*/
FileDelete, CRON_Config_LOG.txt
FormatTime, TimeString, A_Now, dd/MM/yyyy - HH:mm:ss
log(TimeString) 
log("--------------------------------------`nRunning CRON Config`n--------------------------------------`n")
log("If you would like to stop this process, you can at any time by pressing ESC")

log("Please wait...`n")
sleep 1000



IfNotExist, C:\INTPHARM\DISPX\dispx.exe
{
	log("** WARNING ** - dispx.exe file is missing`n")
	sleep 1000
}

IfNotExist, C:\INTPHARM\POSX\PRG\posx.exe
{
	log("** WARNING ** - posx.exe file is missing`n")
	sleep 1000
}

IfNotExist, C:\INTPHARM\HSNET\hsnet.exe
{
	log("** WARNING ** - hsnet.exe file is missing`n")
	sleep 1000
}

IfNotExist, C:\INTPHARM\CRON\RESTARTEVERYTHING.bat
{
	log("** WARNING ** - RESTARTEVERYTHING.bat file is missing`n")
	sleep 1000
}

IfNotExist, C:\INTPHARM\HSNET\chilkat.txt
{
	log("chilkat.txt missing from HSNET directory")
	log("chilkat.txt created and added to HSNET directory`n")
}

log("It is now safe to close CRON config")

/****************************************
Main - End
*/

;Function that writes to the logs. This is where the magic happens.
log(msg)
{
FileAppend, ;Text file write
(
%msg%`n
), CRON_Config_LOG.txt
GuiControlGet, Console
GuiControl, , Console, %Console%%msg%`r`n ; GUI write
sleep 500 ; Pause for smooth log scrolling
}

Return

GuiClose:
Gui, Destroy
ExitApp

ESC::
ExitApp