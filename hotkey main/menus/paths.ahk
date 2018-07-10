SupPaths:
Gui, 2:Destroy
Clipboard =
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, Paths:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png
Gui, Paths:-SysMenu -caption -Border %OnTopSetting%
Gui, Paths:font, s12 cE8EBF5 bold, Segoe UI
Gui, Paths:Color, %BGColour%, 2b2e43
Gui, Paths:Add, Text, center x0 y20 w210 h50, COMMON`nPATHS
Gui, Paths:font,
Gui, Paths:font, cE8EBF5,
;Gui, Paths:Add, GroupBox, x15 y80 w180 h185 , 
Gui, Paths:Add, Button, x30 yp+125 w150 h30 gPathsINT hwndPATH1, INTPHARM Directory
Gui, Paths:Add, Button, yp+40 w70 h30 gPathsCRON hwndPATH2, CRON
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsDISP hwndPATH3, DISPX
Gui, Paths:Add, Button, xp-80 yp+40 w70 h30 gPathsHSNET hwndPATH4, HSNET
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsPOSX hwndPATH5, POSX
Gui, Paths:Add, Button, xp-80 yp+40 w150 h30 gPathsMSOAP hwndPATH6, MSOAP
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsMSOAPClient hwndPATH7, MINSOAP CLIENT
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsRECron hwndPATH8, RESTART CRON
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsREHsnet hwndPATH9, RESTART HSNET

;Gui, Paths:Add, Button, yp+40 w150 h30 , &8 Ecom Excel Creation

Gui, Paths:font, s9 cE8EBF5 bold, Segoe UI
Gui, Paths:Add, Text, BackGroundTrans center x0 yp+50 w210 h50 vPreview,

Gui, Paths:Add, Button, x12 y670 w184 h30 gBackCancel hwndPATH10, Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(PATH1, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH2, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH3, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH4, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH5, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH6, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH7, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH8, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH9, Opt1, Opt2, , , Opt5)
ImageButton.Create(PATH10, Opt1, Opt2, , , Opt5)

Gui, Paths:Show, x%gui_x% y%gui_y% w210 h715, %A_Space%

loop
{
    Gui, Paths:Submit, NoHide
    msgText = %Clipboard%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, Paths:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
Return

PathsINT:
Clipboard = C:\INTPHARM\
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsCRON:
Clipboard = C:\INTPHARM\CRON\cron.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsDISP:
Clipboard = C:\INTPHARM\DISPX\dispx.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsHSNET:
Clipboard = C:\INTPHARM\HSNET\hsnet.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsPOSX:
Clipboard = C:\INTPHARM\POSX\PRG\posx.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsMSOAP:
Clipboard = C:\INTPHARM\MSOAP\msoap.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsMSOAPClient:
Clipboard = C:\INTPHARM\MSOAP\minsoapclient.exe
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsRECron:
Clipboard = C:\INTPHARM\CRON\restarteverything.bat
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

PathsREHsnet:
Clipboard = C:\INTPHARM\HSNET\restarteverything.bat
;TrayTip, Clipboard Ready, %Clipboard%, 5, 16
Return

BackCancel:
Gui, Paths:destroy
Return