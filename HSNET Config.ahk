#SingleInstance force
/****************************************
GUI
*/

FileCreateDir, C:\INTPHARM\Inthelp\

FileInstall, C:\INTPHARM\Inthelp\intlogo.ico, C:\INTPHARM\Inthelp\intlogo.ico, 1

IfNotExist, C:\INTPHARM\DISPX\sitecode.txt
{
FileRead, STORE, C:\INTPHARM\POSX\PRG\sitecode.txt
}
Else FileRead, STORE, C:\INTPHARM\DISPX\sitecode.txt

;IniRead, STORE, C:\INTPHARM\DISPX\dispx.ini, Settings, SiteCode
Gui, Add, Edit, -E0x200 readonly x10 y10 w400 h180 vConsole
Gui, Show, x100 y100 w420 h200, HSNET Config - %STORE%

/****************************************
Main
*/
FileDelete, HSNET_Config_LOG.txt
FormatTime, TimeString, A_Now, dd/MM/yyyy - HH:mm:ss
log(TimeString) 
log("--------------------------------------`nRunning HSNET Config`n--------------------------------------`n")
log("If you would like to stop this process, you can at any time by pressing ESC`n")

	log("✔️ - Desktop Help icon updated")
	sleep 1000
    IniWrite, C:\INTPHARM\Inthelp\intlogo.ico, 				C:\Users\All Users\Desktop\Intellipharm Help.url, InternetShortcut, IconFile
	IniWrite, % "",                            				C:\Users\All Users\Desktop\Intellipharm Help.url, InternetShortcut, IDList
	IniWrite, https://intellipharm.com.au/download/index,   C:\Users\All Users\Desktop\Intellipharm Help.url, InternetShortcut, URL
	IniWrite, 0,                               				C:\Users\All Users\Desktop\Intellipharm Help.url, InternetShortcut, IconIndex
	IniWrite, 0,                               				C:\Users\All Users\Desktop\Intellipharm Help.url, InternetShortcut, HotKey

InputBox, count, SCHEDULE TASK,Please set the time you would like HSNET SCHEDULE TASK to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,22:30

log("`n✔️ - SCHEDULE TASK SET FOR " count "`n")

;=========== THIS BLOCK WILL SET THE SCHEDULE TASK ==========

TriggerType = 2    ; specifies a time-based trigger.
ActionTypeExec = 0    ; specifies an executable action.
LogonType = 3   ; Set the logon type to interactive logon
TaskCreateOrUpdate = 6

;********************************************************
; Create the TaskService object.
service := ComObjCreate("Schedule.Service")
service.Connect()

