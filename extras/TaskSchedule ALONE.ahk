;------------------------------------------------------------------
; This sample schedules a task to start notepad.exe 30 seconds
; from the time the task is registered.
; Requires AutoHotkey_L
;------------------------------------------------------------------

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
regInfo.Description := "Intellipharm - 1300 255 160 - This task will launch HSNET at 11.30pm daily."
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

startTime = 2017-01-01T23:30:00+10:00
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

;MsgBox % "Task submitted.`nstartTime :" . startTime . "`nendTime :" . endTime