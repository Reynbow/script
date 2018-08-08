LoyADMIN:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy
FileRead, codelist, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, LoyAdmin:-SysMenu -caption -Border %OnTopSetting%
Gui, LoyAdmin:Color, %BGColour%, 2b2e43
Gui, LoyAdmin:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, LoyAdmin:Add, Picture, x390 y325 , C:\AutoHotKey\Files\ui\back-loy.png
Gui, LoyAdmin:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x18 y18 , CONTACT INITIATION
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x18 y45 vIN, #IN
Gui, LoyAdmin:Add, Checkbox, yp+20 vOUT, #OUT
Gui, LoyAdmin:Add, Checkbox, yp+20 vEMAIL, #EMAIL
Gui, LoyAdmin:Add, Text, x151 y45 w150 h50 , Incoming Call	
Gui, LoyAdmin:Add, Text, yp+20 w150 h50 , Outgoing Call
Gui, LoyAdmin:Add, Text, yp+20 w150 h50 , Email contact

Gui, LoyAdmin:Add, Text, x18 y110 h15, CONTACT NAME:
Gui, LoyAdmin:font, s10 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x18 y130 h15, S I T E   C O D E :
Gui, LoyAdmin:Add, Text, yp+30 h20 w254 vPreviewCODE, 
Gui, LoyAdmin:font, 
Gui, LoyAdmin:font, s8 cE8EBF5
Gui, LoyAdmin:Add, Edit, x152 y104 w120 h20 -E0x200 vConName, 
Gui, LoyAdmin:Add, Edit, x152 y129 w120 h20 -E0x200 vSCODE, 
Gui, LoyAdmin:Add, Text, x18 y192 h15, Notes section:
Gui, LoyAdmin:Add, Edit, x17 y207 w254 h70 -E0x200 -VScroll vNotes, 
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, GroupBox, x18 y290 h240 w255 , Preview
Gui, LoyAdmin:Add, Text, x30 y310 h208 w238 vPreviewALL, 
Gui, LoyAdmin:font,

Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y18, INSTALL RELATED
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y45 , #APPOINTMENT
Gui, LoyAdmin:Add, Text, yp+20 , #TRAINED 
Gui, LoyAdmin:Add, Checkbox, yp+20 vLegacyDB, #LEGACYDB
Gui, LoyAdmin:Add, Checkbox, yp+20 vLoyAdmin, #LOYADMIN
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y45 w120 h16 vAppointment, 
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y65 w120 h16 vTrained,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x416 y85, Import/export legacy database
Gui, LoyAdmin:Add, Text, x416 y105, Pre-install, general admin etc.


Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y135 , PRODUCTS
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y160 vLoyV2, #LOYV2
Gui, LoyAdmin:Add, Checkbox, checked x306 y180 vLoyV3 , #LOYV3
Gui, LoyAdmin:Add, Text, x416 y160, Loyalty Version 2
Gui, LoyAdmin:Add, Text, x416 y180, Loyalty Version 3


Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y215 , MINFOS
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y240 vMINFd, #MINFDIRECT
Gui, LoyAdmin:Add, Checkbox, x306 y260 vMINFb, #MINFBOUNCE
Gui, LoyAdmin:Add, Text, x416 y240, Told customer to call Minfos
Gui, LoyAdmin:Add, Text, x416 y260, Minfos told customer to call us

Gui, LoyAdmin:font, s12 bold cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, x306 y295, ISSUES
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x306 y320 vIssue1 , #ICL
Gui, LoyAdmin:Add, Checkbox, x306 y340 vIssue2 , #LOYOUTAGE
Gui, LoyAdmin:Add, Checkbox, x306 y360 vIssue3 , #OTHER
Gui, LoyAdmin:Add, Checkbox, x306 y380 vIssue4 , #PINS
Gui, LoyAdmin:Add, Checkbox, x306 y400 vIssue5 , #PL
Gui, LoyAdmin:Add, Checkbox, x306 y420 vIssue6 , #POINTEXCL
Gui, LoyAdmin:Add, Checkbox, x306 y440 vIssue7 , #POINTSINV
Gui, LoyAdmin:Add, Checkbox, x306 y460 vIssue8 , #PRINTERS
Gui, LoyAdmin:Add, Checkbox, x306 y480 vIssue9 , #REDEMP
Gui, LoyAdmin:Add, Checkbox, x306 y500 vIssue10 , #REMAP
Gui, LoyAdmin:Add, Checkbox, x306 y520 vIssue11 , #REPORTS
Gui, LoyAdmin:Add, Text, x306 y540 , #RETRAINED
Gui, LoyAdmin:Add, Checkbox, x306 y560 vIssue13 , #WIN10
Gui, LoyAdmin:Add, Text, x416 y320, Store has difficulties logging in
Gui, LoyAdmin:Add, Text, x416 y340, Intpharm-side service outage
Gui, LoyAdmin:Add, Text, x416 y360, Unrelated to other tags 
Gui, LoyAdmin:Add, Text, x416 y380, Loyalty PINs
Gui, LoyAdmin:Add, Text, x416 y400, Prompter/Balance Checker/Till 
Gui, LoyAdmin:Add, Text, x416 y420, Settings rules (Points + Exclusions)
Gui, LoyAdmin:Add, Text, x416 y440, Points investigation
Gui, LoyAdmin:Add, Text, x416 y460, Printer issues
Gui, LoyAdmin:Add, Text, x416 y480, Loyalty Redemptions
Gui, LoyAdmin:Add, Text, x416 y500, Running Remap resolved issue
Gui, LoyAdmin:Add, Text, x416 y520, Loyalty Reports 
Gui, LoyAdmin:Add, Edit, -E0x200 x416 y540 w120 h16 vRetrain,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Text, BackgroundTrans x416 y560, Upgraded to Windows 10