;********************************************************
; Get a folder to create a task definition in. 
rootFolder := service.GetFolder("\")

; The taskDefinition variable is the TaskDefinition object.
; The flags parameter is 0 because it is not supported.
taskDefinition := service.NewTask(0) 

;********************************************************
; Define information about the task.

; Set the registration info for the task by 
; creating the RegistrationInfo object.
regInfo := taskDefinition.RegistrationInfo
regInfo.Description := "Intellipharm - 1300 255 160 - This task will launch HSNET daily."
regInfo.Author := "Intellipharm"

;********************************************************
; Set the principal for the task
principal := taskDefinition.Principal
principal.LogonType := LogonType  ; Set the logon type to interactive logon


; Set the task setting info for the Task Scheduler by
; creating a TaskSettings object.
settings := taskDefinition.Settings
settings.Enabled := True
settings.StartWhenAvailable := True
settings.Hidden := False
settings.ExecutionTimeLimit := "PT0S"
;settings.DeleteExpiredTaskAfter := "P1D"

;********************************************************
; Create a time-based trigger.
triggers := taskDefinition.Triggers
trigger := triggers.Create(TriggerType)

; Trigger variables that define when the trigger is active.
;startTime += 30, Seconds  ;start time = 30 seconds from now

startTime = 2017-01-01T%count%:00+10:00
;FormatTime,startTime,%startTime%,yyyy-MM-ddTHH`:mm`:ss

;endTime += 5, Minutes  ;end time = 5 minutes from now
;FormatTime,endTime,%endTime%,yyyy-MM-ddTHH`:mm`:ss

trigger.StartBoundary := startTime
;trigger.EndBoundary := endTime
;trigger.ExecutionTimeLimit := "PT5M"    ;Five minutes
trigger.Id := "TimeTriggerId"
trigger.Enabled := True

;***********************************************************
; Create the action for the task to execute.

; Add an action to the task to run notepad.exe.
Action := taskDefinition.Actions.Create( ActionTypeExec )
Action.Path := "C:\INTPHARM\HSNET\HSNET.exe"

;***********************************************************
; Register (create) the task.
rootFolder.RegisterTaskDefinition("Intellipharm - HSNET", taskDefinition, TaskCreateOrUpdate ,"","", 3)

;========== END OF SCHEDULE TASK SECTION ===========

InputBox, count, STARTUP TIME,Please set the time you would like HSNET to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,00:15

log("✔️ - SCHEDULE TIME SET FOR " count "`n")
IniWrite %count%, C:\INTPHARM\HSNET\hsnet.ini, Settings, ScheduleTime
FileAppend, Task Schedule Set`n, C:\INTPHARM\hsnet.txt

Secs := 60
SetTimer, CountDown, 1000
MsgBox, 4, Closing in 60 seconds, Would you like to continue with HSNET Config?, %secs%
SetTimer, CountDown, Off

	IfMsgBox No
		{
			ExitApp
		}

	IfMsgBox Timeout
		{
			ExitApp
		}

	IfMsgBox Yes
		{

IfNotExist, C:\Users\All Users\Start Menu\Programs\StartUp\
{
	FileCreateDir, C:\Users\All Users\Start Menu\Programs\StartUp\
}

IfNotExist, C:\Users\All Users\Start Menu\Programs\StartUp\hsnet.lnk
{
	;FileCreateShortcut, C:\INTPHARM\HSNET\hsnet.exe, C:\INTPHARM\hsnet.lnk
	;sleep 100
	;FileCopy, C:\INTPHARM\hsnet.lnk, C:\Users\All Users\Start Menu\Programs\StartUp\hsnet.lnk
	log("❌ - WARNING - hsnet not added to startup`n")
	sleep 100
	log("STARTUP FOLDER WILL OPEN")
	log("✔️ - SHORTCUT CREATED IN INTPHARM DIRECTORY`n")

	FileCreateShortcut, C:\INTPHARM\HSNET\hsnet.exe, C:\INTPHARM\hsnet.lnk
		IfExist, C:\Users\All Users\Start Menu\Programs\StartUp\
			{
			Run, C:\Users\All Users\Start Menu\Programs\StartUp\
			Send !{ESC} 
			}
}
sleep 1000

IfNotExist, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\hsnet.lnk
{
	;FileCreateShortcut, C:\INTPHARM\HSNET\hsnet.exe, C:\INTPHARM\hsnet.lnk
	;sleep 100
	;FileCopy, C:\INTPHARM\hsnet.lnk, C:\Users\All Users\Start Menu\Programs\StartUp\hsnet.lnk
	log("❌ - WARNING - hsnet not added to startup`n")
	sleep 100
	log("STARTUP FOLDER WILL OPEN")
	log("✔️ - SHORTCUT CREATED IN INTPHARM DIRECTORY`n")

	FileCreateShortcut, C:\INTPHARM\HSNET\hsnet.exe, C:\INTPHARM\hsnet.lnk
	Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\
	Send !{ESC} 
}
sleep 1000

