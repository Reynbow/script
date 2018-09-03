Q7:
SupEMAILS:
;Gui, Destroy 
;Gui, 99:Destroy 
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

gui_x +=450

Gui, 7:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, 7:-SysMenu -caption -Border %OnTopSetting%
Gui, 7:Color, %BGColour%, 2b2e43
Gui, 7:Add, Picture, x0 y390 , C:\AutoHotKey\Files\ui\back-sup-ext.png
Gui, 7:font, s12 bold cE8EBF5, Segoe UI
Gui, 7:Add, Text, Center x0 y80 w210, Email Templates
Gui, 7:font,
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Text, Center x10 y130 w190, Outlook MUST be running before you click any of these buttons. It will not work if you do not.

;Gui, 7:Add, Button, x30 y220 w150 h30 Left gFredExcel hwndemail2 , % "   FRED Excel Form"
Gui, 7:Add, Button, x30 y220 w150 h30 Left gLoyEsc hwndemail3, % "   Loyalty Escalation"
Gui, 7:Add, Button, yp+40 w150 h30 Left gLoyRe hwndemail4, % "   Loyalty Reinstallation"
Gui, 7:Add, Button, yp+40 w150 h30 Left gWebservice hwndemail6, % "   MINFOS Webservice"
Gui, 7:Add, Button, yp+40 w150 h30 Left gBatchReader hwndemail7, % "   POS Browser Batch Reader"
Gui, 7:Add, Button, yp+60 w150 h30 Left gBugReport hwndemail5, % "   Bugs Reporting Tool"

/*
Gui, 7:font, s8 cE8EBF5 bold,
Gui, 7:Add, GroupBox, x215 y120 w180 h230 , EMAILS TO REPS
Gui, 7:font, 
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Button, x230 y145 w150 h30 , Data Outage Resolved
Gui, 7:Add, Button, x230 y185 w150 h30 , Installation Complete `n(Pending QA)
Gui, 7:Add, Button, x230 y225 w150 h30 , Installation Complete
Gui, 7:Add, Button, x230 y265 w150 h30 , Knock Back (Data Outage)
Gui, 7:Add, Button, x230 y305 w150 h30 , Knock Back (Installation)
*/


Gui, 7:Add, Button, x12 y670 w184 h30 hwndemail1 , Close

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        
ImageButton.Create(email1, Opt1, Opt2, , , Opt5)
ImageButton.Create(email2, Opt1, Opt2, , , Opt5)
ImageButton.Create(email3, Opt1, Opt2, , , Opt5)
ImageButton.Create(email4, Opt1, Opt2, , , Opt5)
ImageButton.Create(email5, Opt1, Opt2, , , Opt5)
ImageButton.Create(email6, Opt1, Opt2, , , Opt5)
ImageButton.Create(email7, Opt1, Opt2, , , Opt5)

Gui, 7:Show, x%gui_x% y%gui_y% w210 h715, %A_Space% ;✉ ;w210 h620, 
return

7ButtonBack:
Gui, 7:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub MAINMENU
return

7ButtonClose:
Gui, 7:Destroy
return

;=====================================================EMAIL WINDOW END

BugReport:
run, https://support.intellipharm.com.au
reload
return

;================================ POSBROWSER BATCH READER START

BatchReader:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90D:-SysMenu -caption -Border
Gui, 90D:Color, %BGColour%, 2b2e43
Gui, 90D:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 90D:Add, Picture, x0 y20 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, 90D:font, s12 bold cE8EBF5, Segoe UI
Gui, 90D:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90D:Add, Text, x38 y26 w200 , POSBROWSER BATCH READER ACCESS REQUEST
Gui, 90D:font,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Text, x38 y103 h30, Store Name:
Gui, 90D:Add, Edit, -E0x200 x120 y100 w130 vBox2,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Text, x38 y195 , Additional Information
Gui, 90D:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90D:font, cE8EBF5, Segoe UI
Gui, 90D:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90D:Add, Text, x302 y76 w80 h268 
Gui, 90D:Add, Text, x320 y76 w338 h268 vPreviewDOR, 
Gui, 90D:Add, Text, BackgroundTrans x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90D:Add, Button, x38 y288 w215 h30 hwndBatch1, &Confirm
;Gui, 90D:Add, Button, x38 y328 w100 h30 hwndBatch2, &Back
Gui, 90D:Add, Button, x153 y328 w100 h30 hwndBatch3, &Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(Batch1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Batch2, Opt1, Opt2, , , Opt5)
ImageButton.Create(Batch3, Opt1, Opt2, , , Opt5)

