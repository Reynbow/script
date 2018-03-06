#SingleInstance, Force

    Gui, 97:Margin, 16, 16
    Gui, 97:Color, 1d1f21, 383D46, 282a2e
    Gui, 97:-SysMenu -caption +Border
    Gui, 97:Font, s11, Segoe UI
	Gui, 97:Add, Picture, x10 y10 w240 h48 , C:\Users\Aaron.Beecham\Pictures\logo.png
    Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , Please type your name
	Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , First Name:
    Gui, 97:Font, s10, Segoe UI
    Gui, 97:Add, Edit, xm w280 cc5c8c6 -E0x200 vName ;gFindus
	Gui, 97:Font, s11, Segoe UI
	Gui, 97:Add, Text, xm w280 cc5c8c6 -E0x200 , Surname:
    Gui, 97:Font, s10, Segoe UI
    Gui, 97:Add, Edit, xm w280 cc5c8c6 -E0x200 vSurname ;gFindus
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , HELP DESK 1
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , HELP DESK 2
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , HELP DESK 3
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , HELP DESK 4
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , QUICK SUPPORT 1
	Gui, 97:Add, Button, xm w130 cc5c8c6 -E0x200 , QUICK SUPPORT 2
	Gui, 97:Add, Button, xp+150 w130 cc5c8c6 -E0x200 gExit, Exit
    Gui, 97:Show,, Name

F10::Reload

Exit:
ExitApp