/*
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
*/
IfNotExist, C:\INTPHARM\CRON\RESTARTEVERYTHING.bat
{
	IfNotExist, C:\INTPHARM\HSNET\RESTARTEVERYTHING.bat
	{
	log("❌ - WARNING - RESTARTEVERYTHING.bat file is missing `n")
	sleep 1000
}
}

log("✔️ - HSNET process closed")
Process, Close, hsnet.exe
sleep 1000

log("✔️ - Disabling CRON - cron.tab removed")
FileDelete, C:\INTPHARM\CRON\cron.tab

;log("Moving restart batch")
FileMove, C:\INTPHARM\CRON\RESTARTEVERYTHING.bat, C:\INTPHARM\HSNET\

;log("AutoSyncInterval has been set to 2 minutes")
;IniWrite 2, C:\INTPHARM\HSNET\hsnet.ini, Settings, AutoSyncInterval

;log("ScheduleTask set to start with RESTARTEVERYTHING.bat in HSNET folder")
IniWrite C:\INTPHARM\HSNET\RESTARTEVERYTHING.bat, C:\INTPHARM\HSNET\hsnet.ini, Settings, ScheduleTask

var1 =  
var1 += -2, minutes
FormatTime, OutputVar, %var1%, HH:mm
log("✔️ - Preparing HSNET test")
IniWrite %OutputVar%, C:\INTPHARM\HSNET\hsnet.ini, Settings, ScheduleTime

IfExist, C:\INTPHARM\HSNET\schedule.txt
{
log("✔️ - Schedule.txt removed to allow the test to begin`n")
FileDelete, C:\INTPHARM\HSNET\schedule.txt
sleep 1000
}

IfNotExist, C:\INTPHARM\HSNET\chilkat.txt
{
	log("✔️ - Setting chilkat mode for HSNET`n")
	FileAppend ,,C:\INTPHARM\HSNET\chilkat.txt
}

log("`n`n---		Beginning HSNET test 		---")
run, C:\INTPHARM\HSNET\hsnet.exe
sleep 1000

IfNotExist, C:\INTPHARM\HSNET\schedule.txt
{
log("--- 	HSNET will be given 5 minutes to launch	---`n")
sleep 1000
}

{
log("Please wait...")
sleep 1000
}

loop, 30
{
IfNotExist, C:\INTPHARM\HSNET\schedule.txt
{
log("Processing...")
sleep 10000
}
}

IfNotExist, C:\INTPHARM\HSNET\schedule.txt
{
log("`n-----------------------------------------------------------------------------------------------------------------------------`n** HSNET HAS NOT STARTED, PLEASE DIAGNOSE AND RUN AGAIN... **`n-----------------------------------------------------------------------------------------------------------------------------`n")
}

;log("Ending current HSNET process")
;Process, Close, hsnet.exe
;sleep 2000