Gui, 90D:Show, %Gui_Cord% w686 h395, 

loop
{
    Gui, 90D:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`tsupport@possolutions.com.au`nSubject: `tBatch Reader Access Request - %Box2%`n`n`nHi POS Solutions`n`nI am emailing in regards to %Box2%. The pharmacy has signed up for our data collection service. Would you be able to please provide batch reader access for us? If you have any questions, please give me a call.`n%Box3%`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90D:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90DButtonClose:
Reload
return

90DButtonBack:
	Gui, 90D:Destroy
	gosub Q7
return

90DButtonConfirm:
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
	Gui, Submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Batch Reader Access`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@possolutions.com.au"
	email.Cc := "support@intellipharm.com.au"
	email.Subject := "Batch Reader Access Request - " Box2
	email.Body := "Hi POS Solutions`n`nI am emailing in regards to " Box2 ". The pharmacy has signed up for our data collection service. Would you be able to please provide batch reader access for us? If you have any questions, please give me a call.`n" Box3 "`nKind Regards`n"
	email.Display

	reload
return

;================================ POSBROWSER BATCH READER END

;=====================================================MINFOS WEB

Webservice:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 76:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, 76:-SysMenu -caption -Border %OnTopSetting%
Gui, 76:Color, %BGColour%, 2b2e43
Gui, 76:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 76:Add, Picture, x0 y-75 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, 76:font, s12 cE8EBF5 bold, Segoe UI
Gui, 76:Add, Edit, -E0x200 x1920 y2490 w80 vPlacehold,
Gui, 76:Add, Text, x23 y24 , Minfos Webservice Unavailable
Gui, 76:font,
Gui, 76:font, s8 cE8EBF5, Segoe UI
Gui, 76:Add, Text, x18 y78 h30, Store Name
Gui, 76:Add, Edit, -E0x200 x18 y98 w250 vBox1,
Gui, 76:Add, Text, x18 y138 h30, Webservice address
Gui, 76:Add, Edit, -E0x200 x18 y158 w250 vBox2,
Gui, 76:Add, Button, x16 y210 w80 h30 hwndMinf1 , Confirm
;Gui, 76:Add, Button, x104 y210 w80 h30 hwndMinf2, Back
Gui, 76:Add, Button, x192 y210 w80 h30 hwndMinf3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(Minf1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Minf2, Opt1, Opt2, , , Opt5)
ImageButton.Create(Minf3, Opt1, Opt2, , , Opt5)

Gui, 76:Show, %Gui_Cord% w286 h252, 
return

76ButtonExit:
Reload
return

76ButtonBack:
Gui, 76:Destroy
gosub Q7
return

76ButtonConfirm:
	Gui, Submit
	
GuiControlGet, MyDateTime
	
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - MINFOS Webservices Email`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	
	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "minfos_support@minfos.com.au"
	email.Cc := "support@intellipharm.com.au"
	email.Subject := Box1 " - Webservices Unavailable - Please double check Midas"
	email.Body := "Hi Minfos Support,`n`nCan you please double check Midas is running correctly at this store?`nWe are having troubles accessing the webservice:`n" Box2 "`n`nIf you have any questions, please let me know.`n`nRegards,`n" Name " " Surname "`nIntellipharm`n1300 255 160"
	email.Display

return

;=====================================================END MINFOS WEB

;=====================================================LOYALTY REINSTALLATION

LoyRe:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = %A_Space%|1|2|3|4|5|6|7|8
Gui, 46:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, 46:-SysMenu -caption -Border %OnTopSetting%
Gui, 46:Color, %BGColour%, 2b2e43
Gui, 46:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 46:Add, Picture, x0 y100 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, 46:font, s16 bold cE8EBF5, Segoe UI
Gui, 46:Add, Text, x12 y12 w425 , LOYALTY REINSTALLATION
Gui, 46:font, 
Gui, 46:font, cE8EBF5, Segoe UI
Gui, 46:Add, Text, x12 y62 w90 h20 , Site Code
Gui, 46:Add, Edit, -E0x200 x100 y60 w90 h20 vBox1,
Gui, 46:Add, Text, x12 y92 w80 h20 , Site Name
Gui, 46:Add, Edit, -E0x200 x100 y90 w90 h20 vBox2,
Gui, 46:Add, Text, x12 y122 w80 h20 , Store Contact
Gui, 46:Add, Edit, -E0x200 x100 y120 w90 h20 vBox3,
Gui, 46:Add, Text, x12 y152 h20 , POS System
Gui, 46:Add, Edit, -E0x200 x100 y150 w90 h20 vBox4,
Gui, 46:Add, CheckBox, x12 y182 h20 vCb_1, POS Change
Gui, 46:Add, Edit, -E0x200 x100 y180 w90 h20 vBox5,
Gui, 46:Add, Text, x12 y212 w80 h20 , Date of change
Gui, 46:Add, Edit, -E0x200 x100 y210 w90 h20 vBox6,

Gui, 46:Add, Groupbox, x12 y240 w177 h75 , Backup
Gui, 46:Add, Radio, x22 y260 h20 vCb_2, Backup Kept
Gui, 46:Add, Radio, x22 y280 h20 vCb_3, No Backup

Gui, 46:Add, Text, x222 y59 h20 , When did issues begin? (approx date)
Gui, 46:Add, Edit, -E0x200 x222 y79 w190 h20 vBox7,

Gui, 46:Add, Groupbox, x222 y123 w190 h90 , Reinstall locations?
Gui, 46:Add, Radio, x232 y140 h20 vCb_4, Main + Tills
Gui, 46:Add, Radio, x232 y160 h20 vCb_5, Main Computer
Gui, 46:Add, Radio, x232 y180 h20 vCB_6, Tills 
Gui, 46:Add, DropDownList, x362 y140 w40 vChoice1, %A_Space%%List1%
Gui, 46:Add, DropDownList, x362 y180 w40 vChoice2, %A_Space%%List1%

Gui, 46:Add, Groupbox, x222 y225 w190 h90 , Additional information
Gui, 46:Add, CheckBox, x232 y245 h20 vCb_7, Crypto
Gui, 46:Add, CheckBox, x232 y265 h20 vCb_8, Computer Replaced
Gui, 46:Add, CheckBox, x232 y285 h20 vCb_9, Additional Till

Gui, 46:Add, Text, x12 y330 w180 h20 , More information
Gui, 46:Add, Edit, -E0x200 x12 y350 w400 h60 -VScroll vBox8,
Gui, 46:Add, Button, x12 y425 w160 h30 hwndLoyRein1, Send
;Gui, 46:Add, Button, x152 y425 w120 h30 hwndLoyRein2, Back
Gui, 46:Add, Button, x252 y425 w160 h30 hwndLoyRein3, Exit

Gui, 46:Add, Groupbox, x440 y30 w385 h410, Preview
Gui, 46:Add, Text, x442 y55 w368 h383
Gui, 46:Add, Text, x455 y55 w368 h383 vPreviewLoyIn, 

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(LoyRein1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyRein2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyRein3, Opt1, Opt2, , , Opt5)

Gui, 46:Show,  %Gui_Cord% w845 h467, %A_Space%

loop
{
    Gui, 46:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	POSChange := Cb_1 ? "POS Changed: " : ""
	Kept := Cb_2 ? "Kept " : ""
	NotKept := Cb_3 ? "Not Kept " : ""
	MCT := Cb_4 ? "Main Computer + Tills " : ""
	MC := Cb_5 ? "Main Computer " : ""
	T := Cb_6 ? "Tills " : ""
	Cryp := Cb_7 ? "Crypto " : ""
	Comp := Cb_8 ? "Computer Replaced " : ""
	AddT := Cb_9 ? "Additional Till " : ""
	
    msgText = To: `t`tsupport@loyaltyone.com.au`nSubject: `tLoyalty Reinstallation Required - %Box1% %Box2%`n`n`nSite Code:`t`t%Box1%`nSite Name:`t`t%Box2%`nStore Contact:`t`t%Box3%`n`nPOS System:`t`t%Box4%`n%POSChange%`t`t%Box5%`t%Box6%`nBackup:`t`t%Kept%%NotKept%`n`nIssue began around:`t%Box7%`n`nReinstall locations:`t%MCT%%Choice1%%MC%%T%%Choice2%`n`nAdditional Information:`n%Cryp%`n%Comp%`n%AddT%`n`nAdditional Notes:`t%Box8%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 46:Text, PreviewLoyIn, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

46ButtonSend:
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
Gui, Submit

If(Cb_1=1)
 GuiControlGet, POSChange,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Kept,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, NotKept,, Cb_3, Text
If(Cb_4=1)
 GuiControlGet, MCT,, Cb_4, Text
If(Cb_5=1)
 GuiControlGet, MC,, Cb_5, Text
If(Cb_6=1)
 GuiControlGet, T,, Cb_6, Text
If(Cb_7=1)
 GuiControlGet, Cryp,, Cb_6, Text
 If(Cb_8=1)
 GuiControlGet, Comp,, Cb_8, Text
 If(Cb_9=1)
 GuiControlGet, AddT,, Cb_9, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Email Reinstallation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@loyaltyone.com.au"
	email.Subject := "Loyalty Reinstallation Required - " SiteCode " " SiteName
	email.Body := "Site Code:`t`t" Box1 "`nSite Name:`t`t" Box2 "`nStore Contact:`t`t" Box3 "`n`nPOS System:`t`t" Box4 "`n" POSChange "`t`t" Box5 "`t" Box6 "`nBackup:`t`t" Kept NotKept "`n`nIssue began around:`t" Box7 "`n`nReinstall locations:`t" MCT Choice1 MC T Choice2 "`n`nAdditional Information:`n" Cryp "`n" Comp "`n" AddT "`n`nAdditional Notes:`t" Box8
	email.Send

	clipboard := Time " LOYALTY REINSTALLATION: FORWARDED •• Reinstall Location: " MCT MC T " •• Information: " Cryp Comp AddT " •• " Box8
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
	sleep 5000
	reload
return

46ButtonBack:
Gui, 46:Destroy
gosub Q7
return

46ButtonExit:
Reload
return

;=====================================================LOYALTY REINSTALLATION END

;=====================================================LOYALTY CALL ESCALATION

LoyEsc:
Gui, Destroy
Gui, 99:Destroy

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 44:Add, Text, x0 y0 w323 h25 Center GuiMove,
Gui, 44:-SysMenu -caption -Border %OnTopSetting%
Gui, 44:Color, %BGColour%, 2b2e43
Gui, 44:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 44:Add, Picture, x0 y260 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, 44:font, s12 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x19 y12 w403 , LOYALTY CALL ESCALATION
Gui, 44:font, 
Gui, 44:font, s8 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y40 h20 , Store Details: 
Gui, 44:font, 
Gui, 44:font, cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y65 w120 h20 , Site Code: 
Gui, 44:Add, Edit, -E0x200 x110 y64 w90 h18 vSiteCode,
Gui, 44:Add, Text, x20 y90 w120 h20 , Site Name: 
Gui, 44:Add, Edit, -E0x200 x110 y89 w90 h18 vSiteName,
Gui, 44:Add, Text, x20 y115 w120 h20 , Store Contact: 
Gui, 44:Add, Edit, -E0x200 x110 y114 w90 h18 vContact,
Gui, 44:Add, Text, x20 y150 w120 h20 , Card Number: 
Gui, 44:Add, Edit, -E0x200 x110 y149 w90 h18 vCardNo,
Gui, 44:Add, Text, x20 y175 w120 h20 , Customer Name: 
Gui, 44:Add, Edit, -E0x200 x110 y174 w90 h18 vCustName,
Gui, 44:Add, Text, x20 y200 w120 h20 , Docket Number: 
Gui, 44:Add, Edit, -E0x200 x110 y199 w90 h18 vDockNo,
Gui, 44:font, s8 bold cE8EBF5, Segoe UI
Gui, 44:Add, Text, x20 y250 w160 , What Issue/s are they experiencing:
Gui, 44:font, 
Gui, 44:font, cE8EBF5, Segoe UI
Gui, 44:Add, CheckBox, x20 y280 w90 h20 vCb_1 , Prompter
Gui, 44:Add, CheckBox, x20 y300 w90 h20 vCb_2 ,  Website
Gui, 44:Add, CheckBox, x20 y320 w150 h20 vCb_3 , Remap not working
Gui, 44:Add, CheckBox, x20 y340 h20 vCb_4 , Transactions/Points/Redemp

Gui, 44:Add, Text, x212 y50 w190 h20 , Error Message:
Gui, 44:Add, Edit, -E0x200 x212 y65 w170 h50 -VScroll vError, 
Gui, 44:Add, Text, x212 y130 w190 h20 , Describe Issue in Detail:
Gui, 44:Add, Edit, -E0x200 x212 y145 w170 h50 -VScroll vDesc, 
Gui, 44:Add, Text, x212 y210 w190 h20 , Steps Taken to Resolve Issue:
Gui, 44:Add, Edit, -E0x200 x212 y225 w170 h50 -VScroll vSteps, 
Gui, 44:Add, Groupbox, x18 y375 w365 h250, Preview
Gui, 44:Add, Text, x20 y423 w20 h200 ,
Gui, 44:Add, Text, x28 y400 w353 h223 vPreviewLoyEsc, 

Gui, 44:Add, Button, x212 y290 w170 h30 hwndLoyEsc1, Forward Escalation
;Gui, 44:Add, Button, x212 y330 w80 h30 hwndLoyEsc2, Back
Gui, 44:Add, Button, x212 y330 w170 h30 hwndLoyEsc3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(LoyEsc1, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyEsc2, Opt1, Opt2, , , Opt5)
ImageButton.Create(LoyEsc3, Opt1, Opt2, , , Opt5)

Gui, 44:Show, %Gui_Cord% h640 w403, %A_Space%

loop
{
    Gui, 44:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	Cb_1_Text := Cb_1 ? "Prompter " : ""
	Cb_2_Text := Cb_2 ? "Website " : ""
	Cb_3_Text := Cb_3 ? "Remap not working " : ""
	Cb_4_Text := Cb_4 ? "Transactions/Points/Redemptions " : ""
	
    msgText = To: `tsupport@loyaltyone.com.au`nSubject: `tLoyalty Call Escalation %SiteCode% %SiteName%`n`n`nStore Contact:`t%Contact%`nIssue With:`t%Cb_1_Text%%Cb_2_Text%%Cb_3_Text%%Cb_4_Text%`nError Message:`t%Error%`n`nCard Number:`t%CardNo%`nCustomer Name:`t%CustName%`nDocket Number:`t%DockNo%`nDetails:`t`t%Desc%`n`nSteps Taken to Resolve:`t%Steps%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 44:Text, PreviewLoyEsc, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

44ButtonBack:
Gui, 44:Destroy
gosub Q7
return
 
44ButtonForwardEscalation:
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
Gui, Submit

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, Cb_3_Text,, Cb_3, Text 
 If(Cb_4=1)
 GuiControlGet, Cb_4_Text,, Cb_4, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Loyalty Email Escalation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "support@loyaltyone.com.au"
	;email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Loyalty Call Escalation " SiteCode " " SiteName ;objects like this (the email code) use strange inverted variables. The stuff in commas is plain text, the text without commas are the above variables. To enter a new line it needs to be in commas as it's code. Without commas means it's looking for a variable.
	email.Body := "Store Contact:`t`t" Contact "`n" "Issue With:`t`t" Cb_1_Text " " Cb_2_Text " " Cb_3_Text " " Cb_4_Text "`n" "Error Message:`t`t" Error "`n`n" "Card Number:`t`t" CardNo "`n" "Customer Name:`t`t" CustName "`n" "Docket Number:`t`t" DockNo "`n" "Details:`t`t`t" Desc "`n`n" "Steps Taken to Resolve:`t" Steps "`n`n - `n`n"
	email.Send

	clipboard := Time " LOYALTY ESCALATION: FORWARDED •• Error: " Error " •• Issue detailed: " Desc " •• Any Steps Taken to Resolve: " Steps
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
	sleep 5000
	reload
return

44ButtonExit:
Reload
return

;=====================================================LOYALTY CALL ESCALATION END

;=====================================================FRED EXCEL

FredExcel:
Gui, Destroy
Gui, 99:Destroy

Gui, 47:-SysMenu -caption -Border
Gui, 47:Color, %BGColour%, 2b2e43
Gui, 47:Add, Text, x0 y0 w686 h25 Center GuiMove,
Gui, 47:Add, Picture, x0 y55 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, 47:font, s12 bold cE8EBF5, Segoe UI
Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
Gui, 47:font,
Gui, 47:font, cE8EBF5, Segoe UI
Gui, 47:Add, Button, x152 y39 w110 h20 hwndFredEx4, Autofill
Gui, 47:Add, Text, x28 y71 w140 h20 , Store ID:
Gui, 47:Add, Edit, -E0x200 x152 y69 w110 h20 vBox7,
Gui, 47:Add, Text, x28 y101 w160 h20 , Pharmacy Name:
Gui, 47:Add, Edit, -E0x200 x152 y99 w110 h20 vBox1, 
Gui, 47:Add, Text, x28 y131 w150 h20 , Address:
Gui, 47:Add, Edit, -E0x200 x152 y129 w110 h20 vBox3, 
Gui, 47:Add, Text, x28 y161 w140 h20 , Suburb:
Gui, 47:Add, Edit, -E0x200 x152 y159 w110 h20 vBox4, 
Gui, 47:Add, Text, x28 y191 w140 h20 , Phone:
Gui, 47:Add, Edit, -E0x200 x152 y189 w110 h20 vBox5, 
Gui, 47:Add, Text, x28 y221 w140 h20 , Mobile:
Gui, 47:Add, Edit, -E0x200 x152 y219 w110 h20 vBox6,
Gui, 47:Add, Text, x28 y251 w160 h20 , Clients:
Gui, 47:Add, Edit, -E0x200 x152 y249 w110 h20 vBox2, 
Gui, 47:Add, Text, x28 y281 w140 h20 , Primary Contact:
Gui, 47:Add, Edit, -E0x200 x152 y279 w110 h20 vBox8,
Gui, 47:Add, Text, BackgroundTrans x28 y311 w140 h30 , Secondary Contact:
Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
Gui, 47:Add, Button, x23 y345 w75 h30 hwndFredEx1, Confirm
;Gui, 47:Add, Button, x106 y345 w75 h30 hwndFredEx2, Back
Gui, 47:Add, Button, x189 y345 w75 h30 hwndFredEx3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(FredEx1, Opt1, Opt2, , , Opt5)
ImageButton.Create(FredEx2, Opt1, Opt2, , , Opt5)
ImageButton.Create(FredEx3, Opt1, Opt2, , , Opt5)
ImageButton.Create(FredEx4, Opt1, Opt2, , , Opt5)

Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 47:Add, Text, x302 y72 w338 h272, 
Gui, 47:Add, Text, x316 y72 w342 h272 vFredExcelPrev, 

Gui, 47:Show, %Gui_Cord% w686 h395,%A_Space%

loop
{
    Gui, 47:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
	IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
	IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

    msgText = To: `t`tdataaccessrequest@fred.com.au`nCC:`t`tsupport@intellipharm.com.au`nSubject:`t`tData Access Request for - %Box1% from Intellipharm`n`n`nHi, `nDocument attached with store details for FRED Credential Request.`nStore name: %Box1%`nSite Code: %Box7%`n`nKind Regards,`n%Name% %Surname%`nIntellipharm`n1300 255 160

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 47:Text, FredExcelPrev, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

47ButtonAutofill:
v1 := "Store ID"
v2 := "Name"
v3 := "Street Address 1"
v4 := "Street Address 2"
v5 := "Suburb"
v6 := "Phone	"
    if errorlevel
        return
    RegExMatch(clipboard, "m)^" v1 "(.+)$", a)
    RegExMatch(clipboard, "m)^" v2 "(.+)$", b)
	RegExMatch(clipboard, "m)^" v3 "(.+)$", c)
    RegExMatch(clipboard, "m)^" v4 "(.+)$", d)
	RegExMatch(clipboard, "m)^" v5 "(.+)$", e)
	RegExMatch(clipboard, "m)^" v6 "(.+)$", f)
    if !(a1 and b1)
        MsgBox ,,Error, Not found. Please copy the Site IQ record in full.
    else

	ad1 	:= % trim(c1)
	ad2 	:= % trim(d1)
	
		Gui, 47:Destroy

        Gui, 47:-SysMenu -caption -Border
        Gui, 47:Color, %BGColour%, 2b2e43
        Gui, 47:Add, Text, x0 y0 w686 h25 Center GuiMove,
        Gui, 47:Add, Picture, x0 y55 , C:\AutoHotKey\Files\ui\back-sup-wide.png
        Gui, 47:font, s12 bold cE8EBF5, Segoe UI
        Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
		Gui, 47:font,
		Gui, 47:font, cE8EBF5, Segoe UI
		Gui, 47:Add, Button, x152 y39 w110 h20 hwndFredEx5, Autofill
		Gui, 47:Add, Text, x28 y71 w140 h20 , Store ID:
		Gui, 47:Add, Edit, -E0x200 x152 y69 w110 h20 vBox7, % trim(a1)
		Gui, 47:Add, Text, x28 y101 w160 h20 , Pharmacy Name:
		Gui, 47:Add, Edit, -E0x200 x152 y99 w110 h20 vBox1, % trim(b1)
		Gui, 47:Add, Text, x28 y131 w150 h20 , Address:
		Gui, 47:Add, Edit, -E0x200 x152 y129 w110 h20 vBox3, %ad1% %ad2%
		Gui, 47:Add, Text, x28 y161 w140 h20 , Suburb:
		Gui, 47:Add, Edit, -E0x200 x152 y159 w110 h20 vBox4, % trim(e1)
		Gui, 47:Add, Text, x28 y191 w140 h20 , Phone:
		Gui, 47:Add, Edit, -E0x200 x152 y189 w110 h20 vBox5, % trim(f1)
		Gui, 47:Add, Text, x28 y221 w140 h20 , Mobile:
		Gui, 47:Add, Edit, -E0x200 x152 y219 w110 h20 vBox6,
		Gui, 47:Add, Text, x28 y251 w160 h20 , Clients:
		Gui, 47:Add, Edit, -E0x200 x152 y249 w110 h20 vBox2, 
		Gui, 47:Add, Text, x28 y281 w140 h20 , Primary Contact:
		Gui, 47:Add, Edit, -E0x200 x152 y279 w110 h20 vBox8,
		Gui, 47:Add, Text, BackgroundTrans x28 y311 w140 h30 , Secondary Contact:
		Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
		Gui, 47:Add, Button, x23 y345 w75 h30 hwndFredEx6, Confirm
		;Gui, 47:Add, Button, x106 y345 w75 h30 hwndFredEx7, Back
		Gui, 47:Add, Button, x189 y345 w75 h30 hwndFredEx8, Exit

        Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
        Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
        Opt5 := [ ,            ,       , 0x0C131E]        

        ImageButton.Create(FredEx5, Opt1, Opt2, , , Opt5)
        ImageButton.Create(FredEx6, Opt1, Opt2, , , Opt5)
        ImageButton.Create(FredEx7, Opt1, Opt2, , , Opt5)
        ImageButton.Create(FredEx8, Opt1, Opt2, , , Opt5)

		Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
		Gui, 47:Add, Text, x302 y72 w338 h272, 
		Gui, 47:Add, Text, x316 y72 w342 h272 vFredExcelPrev, 

		Gui, 47:Show, %Gui_Cord% w686 h395, %A_Space%

		loop
		{
			Gui, 47:Submit, NoHide
			FormatTime, Date,, yyyy/MM/dd
			FormatTime, Time,, h:mmtt
			
			IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
			IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

			msgText = To: `t`tdataaccessrequest@fred.com.au`nCC:`t`tsupport@intellipharm.com.au`nSubject:`t`tData Access Request for - %Box1% from Intellipharm`n`n`nHi, `nDocument attached with store details for FRED Credential Request.`nStore name: %Box1%`nSite Code: %Box7%`n`nKind Regards,`n%Name% %Surname%`nIntellipharm`n1300 255 160

			if NOT (msgText == oldMsgText)
			{
			GuiControl, 47:Text, FredExcelPrev, %msgText%
			oldMsgText := msgText
			}

			sleep 100
		}
		return


47ButtonExit:
Reload
return

47ButtonBack:
Gui, 47:Destroy
gosub Q7
return

47ButtonConfirm:
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9
gui, submit

;WinWaitClose, ahk_class AutoHotkeyGUI

IfNotExist, C:\AutoHotKey\Files\FRED.xlsx
{
FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\FRED.xlsx, C:\AutoHotKey\Files\FRED.xlsx, 1
}

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - FRED Excel Form`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

WorkBookPath		:= "C:\AutoHotKey\Files\FRED.xlsx"											; store the path to the workbook
objExcel					:= ComObjCreate("Excel.Application")        			; create a handle to a new excel application
objWorkBook		:= objExcel.Workbooks.Open(WorkBookPath)    	; opens the existing excel table
objExcel.Visible		:= FALSE                                    									; make excel visible

objExcel.Range("A1").Value := "Pharmacy Name"
objExcel.Range("B1").Value := "Client/Service"
objExcel.Range("C1").Value := "Address"
objExcel.Range("D1").Value := "Suburb"
objExcel.Range("E1").Value := "Phone"
objExcel.Range("F1").Value := "Mobile"
objExcel.Range("G1").Value := "Sitecode"
objExcel.Range("H1").Value := "Primary Contact"
objExcel.Range("I1").Value := "Secondary Contact"

objExcel.Range("A2").Value := Box1
objExcel.Range("B2").Value := Box2
objExcel.Range("C2").Value := Box3
objExcel.Range("D2").Value := Box4
objExcel.Range("E2").Value := Box5
objExcel.Range("F2").Value := Box6
objExcel.Range("G2").Value := Box7
objExcel.Range("H2").Value := Box8
objExcel.Range("I2").Value := Box9

objExcel.Range("A1:I1").Font.Bold := 1

;objExcel.Column("A1:I1").ColumnWidth := 15

objExcel.Range("A1:I1").ColumnWidth := 20
;objExcel.Range("A1:I1").Columns.AutoFit

objWorkBook.Save
objExcel.Quit()
objExcel 	:= ""

FileCopy, C:\AutoHotKey\Files\FRED.xlsx, C:\AutoHotKey\FRED Access %Box1%.xlsx

gosub, FredEmailObject

FredEmailObject:

	Gui, FredConf:+AlwaysOnTop -SysMenu -Border
	Gui, FredConf:Margin, 16, 16
	Gui, FredConf:Color, 1d1f21
	Gui, FredConf:Font, s11, Segoe UI

	Gui, FredConf:Add, Text, xm cFFFFFF -E0x200 , Would you like to copy this for your site note?
	Gui, FredConf:Add, Text, xm w320 c00ff00 -E0x200 , %Time% - POSX Install #OUT #EMAIL - Spoke to %Box8% (confirmed using STOPS - YES) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box8% 2. %Box9%

	Gui, FredConf:Add, Button, xm w150 h30 gFredConYES, YES
	Gui, FredConf:Add, Button, x+20 w150 h30 gFredConNo, NO
	Gui, FredConf:Show, , Fred Confirmation

return

reload
return

FredConYES:
Clipboard = %Time% - POSX Install #OUT #EMAIL - Spoke to %Box8% (confirmed using STOPS - YES) - Two points of contact for Fred to do some maintenance to prepare for POSX install are 1. %Box8% 2. %Box9%
TrayTip, Clipboard Ready, %clipboard%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Fred Confirmation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
attach	:= "C:\AutoHotKey\FRED Access " Box1 ".xlsx"

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intellipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return

FredConNO:
attach	:= "C:\AutoHotKey\FRED Access " Box1 ".xlsx"

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intellipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return