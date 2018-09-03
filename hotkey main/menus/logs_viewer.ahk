LogsViewer:
Gui, 99:Destroy

IfNotExist, C:\AutoHotKey\logsettings.ini
	{
	FileCopy, mapdisp:\Support\Public Staff Folders\Aaron\Update\logsettings.ini, C:\AutoHotKey\logsettings.ini, 1
	}

IniRead, dispdrive, C:\AutoHotKey\logsettings.ini, drives, dispx
IniRead, posdrive, C:\AutoHotKey\logsettings.ini, drives, posx
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Logs:-SysMenu -caption -Border %OnTopSetting%
Gui, Logs:Add, Picture, x0 y160 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, Logs:Color, %BGColour%, 2b2e43
Gui, Logs:Add, Text, x0 y0 w408 h25 Center GuiMove,


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
Gui, Logs:Add, Button, x115 y65 w25 h25 gupdatedrive hwndLOGS1, ↑

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

Gui, Logs:Add, Button, yp+50 w120 gopenlogfile hwndLOGS2, OPEN FILE

Gui, Logs:Add, Button, yp+40 w55 gopendrivedisp hwndLOGS3, DISP:\
Gui, Logs:Add, Button, xp+65 w55 gopendrivepos hwndLOGS4, POS:\

Gui, Logs:Add, Button, xp-65 yp+70 w120 gmapdisp hwndLOGS5, MAP DISPX
Gui, Logs:Add, Button, yp+40 w120 gmappos hwndLOGS6, MAP POSX

Gui, Logs:Add, Button, yp+60 w120 glogsexit hwndLOGS7, EXIT



Gui, Logs:font,
Gui, Logs:font, cE8EBF5, Segoe UI
Gui, Logs:Add, Text, x162 y28 w40 h490
Gui, Logs:Add, Edit, x170 y28 w602 h490 -E0x200 ReadOnly vPreview, 
Gui, Logs:Add, GroupBox, x160 y20 w614 h500,

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(LOGS1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS3, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS4, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS5, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS6, Opt1, Opt2, , , Opt5)
ImageButton.Create(LOGS7, Opt1, Opt2, , , Opt5)

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
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
FileRead, codelist, mapdisp:\Support\Public Staff Folders\Aaron\Update\codelist.txt
IniRead, FirstName, C:\AutoHotKey\settings.ini, UserName, Name
IniRead, SecondName, C:\AutoHotKey\settings.ini, UserName, Surname
Gui, mapdisp:-SysMenu -caption -Border %OnTopSetting%
Gui, mapdisp:Color, 1f2130, 2b2e43
Gui, mapdisp:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, mapdisp:Add, Picture, x0 y-140 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, mapdisp:font, s16 bold cWHITE, Segoe UI
Gui, mapdisp:Add, Text, x20 y18 , CONNECT TO %dispdrive%:\
Gui, mapdisp:font, 
Gui, mapdisp:font, cWHITE, Segoe UI
Gui, mapdisp:Add, Text, yp+40 cWHITE -E0x200 , USERNAME:
Gui, mapdisp:Add, Edit, xp+80 w195 cWHITE -E0x200 vUsername, pharmacy\%FirstName%.%SecondName%
Gui, mapdisp:Add, Text, xp-80 yp+35 cWHITE -E0x200 BackgroundTrans, PASSWORD:
Gui, mapdisp:Add, Edit, xp+80 w195 cWHITE -E0x200 vPassword,
Gui, mapdisp:Add, Button, xp-80 yp+40 w130 h30 hwndG1 gConnectDISP, % "CONNECT"
Gui, mapdisp:Add, Button, xp+146 w130 h30 hwndG2 gCloseDISP, % "CLOSE"
GuiControl, mapdisp:Focus, Password

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(G1, Opt1, Opt2, , , Opt5)
ImageButton.Create(G2, Opt1, Opt2, , , Opt5)

DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 0)
Gui, mapdisp:Show, %Gui_Cord% w314 h190, %A_Space%
DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 1)
Return

CloseDISP:
Reload
Return

ConnectDISP:
Gui, mapdisp:Submit
Run %comspec% /c net use L: \\10.8.224.22\live /USER:pharmacy\%FirstName%.%SecondName% "%Password%" /PERSISTENT:NO
Reload
return

mappos:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
FileRead, codelist, mappos:\Support\Public Staff Folders\Aaron\Update\codelist.txt
IniRead, FirstName, C:\AutoHotKey\settings.ini, UserName, Name
IniRead, SecondName, C:\AutoHotKey\settings.ini, UserName, Surname
Gui, mappos:-SysMenu -caption -Border %OnTopSetting%
Gui, mappos:Color, 1f2130, 2b2e43
Gui, mappos:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, mappos:Add, Picture, x0 y-140 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, mappos:font, s16 bold cWHITE, Segoe UI
Gui, mappos:Add, Text, x20 y18 , CONNECT TO %posdrive%:\
Gui, mappos:font, 
Gui, mappos:font, cWHITE, Segoe UI
Gui, mappos:Add, Text, yp+40 cWHITE -E0x200 , USERNAME:
Gui, mappos:Add, Edit, xp+80 w195 cWHITE -E0x200 vUsername, pharmacy\%FirstName%.%SecondName%
Gui, mappos:Add, Text, xp-80 yp+35 cWHITE -E0x200 BackgroundTrans, PASSWORD:
Gui, mappos:Add, Edit, xp+80 w195 cWHITE -E0x200 vPassword,
Gui, mappos:Add, Button, xp-80 yp+40 w130 h30 hwndG1 gConnectPOS, % "CONNECT"
Gui, mappos:Add, Button, xp+146 w130 h30 hwndG2 gClosePOS, % "CLOSE"
GuiControl, mappos:Focus, Password

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(G1, Opt1, Opt2, , , Opt5)
ImageButton.Create(G2, Opt1, Opt2, , , Opt5)

DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 0)
Gui, mappos:Show, %Gui_Cord% w314 h190, %A_Space%
DllCall("SystemParametersInfo", UInt, SPI_SETCLIENTAREAANIMATION := 0x1043, UInt, 0, UInt, 1)
Return

ClosePOS:
Reload
Return

ConnectPOS:
Gui, mappos:Submit
Run %comspec% /c net use I: \\10.8.224.25\Iserver_mysql /USER:pharmacy\%FirstName%.%SecondName% "%Password%" /PERSISTENT:NO
Reload
return