Gui, LoyAdmin:font, s12 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x620 y18, NEW STORE -
Gui, LoyAdmin:Add, Checkbox, x735 y18 vNewStore , 
Gui, LoyAdmin:font,
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Checkbox, x620 y45 vNS1 , Store record created
Gui, LoyAdmin:Add, Checkbox, x620 y65 vNS2 , UI features updated (CM and Choice)
Gui, LoyAdmin:Add, Checkbox, x620 y85 vNS3 , Welcome && Birthday Emails (Choice)
Gui, LoyAdmin:Add, Checkbox, x620 y105 vNS4 , Credentials added to Wiki 
Gui, LoyAdmin:Add, Checkbox, x620 y125 vNS5 , POSX installed and up-to-date
Gui, LoyAdmin:Add, Checkbox, x620 y145 vNS6 , Waiting on Fred Credentials
Gui, LoyAdmin:Add, Checkbox, x620 y165 vNS7 , Stock Imported

Gui, LoyAdmin:font, s12 cE8EBF5 bold, Segoe UI
Gui, LoyAdmin:Add, Text, x620 y210, POS CHANGE - 
Gui, LoyAdmin:Add, Checkbox, x745 y210 vPOSChange , 
Gui, LoyAdmin:font,  
Gui, LoyAdmin:font, s8 cE8EBF5, Segoe UI
Gui, LoyAdmin:Add, Edit, -E0x200 x716 y240 w100 h16 vOldID ,
Gui, LoyAdmin:Add, Text, x620 y240 vOID , Old Store ID:
Gui, LoyAdmin:Add, Checkbox, x620 y260 vPC1, Name and Sitecode olded
Gui, LoyAdmin:Add, Checkbox, x620 y280 vPC2, Passwords changed
Gui, LoyAdmin:Add, Checkbox, x620 y300 vPC3, Removed email from web account
Gui, LoyAdmin:Add, Checkbox, x620 y320 vPC4, New record created
Gui, LoyAdmin:Add, Checkbox, x620 y340 vPC5, UI features updated
Gui, LoyAdmin:Add, Checkbox, x620 y360 vPC6, Wiki credentials updated

Gui, LoyAdmin:Add, Text, x620 y400 vNID , New Store ID:
Gui, LoyAdmin:Add, Edit, -E0x200 x716 y400 w100 h16 vNewID,
Gui, LoyAdmin:Add, Checkbox, x620 y420 vPC7, Requested dev update import record
Gui, LoyAdmin:Add, Checkbox, x620 y440 vPC8, Import record updated
Gui, LoyAdmin:Add, Checkbox, x620 y460 vPC9, Waiting for Site Reset
Gui, LoyAdmin:Add, Checkbox, x620 y480 vPC10, Site Reset Complete
Gui, LoyAdmin:Add, Checkbox, x620 y500 vPC11, Stock Imported
Gui, LoyAdmin:Add, Checkbox, x620 y520 w16 h16 vPC12, ;Members moved to new store
Gui, LoyAdmin:Add, Text , BackgroundTrans x638 y520, Members moved to new store

Gui, LoyAdmin:Add, Button, x18 y545 w80 h30 hwndLoyAd1, Confirm
Gui, LoyAdmin:Add, Button, x105 y545 w80 h30 hwndLoyAd2, Back
Gui, LoyAdmin:Add, Button, x192 y545 w80 h30 hwndLoyAd3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(LoyAd1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyAd2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyAd3, Opt1, Opt2, , , Opt5)

