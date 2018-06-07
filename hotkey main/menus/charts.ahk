ProcessCharts:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 86:-SysMenu -caption -Border
Gui, 86:Color, %BGColour%, 2b2e43
Gui, 86:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 86:Add, Picture, x0 y150 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, 86:font, bold cE8EBF5 s12, Segoe UI
Gui, 86:Add, Text, center x1 y20 w274 , PROCESS CHARTS
Gui, 86:font, 
Gui, 86:font, bold cE8EBF5 s8, Segoe UI

Gui, 86:Add, Button, x28 y465 w100 h30 hwndcharts39, BACK
Gui, 86:Add, Button, x143 y465 w100 h30 hwndcharts40, EXIT

AddImageTab2("", "GENERAL|DISPENSARY|POS|LOYALTY")
;Gui, 86:Add, Tab2, x12 y59 w250 h390 , GENERAL|DISPENSARY|POS|LOYALTY

Gui, 86:Tab, GENERAL
Gui, 86:Add, Button, x28 y120 w102 h30 hwndcharts7, QA
Gui, 86:Add, Button, x143 yp+0 w102 h30 hwndcharts1, Sanofi QA
Gui, 86:Add, Button, x28 yp+40 w217 h30 hwndcharts2, General Installation Help
Gui, 86:Add, Button, yp+40 w217 h30 gEcom hwndcharts3, E-Commerce
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts4, Email
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts5, Clients and Services
Gui, 86:Add, Button, yp+40 w217 h30 gGroupAccount hwndcharts6, Making a Group Account
Gui, 86:Add, Button, yp+40 w217 h30 gMoveInstall hwndcharts41, Moving Installations

Gui, 86:Tab, DISPENSARY
Gui, 86:Add, Button, x28 y120 w102 h30 hwndcharts8, Aquarius
Gui, 86:Add, Button, x143 yp+0 y120 w102 h30 gAmfacd hwndcharts9, Amfac
Gui, 86:Add, Button, x28 yp+40 w217 h30 gFNd hwndcharts10, Fred Next
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSd hwndcharts11, LOTS
Gui, 86:Add, Button, x143 yp+0 w102 h30 gLOTSNZd hwndcharts12, LOTS NZ
Gui, 86:Add, Button, x28 yp+40 w217 h30 gMINFd hwndcharts13, MINFOS
Gui, 86:Add, Button, yp+40 w217 h30 gMTOPd hwndcharts14, Mountain Top
Gui, 86:Add, Button, yp+40 w217 h30 gProd hwndcharts15, Pharmacy Pro
Gui, 86:Add, Button, yp+40 w217 h30 gToniqd hwndcharts16, Toniq
Gui, 86:Add, Button, yp+40 w217 h30 gZedd hwndcharts17, Zed

Gui, 86:Tab, POS
Gui, 86:Add, Button, x28 y120 w102 h30 hwndcharts18, FRED
Gui, 86:Add, Button, yp+40 w102 h30 gFNp hwndcharts19, Fred Next
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSp hwndcharts20, LOTS
Gui, 86:Add, Button, yp+40 w102 h30 gLOTSNZp hwndcharts21, LOTS NZ
Gui, 86:Add, Button, yp+40 w102 h30 gMINFp hwndcharts22, MINFOS
Gui, 86:Add, Button, yp+40 w102 h30 gMTOPp hwndcharts23, Mountain Top
Gui, 86:Add, Button, yp+40 w102 h30 gProp hwndcharts24, Pharmacy Pro
Gui, 86:Add, Button, yp+40 w102 h30 hwndcharts25, POS Browser
Gui, 86:Add, Button, x143 y120 w102 h30 hwndcharts26, POS Works
Gui, 86:Add, Button, yp+40 w102 h30 hwndcharts27, POS Master
Gui, 86:Add, Button, yp+40 w102 h30 hwndcharts28, Simple
Gui, 86:Add, Button, yp+40 w102 h30 gToniqp hwndcharts29, Toniq
Gui, 86:Add, Button, yp+40 w102 h30 gZedp hwndcharts30, Zed

Gui, 86:Tab, LOYALTY
Gui, 86:Add, Button, x28 y120 w217 h30 hwndcharts31, Loyalty Clients
Gui, 86:Add, Button, yp+40 w217 h30 gLoyMinfTrain hwndcharts32, Intergrated MINFOS Training
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts33, Install Back Office
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts34, Install Mountain Top
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts35, Install STOPS
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts36, Install LOTS
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts37, Install SIMPLE
Gui, 86:Add, Button, yp+40 w217 h30 hwndcharts38, Install Zed
Gui, 86:Tab

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

Loop, 41
{
CHARTS++
ImageButton.Create(charts%CHARTS%, Opt1, Opt2, , , Opt5)
}

Gui, 86:Show, %Gui_Cord% w274 h513, %A_Space%
return

