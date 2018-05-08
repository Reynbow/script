#SingleInstance, Force
#NoEnv
SendMode Input
#Persistent	
SetBatchLines, -1
SendMode, Event
SetKeyDelay 25, 10

Gui, font, bold
Gui, Add, Text, x12 y9 w120 h20 , Server settings
Gui, font, 
Gui, Add, Text, x22 y29 w250 h20 , Enter in the required information and select Start
Gui, Add, Text, x-1 y44 , ____________________________________________________________________________________________________________________________
Gui, Add, Text, x12 y81 w100 h20 , Server Name
Gui, Add, Edit, x122 y79 w208 h20 vBox1, nexusdb@
Gui, Add, Text, x12 y111 w110 h20 , SQL Timeout (ms)
Gui, Add, Edit, x122 y109 w208 h20 vBox2, 10000000
Gui, Add, Button, x12 y149 w100 h30 , Start
Gui, Add, Button, x132 y149 w200 h30 , EXIT
Gui, Show, w345 h190, MTNTOP ODBC Configuration
return

GuiClose:
ExitApp

ButtonExit:
ExitApp

ButtonStart:
gui, submit
InputBox, count, MTNTOP ODBC Configuration, Enter the number of entries you need to edit and ensure the FIRST entry is highlighted,,345,150
Loop, % count
{
	WinActivate, odbcad32.exe
	sleep 250
	send, {TAB 3}
	sleep 250
	send, {ENTER}
	sleep 250
	send, {TAB}
	sleep 250
	send, %Box1%
	sleep 250
	send, {TAB 2}
	sleep 250
	send, %Box2%
	sleep 250
	send, {TAB 6}
	sleep 250
	send, {ENTER}
	sleep 1000
	send, {ENTER}
	sleep 250
	send, {TAB 2}
	sleep 250
	send, {ENTER}
	sleep 250
	send, {DOWN}
}
ExitApp

ESC::
ExitApp