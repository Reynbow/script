SupPaths:
Gui, 2:Destroy
Clipboard =
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=451

Gui, Paths:Add, Picture, x-181 y342 , C:\AutoHotKey\Files\back-right.png
Gui, Paths:+ToolWindow -SysMenu +Border
Gui, Paths:font, s12 cE8EBF5 bold, Segoe UI
Gui, Paths:Color, 1d1f21, 383D46
Gui, Paths:Add, Text, center x0 y20 w210 h50, COMMON`nPATHS
Gui, Paths:font,
Gui, Paths:font, cE8EBF5,
;Gui, Paths:Add, GroupBox, x15 y80 w180 h185 , 
Gui, Paths:Add, Button, x30 yp+75 w150 h30 gPathsINT, INTPHARM Directory
Gui, Paths:Add, Button, yp+40 w70 h30 gPathsCRON, CRON
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsDISP, DISPX
Gui, Paths:Add, Button, xp-80 yp+40 w70 h30 gPathsHSNET, HSNET
Gui, Paths:Add, Button, xp+80 w70 h30 gPathsPOSX, POSX
Gui, Paths:Add, Button, xp-80 yp+40 w150 h30 gPathsMSOAP, MSOAP
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsMSOAPClient, MINSOAP CLIENT
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsRECron, RESTART CRON
Gui, Paths:Add, Button, yp+40 w150 h30 gPathsREHsnet, RESTART HSNET

;Gui, Paths:Add, Button, yp+40 w150 h30 , &8 Ecom Excel Creation

Gui, Paths:font, s9 cE8EBF5 bold, Segoe UI
Gui, Paths:Add, Text, BackGroundTrans center x0 yp+50 w210 h50 vPreview,

Gui, Paths:Add, Button, x12 y680 w184 h30 gBackCancel, Close

Gui, Paths:Show, x%gui_x% y%gui_y% w210 h725, %A_Space%

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

EXIT:
Gui, Destroy
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