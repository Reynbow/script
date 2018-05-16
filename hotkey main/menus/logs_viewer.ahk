LogsViewer:
Gui, 99:Destroy

IfNotExist, C:\AutoHotKey\logsettings.ini
	{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\logsettings.ini, C:\AutoHotKey\logsettings.ini, 1
	}

IniRead, dispdrive, C:\AutoHotKey\logsettings.ini, drives, dispx
IniRead, posdrive, C:\AutoHotKey\logsettings.ini, drives, posx
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Logs:-SysMenu +Border
Gui, Logs:Color, 1d1f21, 383D46


Gui, Logs:font, s14 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y18 , LOGS VIEWER

Gui, Logs:font, 
Gui, Logs:font, s10 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y160 , SITE CODE:
Gui, Logs:font, 
Gui, Logs:font, s10 cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, yp+20 -E0x200 w120 vSiteCode,

Gui, Logs:font, 
Gui, Logs:font, s8 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y58 , DISPX DRIVE:
Gui, Logs:Add, Edit, xp+70 w15 h15 -E0x200 vdispdrive, %dispdrive%

Gui, Logs:Add, Text, x18 yp+20, POSX DRIVE:
Gui, Logs:Add, Edit, xp+70 w15 h15 -E0x200 vposdrive, %posdrive%

Gui, Logs:font, 
Gui, Logs:font, s14 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Button, x115 y65 w25 h25 gupdatedrive, ↑

Gui, Logs:font, 
Gui, Logs:font, s8 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Radio, x18 yp+45 vDISP , DISPX
Gui, Logs:Add, Radio, yp+20 vPOS, POSX

Gui, Logs:font, 
Gui, Logs:font, s7 cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x75 y110 , (only current date)

FormatTime, Date,, yyyyMMdd

Gui, Logs:font, 
Gui, Logs:font, s10 bold cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x18 y210 , DATE:
Gui, Logs:font, 
Gui, Logs:font, s10 cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, yp+20 -E0x200 w120 vDate, %Date%

Gui, Logs:Add, Button, yp+50 w120 gopenlogfile, OPEN FILE

Gui, Logs:Add, Button, yp+40 w55 gopendrivedisp, DISP:\
Gui, Logs:Add, Button, xp+65 w55 gopendrivepos, POS:\

Gui, Logs:Add, Button, xp-65 yp+70 w120 gmapdisp, MAP DISPX
Gui, Logs:Add, Button, yp+40 w120 gmappos, MAP POSX

Gui, Logs:Add, Button, yp+60 w120 glogsexit, EXIT



Gui, Logs:font,
Gui, Logs:font, cE8EBF5, Segoe UI
Gui, Logs:Add, Edit, x170 y28 w602 h490 -E0x200 ReadOnly vPreview, 
Gui, Logs:Add, GroupBox, x160 y20 w614 h500,

Gui, Logs:Show, %Gui_Cord% w795 h540, Logs Viewer

loop
{
    Gui, Logs:Submit, NoHide
	
    DISP := DISP ? dispdrive ":\MYSQL\dserversql\logs\" SiteCode "_CURRENT.TXT": ""
	POS := POS ? posdrive ":\Logs\" SiteCode "_PXLOG_" Date ".TXT" : ""

	FileRead, Display, %DISP%%POS%

    msgText = %Display%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, Logs:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return


updatedrive:
IniWrite, %posdrive%, C:\AutoHotKey\logsettings.ini, drives, posx
IniWrite, %dispdrive%, C:\AutoHotKey\logsettings.ini, drives, dispx
return

logsexit:
reload
return

openlogfile:
run, %DISP%%POS%
return

opendrivedisp:
IniRead, dispdrive, C:\AutoHotKey\logsettings.ini, drives, dispx
run, %dispdrive%:\MYSQL\dserversql\logs\
return

opendrivepos:
IniRead, posdrive, C:\AutoHotKey\logsettings.ini, drives, posx
run, %posdrive%:\Logs\
return

mapdisp:
Msgbox, 4,,Would you like to map the drive required for DISPX?
IfMsgBox Yes
	Run %comspec% /c net use L: \\10.8.224.22\live
return

mappos:
Msgbox, 4,,Would you like to map the drive required for POSX?
IfMsgBox Yes
	Run %comspec% /c net use I: \\10.8.224.25\Iserver_mysql
return