;log("Resetting HSNET back to default settings")
;log("Setting AutoSyncInterval to 35 minutes")
;IniWrite 35, C:\INTPHARM\HSNET\hsnet.ini, Settings, AutoSyncInterval
/*
InputBox, count, SCHEDULE TASK,Please set the time you would like HSNET SCHEDULE TASK to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,22:30

log("`nSCHEDULE TASK SET`n")

;=========== THIS BLOCK WILL SET THE SCHEDULE TASK ==========

TriggerType = 2    ; specifies a time-based trigger.
ActionTypeExec = 0    ; specifies an executable action.
LogonType = 3   ; Set the logon type to interactive logon
TaskCreateOrUpdate = 6

;********************************************************
; Create the TaskService object.
service := ComObjCreate("Schedule.Service")
service.Connect()

;********************************************************
; Get a folder to create a task definition in. 
rootFolder := service.GetFolder("\")

; The taskDefinition variable is the TaskDefinition object.
; The flags parameter is 0 because it is not supported.
taskDefinition := service.NewTask(0) 

;********************************************************
; Define information about the task.

; Set the registration info for the task by 
; creating the RegistrationInfo object.
regInfo := taskDefinition.RegistrationInfo
regInfo.Description := "Intellipharm - 1300 255 160 - This task will launch HSNET daily."
regInfo.Author := "Intellipharm"

;********************************************************
; Set the principal for the task
principal := taskDefinition.Principal
principal.LogonType := LogonType  ; Set the logon type to interactive logon


; Set the task setting info for the Task Scheduler by
; creating a TaskSettings object.
settings := taskDefinition.Settings
settings.Enabled := True
settings.StartWhenAvailable := True
settings.Hidden := False

;********************************************************
; Create a time-based trigger.
triggers := taskDefinition.Triggers
trigger := triggers.Create(TriggerType)

; Trigger variables that define when the trigger is active.
;startTime += 30, Seconds  ;start time = 30 seconds from now

startTime = 2017-01-01T%count%:00+10:00
;FormatTime,startTime,%startTime%,yyyy-MM-ddTHH`:mm`:ss

;endTime += 5, Minutes  ;end time = 5 minutes from now
;FormatTime,endTime,%endTime%,yyyy-MM-ddTHH`:mm`:ss

trigger.StartBoundary := startTime
;trigger.EndBoundary := endTime
trigger.ExecutionTimeLimit := "PT5M"    ;Five minutes
trigger.Id := "TimeTriggerId"
trigger.Enabled := True

;***********************************************************
; Create the action for the task to execute.

; Add an action to the task to run notepad.exe.
Action := taskDefinition.Actions.Create( ActionTypeExec )
Action.Path := "C:\INTPHARM\HSNET\HSNET.exe"

;***********************************************************
; Register (create) the task.
rootFolder.RegisterTaskDefinition("Intellipharm - HSNET", taskDefinition, TaskCreateOrUpdate ,"","", 3)

;========== END OF SCHEDULE TASK SECTION ===========

InputBox, count, STARTUP TIME,Please set the time you would like HSNET to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,00:15

log("SCHEDULE TIME SET`n")
IniWrite %count%, C:\INTPHARM\HSNET\hsnet.ini, Settings, ScheduleTime
FileAppend, Task Schedule Set, C:\INTPHARM\hsnet.txt


;log("Restarting HSNET")
;run, C:\INTPHARM\HSNET\hsnet.exe
;sleep 1000
*/

IniWrite %count%, C:\INTPHARM\HSNET\hsnet.ini, Settings, ScheduleTime

log("✔️ - You can now close HSNET Config")

log("Config will close in 30 seconds")
sleep 10000
log("Config will close in 20 seconds")
sleep 10000
log("Config will close in 10 seconds")
counter("10...")
sleep 1000
counter("9...")
sleep 1000
counter("8...")
sleep 1000
counter("7...")
sleep 1000
counter("6...")
sleep 1000
counter("5...")
sleep 1000
counter("4...")
sleep 1000
counter("3...")
sleep 1000
counter("2...")
sleep 1000
counter("1...")
sleep 1000
ExitApp
		}

Countdown:
Secs -= 1
WinSetTitle, Closing in,, Closing in %Secs% seconds 
return

/****************************************
Main - End
*/

;Function that writes to the logs. This is where the magic happens.
log(msg)
{
FileAppend, ;Text file write
(
%msg%`n
), HSNET_Config_LOG.txt
GuiControlGet, Console
GuiControl, , Console, %Console%%msg%`r`n ; GUI write
ControlSend,Edit1,^{End},HSNET Config - %STORE%
sleep 500 ; Pause for smooth log scrolling
}

counter(msg)
{
FileAppend, ;Text file write
(
%msg%
), HSNET_Config_LOG.txt
GuiControlGet, Console
GuiControl, , Console, %Console%%msg% ; GUI write
ControlSend,Edit1,^{End},HSNET Config - %STORE%
sleep 500 ; Pause for smooth log scrolling
}

Return

GuiClose:
Gui, Destroy
ExitApp

ESC::
ExitApp