AddImageTab2(Options, Pages, Vertical = False) {
	static HwndList := {}

	Opt1 := [3, 0x1f2130   , 0x2b2e43      ,  "WHITE" , , , 0x1f2130, 0]
	Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , "WHITE", 1]
	Opt5 := [ ,            ,       , 0x0C131E]        

	Gui, 86:Add, Tab2, x20 y75 w0 h0 AltSubmit HwndHTab , % Pages ; Add an invisible Tab control
	Gui, 86:Tab

	Loop, Parse, Pages, |
	{
		_Options := (A_Index = 1) ? Options " Disabled xp" : (Vertical ? "y+0" : "x+0")
		Gui, 86:Add, Button, %_Options% HwndHBT g___AddImageTab_ChangeTab2, % A_LoopField
			ImageButton.Create(HBT, Opt1, Opt2, Opt3, Opt4)

		HwndList[HBT]                   := {TabIndex: A_Index, TabHwnd: HTab}
		HwndList["HTab", HTab, A_Index] := HBT
	}

	Return

	___AddImageTab_ChangeTab2:
		GuiControlGet, focused_control, Focus
		GuiControlGet, focused_controlHwnd, Hwnd, %focused_control%
		TabIndex := HwndList[focused_controlHwnd+0]["TabIndex"]
		TabHwnd  := HwndList[focused_controlHwnd+0]["TabHwnd"]

		GuiControl, Choose, %TabHwnd%, |%TabIndex%
		
		For i, hwnd in HwndList["HTab"][TabHwnd]
			GuiControl, % (i = TabIndex) ? "Disable" : "Enable", %hwnd%
	Return
}

Amfacd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\AMFAC Dispx.pdf
Reload
return

GroupAccount:
Gui, 86:Destroy
;Gui Wmp:-SysMenu +Border
Gui Wmp:Color, 1d1f21, 383D46
Gui Wmp: +LastFound
Gui Wmp: Add, ActiveX, w1280 h784 vWmp, WMPLayer.OCX
Wmp.Url := "G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\groupaccount.mp4"
;Gui Wmp:Add, Button, x1080 y800 w200 h30 , EXIT
Gui Wmp: Show, , How to create a Group User account
return

WmpGuiClose:
Reload
Return

86ButtonBack:
Gui, 86:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

86ButtonExit:
Reload
return

86ButtonQA:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\QA Process.pdf
Reload
return

86ButtonSanofiQA:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Sanofi QA Process.pdf
Reload
return

86ButtonGeneralInstallationHelp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Posx and Dispx.pdf
Reload
return

Ecom:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Ecom.pdf
Reload
return

86ButtonEmail:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Email.pdf
Reload
return

86ButtonClientsandServices:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Client Requirements and Products\CLIENTS_AND_SERVICES.pdf
Reload
return

86ButtonAquarius:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Aquarius Dispx.pdf
Reload
return

FNd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FREDNXT Dispx.pdf
Reload
return

LOTSd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTS Dispx.pdf
Reload
return

LOTSNZd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTSNZ - RXONE DISPX installation Process.pdf
Reload
return

MINFd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MINFOS Dispx.pdf
Reload
return

MTOPd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MTNTOP Dispx.pdf
Reload
return

Prod:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Pharmacy Pro Dispx.pdf
Reload
return

Zedd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Z Dispx.pdf
Reload
return

86ButtonFRED:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FRED Posx.pdf
Reload
return

FNp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\FREDNXT Posx.pdf
Reload
return

LOTSp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTS Posx.pdf
Reload
return

LOTSNZp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\LOTSNZ - RXONE Posx installation Process.pdf
Reload
return

MINFp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MINFOS Posx.pdf
Reload
return

MTOPp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\MTNTOP Posx.pdf
Reload
return

Prop:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Pharmacy Pro Posx.pdf
Reload
return

86ButtonPOSBrowser:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\POSB Posx.pdf
Reload
return

86ButtonPOSWorks:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\POSW Posx.pdf
Reload
return

86ButtonPosmaster:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Posmaster Posx.pdf
Reload
return

86ButtonSIMPLE:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\SIMPLE Posx.pdf
Reload
return

Zedp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Z Posx.pdf
Reload
return

86ButtonLoyaltyClients:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Loyalty Clients\websites-loyalty.htm
Reload
return

LoyMinfTrain:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Intergrated MINFOS Loyalty Training TILL.pdf
Reload
return

86ButtonInstallBackOffice:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - Backoffice.pdf
Reload
return

86ButtonInstallMountainTop:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - Mountaintop.pdf
Reload
return

86ButtonInstallSTOPS:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - STOPS.pdf
Reload
return

86ButtonInstallLOTS:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - LOTS.pdf
Reload
return

86ButtonInstallSIMPLE:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - SIMPLE.pdf
Reload
return

86ButtonInstallZed:
Gui, 86:Destroy
run, G:\Loyalty\Loyalty Procedures\Loyalty Guides\Loyalty Installation - ZED.pdf
Reload
return

Toniqd:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\TONIQ DISPX installation Process.pdf
Reload
return

Toniqp:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\TONIQ POSX installation Process.pdf
Reload
return

MoveInstall:
Gui, 86:Destroy
run, G:\Support\Procedures and Documentation\Flow Chart Processes\Moving Installations.pdf
Reload
Return