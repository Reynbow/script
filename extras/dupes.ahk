	#Persistent
	#SingleInstance Force
	#NoEnv

	Gui, Color, 1d1f21, 383D46, 282a2e
	Gui, -SysMenu -caption +Border
	Gui, Font, s11, Segoe UI
	Gui, Add, Text, x0 y0 w290 h25 Center guiMove,
	Gui, Add, Text, xp+10 yp+10 w280 cWHITE -E0x200 , Paste Line Here:
	Gui, Add, Edit, yp+30 w280 cWHITE -E0x200 vTheText
	Gui, Add, Button, yp+50 w130 h30 cWHITE -E0x200 gConfirm , Confirm
	Gui, Add, Button, xp+150 w130 h30 cWHITE -E0x200 gExit, Exit
	Gui, Show,, Duplicates
	return

	Confirm:
	Gui, Submit
	StringReplace, NewText, TheText, %A_Space%, `n, All
	Sort, NewText, u

	Gui, Destroy
	Gui, Color, 1d1f21, 383D46, 282a2e
	Gui, -SysMenu -caption +Border
	Gui, Font, s11, Segoe UI
	Gui, Add, Text, x0 y0 w290 h25 Center guiMove,
	Gui, Add, Text, xp+10 yp+10 w280 cWHITE -E0x200 , Complete:
	Gui, Add, Edit, yp+30 w280 h400 cWHITE -E0x200 , %NewText%
	Gui, Add, Button, yp+415 w130 h30 cWHITE -E0x200 gRepeat, Repeat
	Gui, Add, Button, xp+150 w130 h30 cWHITE -E0x200 gExit, Exit
	Gui, Show,, Duplicates
	Return

	Exit:
	ExitApp

	Repeat:
	Reload
	Return

	uiMove:
	PostMessage, 0xA1, 2,,, A 
	Return

	Esc::
	ExitApp

	Enter::
	gosub Confirm
	Return