Gui, LoyAdmin:Show, %Gui_Cord% w840 h590, %A_Space%
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, LoyAdmin:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, LoyAdmin:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    IN 				:= IN ? " #IN" : ""
	OUT 			:= OUT ? " #OUT" : ""
	EMAIL 			:= EMAIL ? " #EMAIL" : ""
	ConN 			:= ConN ? " •• Contact Name: " : ""
	LoyAdmin 		:= LoyAdmin ? " #LOYADMIN" : ""
	LegacyDB 		:= LegacyDB ? " #LEGACYDB" : ""
	Appointment 	:= Appointment ? " [ #APPOINTMENT: " Appointment " ]" : ""
	Trained 		:= Trained ? " [ #TRAINED: " Trained " ]" : ""

	LoyV2 			:= LoyV2 ? " #LOYV2" : ""
	LoyV3 			:= LoyV3 ? " #LOYV3" : ""
	MinfD 			:= MinfD ? " #MINFDIRECT" : ""
	MinfB 			:= MinfB ? " #MINFBOUNCE" : ""

	Issue1 			:= Issue1 ? " #ICL" : ""
	Issue2 			:= Issue2 ? " #LOYOUTAGE" : ""
	Issue3 			:= Issue3 ? " #OTHER" : ""
	Issue4 			:= Issue4 ? " #PINS" : ""
	Issue5 			:= Issue5 ? " #PL" : ""
	Issue6 			:= Issue6 ? " #POINTEXCL" : ""
	Issue7 			:= Issue7 ? " #POINTSINV" : ""
	Issue8 			:= Issue8 ? " #PRINTERS" : ""
	Issue9 			:= Issue9 ? " #REDEMP" : ""
	Issue10 		:= Issue10 ? " #REMAP" : ""
	Issue11 		:= Issue11 ? " #REPORTS" : ""
	Retrain 		:= Retrain ? " [ #RETRAINED: " Retrain " ] " : ""
	Issue13 		:= Issue13 ? "#WIN10 " : ""

	NewStoreOpen 	:= NewStore ? "[ NEW STORE: " : ""
	NewStoreClose 	:= NewStore ? " ] " : ""
	NS1 			:= NS1 ? "Store record created • " : ""
	NS2 			:= NS2 ? "UI features updated (CM and Choice) • " : ""
	NS3 			:= NS3 ? "Welcome & Birthday Emails (Choice) • " : ""
	NS4 			:= NS4 ? "Credentials added to Wiki • " : ""
	NS5 			:= NS5 ? "POSX installed and up-to-date • " : ""
	NS6 			:= NS6 ? "Waiting on Fred credentials • " : ""
	NS7 			:= NS7 ? "Stock imported" : ""

	POSChangeOpen 	:= POSChange ? " [ POS CHANGE: " : ""
	POSChangeClose 	:= POSChange ? " ] " : ""

	OldID			:= OldID ? " (Old ID: " OldID ") " : ""

	PC1				:= PC1 ? "Name and Sitecode olded • " : ""
	PC2				:= PC2 ? "Passwords changed • " : ""
	PC3				:= PC3 ? "Removed email from web account • " : ""
	PC4				:= PC4 ? "New record created • " : ""
	PC5				:= PC5 ? "UI features updated • " : ""
	PC6				:= PC6 ? "Wiki credentials updated" : ""

	NewID			:= NewID ? " (New ID: " NewID ") " : ""

	PC7				:= PC7 ? "Requested dev update import record • " : ""
	PC8				:= PC8 ? "Import record updated • " : ""
	PC9				:= PC9 ? "Waiting for Site Reset • " : ""
	PC10			:= PC10 ? "Site Reset complete • " : ""
	PC11			:= PC11 ? "Stock imported • " : ""
	PC12			:= PC12 ? "Members moved to new store" : ""

	ConName := ConName ? " Spoke to: " ConName " " : ""


    msgText = % Time " - " IN OUT EMAIL LoyV2 LoyV3 LoyAdmin LegacyDB ConName Appointment Trained MinfD MinfB Issue1 Issue2 Issue3 Issue4 Issue5 Issue6 Issue7 Issue8 Issue9 Issue10 Issue11 Retrain Issue13 NewStoreOpen NS1 NS2 NS3 NS4 NS5 NS6 NS7 NewStoreClose POSChangeOpen OldID PC1 PC2 PC3 PC4 PC5 PC6 NewID PC7 PC8 PC9 PC10 PC11 PC12 POSChangeClose " •• " Notes

    if NOT (msgText == oldMsgText)
    {
       GuiControl, LoyAdmin:Text, PreviewALL, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

Return

LoyAdminButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

LoyAdminButtonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, LoyAdmin:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

LoyAdminButtonConfirm:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loy Admin`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt	
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

reload
Return