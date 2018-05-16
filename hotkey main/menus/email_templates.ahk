﻿Q7:
SupEMAILS:
Gui, Destroy 
Gui, 99:Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 7:+ToolWindow -SysMenu +Border
Gui, 7:font, s16 cE8EBF5 bold, Segoe UI
Gui, 7:Color, 1d1f21, 383D46
Gui, 7:Add, Text, center x1 y32 w420 h50 , ✉ Email Templates ✉
Gui, 7:font,
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Text, center x80 y62 w250 , Outlook MUST be running before you click any of these buttons. It will not work if you do not.

Gui, 7:Add, Button, x30 y120 w150 h30 Left gFredExcel , % "   &1 FRED Excel Form"
Gui, 7:Add, Button, yp+40 w150 h30 Left gLoyEsc, % "   &2 Loyalty Escalation"
Gui, 7:Add, Button, yp+40 w150 h30 Left gLoyRe, % "   &3 Loyalty Reinstallation"
Gui, 7:Add, Button, yp+40 w150 h30 Left gBugReport, % "   &4 Bugs Reporting Tool"
Gui, 7:Add, Button, yp+40 w150 h30 Left gWebservice, % "   &5 MINFOS Webservice"
Gui, 7:Add, Button, yp+40 w150 h30 Left gBatchReader , % "   POS Browser Batch Reader"

Gui, 7:font, s8 cE8EBF5 bold,
Gui, 7:Add, GroupBox, x215 y120 w180 h230 , EMAILS TO REPS
Gui, 7:font, 
Gui, 7:font, s8 cE8EBF5,
Gui, 7:Add, Button, x230 y145 w150 h30 , Data Outage Resolved
Gui, 7:Add, Button, x230 y185 w150 h30 , Installation Complete `n(Pending QA)
Gui, 7:Add, Button, x230 y225 w150 h30 , Installation Complete
Gui, 7:Add, Button, x230 y265 w150 h30 , Knock Back (Data Outage)
Gui, 7:Add, Button, x230 y305 w150 h30 , Knock Back (Installation)

Gui, 7:Add, Button, x230 y365 w70 h30 , &Back
Gui, 7:Add, Button, x310 y365 w70 h30 , E&xit
Gui, 7:Show, %Gui_Cord% w420 h415, %A_Space% ;✉ ;w210 h620, 
return

7ButtonBack:
Gui, 7:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

7ButtonEXIT:
Reload
return

;=====================================================EMAIL WINDOW END

BugReport:
run, https://support.intellipharm.com.au
reload
return

7ButtonDataOutageResolved:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 79:Color, 1d1f21, 383D46
Gui, 79:font, s14 bold cE8EBF5, Segoe UI
Gui, 79:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 79:Add, Text, x18 y18 w289 h50, DATA OUTAGE RESOLVED
Gui, 79:font,
Gui, 79:font, cE8EBF5, Segoe UI
Gui, 79:Add, Text, x18 y83 h30, Contact Email
Gui, 79:font, s6 cE8EBF5, Segoe UI
Gui, 79:Add, Text, x98 y85 h30, (optional)
Gui, 79:font, 
Gui, 79:font, cE8EBF5, Segoe UI
Gui, 79:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 79:Add, Text, x18 y113 h30, Contact Name
Gui, 79:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 79:Add, Text, x18 y143 h30, Store Name
Gui, 79:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 79:Add, Text, x38 y195 , Additional Information
Gui, 79:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 79:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 79:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 79:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 79:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 79:Add, Button, x38 y328 w100 h30 , &Back
Gui, 79:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 79:Show, %Gui_Cord% w686 h395, 

loop
{
    Gui, 79:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tData Outage Resolved - %Box2%`n`n`nHi %Box1%`n`nThe data outage at %Box2% has been resolved.`n`nThe data for this store should be loaded by tomorrow.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 79:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

79ButtonExit:
	reload
return

79ButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

79ButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Data Outage Resolved`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Data Outage Resolved - " Box2
	email.Body := "Hi " Box1 "`n`nThe data outage at " Box2 " has been resolved.`n`nThe data for this store should be loaded by tomorrow.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ DATA OUTAGE RESOLVED END

;================================ INSTALL COMPLETE PENDING QA

7ButtonInstallationComplete(PendingQA):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90:-SysMenu +Border
Gui, 90:Color, 1d1f21, 383D46
Gui, 90:font, s14 bold cE8EBF5, Segoe UI
Gui, 90:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90:Add, Text, x18 y18 w289 h50, INSTALLATION COMPLETE`n(PENDING QA)
Gui, 90:font,
Gui, 90:font, cE8EBF5, Segoe UI
Gui, 90:Add, Text, x18 y83 h30, Contact Email
Gui, 90:font, 
Gui, 90:font, s6 cE8EBF5, Segoe UI
Gui, 90:Add, Text, x98 y85 h30, (optional)
Gui, 90:font, 
Gui, 90:font, cE8EBF5, Segoe UI
Gui, 90:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 90:Add, Text, x18 y113 h30, Contact Name
Gui, 90:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 90:Add, Text, x18 y143 h30, Store Name
Gui, 90:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 90:Add, Text, x38 y195 , Additional Information
Gui, 90:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tInstallation Complete - %Box2% - Pending QA`n`n`nHi %Box1%`n`nThe installation for %Box2% has been completed.`n`nThe stores data will be reviewed over the next few days before account details are emailed to the store.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90ButtonExit:
	reload
return

90ButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90ButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Installation Complete Pending QA`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Pending QA"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed.`n`nThe stores data will be reviewed over the next few days before account details are emailed to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ INSTALL COMPLETE PENDING QA END

;================================ INSTALL COMPLETE PENDING QA

7ButtonInstallationComplete:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90A:-SysMenu +Border
Gui, 90A:Color, 1d1f21, 383D46
Gui, 90A:font, s14 bold cE8EBF5, Segoe UI
Gui, 90A:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90A:Add, Text, x18 y18 w289 h50, INSTALLATION COMPLETE
Gui, 90A:font,
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Text, x18 y83 h30, Contact Email
Gui, 90A:font, 
Gui, 90A:font, s6 cE8EBF5, Segoe UI
Gui, 90A:Add, Text, x98 y85 h30, (optional)
Gui, 90A:font, 
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Edit, -E0x200 x142 y80 w130 vBox4, 
Gui, 90A:Add, Text, x18 y113 h30, Contact Name
Gui, 90A:Add, Edit, -E0x200 x142 y110 w130 vBox1, 
Gui, 90A:Add, Text, x18 y143 h30, Store Name
Gui, 90A:Add, Edit, -E0x200 x142 y140 w130 vBox2,
Gui, 90A:Add, Text, x38 y195 , Additional Information
Gui, 90A:Add, Edit, -E0x200 x38 y220 w212 -VScroll h50 vBox3,
Gui, 90A:font, cE8EBF5, Segoe UI
Gui, 90A:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90A:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90A:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90A:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90A:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90A:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90A:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90A:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tInstallation Complete - %Box2% - Details Sent`n`n`nHi %Box1%`n`nThe installation for %Box2% has been completed and account details have been sent to the store.`n`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90A:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90AButtonExit:
	reload
return

90AButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90AButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Installation Complete Pending QA`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Details Sent"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed and account details have been sent to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ INSTALL COMPLETE PENDING QA END

;================================ KNOCK BACK DATA OUT CONNECTION REQ

7ButtonKnockBack(DataOutage):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90B:-SysMenu +Border
Gui, 90B:Color, 1d1f21, 383D46
Gui, 90B:font, s14 bold cE8EBF5, Segoe UI
Gui, 90B:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90B:Add, Text, x18 y18 w289 h50, KNOCK BACK (DATA OUTAGE)
Gui, 90B:font,
Gui, 90B:font, cE8EBF5, Segoe UI
Gui, 90B:Add, Text, x18 y63 h30, Contact Email
Gui, 90B:font, 
Gui, 90B:font, s6 cE8EBF5, Segoe UI
Gui, 90B:Add, Text, x98 y65 h30, (optional)
Gui, 90B:font, 
Gui, 90B:font, cE8EBF5, Segoe UI
Gui, 90B:Add, Edit, -E0x200 x142 y60 w130 vBox4, 
Gui, 90B:Add, Text, x18 y93 h30, Contact Name
Gui, 90B:Add, Edit, -E0x200 x142 y90 w130 vBox1, 
Gui, 90B:Add, Text, x18 y123 h30, Store Name
Gui, 90B:Add, Edit, -E0x200 x142 y120 w130 vBox2,
Gui, 90B:Add, Text, x18 y145 h30, Dates Connection`nAttempted
Gui, 90B:Add, Edit, -E0x200 x142 y150 w130 vBox5,
Gui, 90B:Add, Text, x38 y195 , Additional Information
Gui, 90B:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90B:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90B:Add, Text, x320 y76 w330 h260 vPreviewDOR, 
Gui, 90B:Add, Text, x335 y358 w340 h250 , Please ensure your signature is attached before sending...
Gui, 90B:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90B:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90B:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90B:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90B:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tConnection Attempted - %Box2%`n`nHi %Box1%`n`nThe data is currently behind for %Box2%. We have contacted the store on %Box5% and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90B:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90BButtonExit:
	reload
return

90BButtonBack:
	Gui, 79:Destroy
	gosub Q7
return

90BButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Knock Back Data Out`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Connection Attempted - " Box2
	email.Body := "Hi " Box1 "`n`nThe data is currently behind for " Box2 ". We have contacted the store on " Box5 " and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n " Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ KNOCK BACK DATA OUT CONNECTION REQ END

;================================ KNOCK BACK INSTALLATIONCONNECTION REQ

7ButtonKnockBack(Installation):
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90C:-SysMenu +Border
Gui, 90C:Color, 1d1f21, 383D46
Gui, 90C:font, s14 bold cE8EBF5, Segoe UI
Gui, 90C:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 90C:Add, Text, x18 y18 w289 h50, KNOCK BACK (INSTALLATION)
Gui, 90C:font,
Gui, 90C:font, cE8EBF5, Segoe UI
Gui, 90C:Add, Text, x18 y63 h30, Contact Email
Gui, 90C:font, 
Gui, 90C:font, s6 cE8EBF5, Segoe UI
Gui, 90C:Add, Text, x98 y65 h30, (optional)
Gui, 90C:font, 
Gui, 90C:font, cE8EBF5, Segoe UI
Gui, 90C:Add, Edit, -E0x200 x142 y60 w130 vBox4, 
Gui, 90C:Add, Text, x18 y93 h30, Contact Name
Gui, 90C:Add, Edit, -E0x200 x142 y90 w130 vBox1, 
Gui, 90C:Add, Text, x18 y123 h30, Store Name
Gui, 90C:Add, Edit, -E0x200 x142 y120 w130 vBox2,
Gui, 90C:Add, Text, x18 y145 h30, Dates Connection`nAttempted
Gui, 90C:Add, Edit, -E0x200 x142 y150 w130 vBox5,
Gui, 90C:Add, Text, x38 y195 , Additional Information
Gui, 90C:Add, Edit, -E0x200 x38 y220 w212 h50 -VScroll vBox3,
Gui, 90C:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 90C:Add, Text, x320 y76 w330 h260 vPreviewDOR, 
Gui, 90C:Add, Text, x335 y358 w340 h250 , Please ensure your signature is attached before sending...
Gui, 90C:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90C:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90C:Add, Button, x153 y328 w100 h30 , &Exit
Gui, 90C:Show, %Gui_Cord% w686 h395, %A_Space%

loop
{
    Gui, 90C:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`t%Box4%`nSubject: `tConnection Attempted - %Box2%`n`nHi %Box1%`n`nWe have not been able to complete the installation request for %Box2%. We have contacted the store on %Box5% and have not been permitted to connect and install the software.`nTo help expedite the resolution of the data outage at this store, please arrange for the pharmacy to contact Intellipharm at their earliest convenience.`n`nIf you have any questions, please contact our support line on 1300 255 160.`n%Box3%`n`nKind Regards`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 90C:Text, PreviewDOR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

90CButtonExit:
	reload
return

90CButtonBack:
	Gui, 90C:Destroy
	gosub Q7
return

90CButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Email Template for Knock Back Installation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := Box4
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "Installation Complete - " Box2 " - Details Sent"
	email.Body := "Hi " Box1 "`n`nThe installation for " Box2 " has been completed and account details have been sent to the store.`n`n" Box3 "`n`nKind Regards`n"
	email.Display

	reload
return

;================================ KNOCK BACK INSTALLATION CONNECTION REQ END

;================================ POSBROWSER BATCH READER END

BatchReader:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 90D:-SysMenu +Border
Gui, 90D:Color, 1d1f21, 383D46
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
Gui, 90D:Add, Text, x320 y76 w320 h250 vPreviewDOR, 
Gui, 90D:Add, Text, x335 y358 w320 h250 , Please ensure your signature is attached before sending...
Gui, 90D:Add, Button, x38 y288 w215 h30 , &Confirm
Gui, 90D:Add, Button, x38 y328 w100 h30 , &Back
Gui, 90D:Add, Button, x153 y328 w100 h30 , &Exit
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

90DButtonExit:
	reload
return

90DButtonBack:
	Gui, 90D:Destroy
	gosub Q7
return

90DButtonConfirm:
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
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 76:font, s12 bold, Segoe UI
Gui, 76:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 76:Add, Text, x23 y24 , Minfos Webservice Unavailable
Gui, 76:font,
Gui, 76:font, s8, Segoe UI
Gui, 76:Add, Text, x18 y78 h30, Store Name
Gui, 76:Add, Edit, x18 y98 w250 vBox1,
Gui, 76:Add, Text, x18 y138 h30, Webservice address
Gui, 76:Add, Edit, x18 y158 w250 vBox2,
Gui, 76:Add, Button, x16 y210 w80 h30 , Confirm
Gui, 76:Add, Button, x104 y210 w80 h30 , Back
Gui, 76:Add, Button, x192 y210 w80 h30 , Exit
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

;=====================================================ACNIELSEN

7Button4ACNIELSENEmail:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 53:Margin, 16, 16
Gui, 53:Color, 1d1f21, 383D46 ;, 282a2e
Gui, 53:-SysMenu +Border
Gui, 53:Font, s11, Segoe UI

Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Site Code
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox1 , 
Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Site Name
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox2 , 
Gui, 53:Add, Text, xm cc5c8c6 -E0x200 , Store Contact
Gui, 53:Add, Edit, y+5 w250 cc5c8c6 -E0x200 vBox3 , 

Gui, 53:Add, CheckBox, cc5c8c6 x290 y38 h20 vCb_1 , Reinstalled%A_Space%
Gui, 53:Add, CheckBox, cc5c8c6 x290 y80 h20 vCb_2 , Installed%A_Space%

Gui, 53:Add, Button, x290 y137 w120 h30 , &Confirm
Gui, 53:Add, Button, x+10 w120 h30 , &Back
Gui, 53:Add, Button, x290 y+10 w250 h30 , E&xit

Gui, 53:Show, %Gui_Cord% , ACNIELSEN Email Template
return
 
53ButtonBack:
Gui, 53:Destroy
gosub Q7
return 
 
53ButtonConfirm:
Gui, Submit,

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
 
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - ACNIELSEN Install/Reinstall`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "aaron.beecham@intellipharm.com.au"
	email.Cc := "brodie.creaser@intellipharm.com.au"
	email.Subject := "ACNIELSEN - " Box1 " " Box2
	email.Body := "NIELSEN STORE UPDATE`n`nStore ID:`t`t" Box1 "`nStore Name:`t    " Box2 "`nAction taken:`t     " Cb_1_Text Cb_2_Text "`nCompleted by:`t   " Name "`n`n`n "
	email.Display
	reload
return

53ButtonExit:
Reload
return

;=====================================================ACNIELSEN END

;=====================================================GREENCROSS MISSING ZIPS

7Button8GREENCROSSZIPs:
Gui, Destroy 
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 45:Add, Text, x12 y9 w50 h20 , Site Code
Gui, 45:Add, Text, x12 y39 w60 h20 , Site Name
Gui, 45:Add, Text, x12 y69 w70 h20 , Client ID
Gui, 45:Add, Text, x12 y99 w70 h20 , Store Contact
Gui, 45:Add, Edit, x92 y9 w80 h20 vBox1,
Gui, 45:Add, Edit, x92 y39 w80 h20 vBox2,
Gui, 45:Add, Edit, x92 y69 w80 h20 vBox3,
Gui, 45:Add, Edit, x92 y99 w80 h20 vBox4,
Gui, 45:Add, CheckBox, x192 y9 w190 h20 vCb_1 , Attempted Intellipharm Extract EXE
Gui, 45:Add, Text, x192 y39 w190 h20 , General Description:
Gui, 45:Add, Edit, x192 y59 w190 h60 vBox5,
Gui, 45:Add, Button, x12 y132 w120 h30 , &Accept
Gui, 45:Add, Button, x138 y132 w120 h30 , &Back
Gui, 45:Add, Button, x263 y132 w120 h30 , E&xit
Gui, 45:Show, %Gui_Cord% w395 h170, Missing ZIPs
return

45ButtonBack:
Gui, 45:Destroy
gosub Q7
return
 
45ButtonAccept:
Gui, Submit,

Gui, 71: -sysmenu
Gui, 71:Font, S12 Bold CDefault, Verdana
Gui, 71:Add, Text, x10 y18 w260 h70 ,Please wait...
Gui, 71:Font,
global WM_USER               := 0x00000400
global PBM_SETMARQUEE        := WM_USER + 10
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
;Flat marquee
;Gui, Add, Progress, x178 y89 w300 h20 hwndMARQ1 +%PBS_MARQUEE%, 50
;DllCall("User32.dll\SendMessage", "Ptr", MARQ1, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
Gui, 71:Add, Progress, x10 y50 w180 h20 hwndMARQ4 -%PBS_SMOOTH% +%PBS_MARQUEE%, 50
DllCall("User32.dll\SendMessage", "Ptr", MARQ4, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
Gui, 71:Show, w200 h80, 

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - GREENCROSS MIssing ZIPs`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\miszip.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, Missing Loyalty ZIPs - %Box1% %Box2% 
	sleep 500
	SendInput, {Tab}%Box1%{Tab}%Box2%{Down}%Box3%{Down}%Box4%{Down}%Box5%{Down}{Enter}Regards{Enter}%Name%{Enter}
Cb_1_Text=
	reload
return

45ButtonExit:
Reload
return

;=====================================================GREENCROSS MISSING ZIPS END

;=====================================================LOYALTY REINSTALLATION

LoyRe:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = %A_Space%|1|2|3|4|5|6|7|8
Gui, 46:-SysMenu +Border
Gui, 46:Color, 1d1f21, 383D46
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
Gui, 46:Add, Button, x12 y425 w120 h30 , Send
Gui, 46:Add, Button, x152 y425 w120 h30 , Back
Gui, 46:Add, Button, x292 y425 w120 h30 , Exit

Gui, 46:Add, Groupbox, x440 y30 w385 h410, Preview
Gui, 46:Add, Text, x455 y55 w360 h370 vPreviewLoyIn, 

Gui, 46:Show,  %Gui_Cord% w850 h470, %A_Space%

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
	email.Subject := "Loyalty Reinstallation Requied - " SiteCode " " SiteName
	email.Body := "Site Code:`t`t" Box1 "`nSite Name:`t`t" Box2 "`nStore Contact:`t`t" Box3 "`n`nPOS System:`t`t" Box4 "`n" POSChange "`t`t" Box5 "`t" Box6 "`nBackup:`t`t" Kept NotKept "`n`nIssue began around:`t" Box7 "`n`nReinstall locations:`t" MCT Choice1 MC T Choice2 "`n`nAdditional Information:`n" Cryp "`n" Comp "`n" AddT "`n`nAdditional Notes:`t" Box8
	email.Send
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

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 44:-SysMenu +Border
Gui, 44:Color, 1d1f21, 383D46
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
Gui, 44:Add, Text, x28 y400 w350 h220 vPreviewLoyEsc, 

Gui, 44:Add, Button, x212 y290 w170 h30 , Forward Escalation
Gui, 44:Add, Button, x212 y330 w80 h30 , Back
Gui, 44:Add, Button, x302 y330 w80 h30 , Exit

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
	
    msgText = To: `t`tsupport@loyaltyone.com.au`nSubject: `tLoyalty Call Escalation %SiteCode% %SiteName%`n`n`nStore Contact:`t%Contact%`nIssue With:`t%Cb_1_Text%%Cb_2_Text%%Cb_3_Text%%Cb_4_Text%`nError Message:`t%Error%`n`nCard Number:`t%CardNo%`nCustomer Name:`t%CustName%`nDocket Number:`t%DockNo%`nDetails:`t`t%Desc%`n`nSteps Taken to Resolve:`t%Steps%

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
	reload
return

44ButtonExit:
Reload
return

;=====================================================LOYALTY CALL ESCALATION END

;=====================================================HSNET ACCOUNT

7ButtonHSNETAccountExistingInstallation:
    Gosub, HAEI
	WinWaitClose, ahk_class AutoHotkeyGUI
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - HSNET Account EXISTING`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\kye.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, Existing Installation - %Box1% - Please confirm Hsnet Account Exists{TAB}Hi Kye,`n`nCan you please confirm that the Hsnet account is set up for %Box1% %Box2%`n`nIf the account does not exist, could you please set it up and Email me back when complete.`n`n%Box4%`n`nKind Regards`n%Name%`n
	reload
return

HAEI:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 40:font, s8, Segoe UI
Gui, 40:font, s8, Segoe UI
Gui, 40:Add, Text, x12 y9 w120 h20 , Site Code:
Gui, 40:Add, Edit, x12 y29 w150 h20 vBox1, 
Gui, 40:Add, Text, x12 y69 w120 h20 , Store Name:
Gui, 40:Add, Edit, x12 y89 w150 h20 vBox2, 
Gui, 40:Add, Text, x182 y9 w190 h20 , Additional notes you'd like to add:
Gui, 40:Add, Edit, x182 y29 w190 h110 vBox4, 
Gui, 40:Add, Text, x195 y251 w7 h14 , 
Gui, 40:Add, Button, x182 y149 w90 h30 , &Accept
Gui, 40:Add, Button, x283 y149 w90 h30 , E&xit
Gui, 40:Show, %Gui_Cord% w386 h190, HSNET Existing
return

40ButtonAccept:
	Gui, Submit
return

40ButtonExit:
Reload
return

7ButtonHSNETAccountNEWInstallation:
    Gosub, HANI
	WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - HSNET Account NEW`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	Run G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\kye.msg
	Sleep 5000
	WinActivate OUTLOOK.EXE
	SendInput, NEW Installation - %Box1% - Please set up Hsnet Account{TAB}Hi Kye,`n`nCould you please set up the Hsnet account for %Box1% %Box2%`n`n%Box4%`n`nKind Regards`n%Name%`n
	reload
return

HANI:
Gui, Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 41:font, s8, Segoe UI
Gui, 41:Add, Text, x12 y9 w120 h20 , Site Code:
Gui, 41:Add, Edit, x12 y29 w150 h20 vBox1, 
Gui, 41:Add, Text, x12 y69 w120 h20 , Store Name:
Gui, 41:Add, Edit, x12 y89 w150 h20 vBox2, 
Gui, 41:Add, Text, x182 y9 w190 h20 , Additional notes you'd like to add:
Gui, 41:Add, Edit, x182 y29 w190 h110 vBox4, 
Gui, 41:Add, Text, x195 y251 w7 h14 , 
Gui, 41:Add, Button, x182 y149 w90 h30 , &Accept
Gui, 41:Add, Button, x283 y149 w90 h30 , E&xit
Gui, 41:Show, %Gui_Cord% w386 h190, HSNET New
return

41ButtonAccept:
	Gui, Submit
return

41ButtonExit:
Reload
return

;=====================================================HSNET END


;=====================================================SITE RESET EMAIL

7Button1SiteReset:

IfNotExist, C:\AutoHotKey\Files\drfate.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\drfate.png, C:\AutoHotKey\Files\drfate.png
}

Gui, Destroy
Gui, 10A:Color, 1d1f21, 383D46
Gui, 10A:Add, Picture, x-48 y10 w271 h350 , C:\AutoHotKey\Files\drfate.png
Gui, 10A:Font, s10 Bold cE8EBF5, Segoe UI
Gui, 10A:Add, Text, x202 y29 w230 , Remember, if this store has STOPS, SIMPLE or Lots/Other you will need to updated the settings.dbf.`n`n(Lots + Lots does not require this.)
Gui, 10A:Add, Button, x2900 y1990 w150 h30 , Place
Gui, 10A:Add, Button, x290 y199 w150 h30 , Yes... Okay. I get it...
Gui, 10A:Show, %Gui_Cord% w466 h263, Listen to Fate
return 

10AButtonYes...Okay.Igetit...:
list2 = Yes|No|NA
Gui, 10A:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, 10:-SysMenu +Border
Gui, 10:Color, 1d1f21, 383D46
Gui, 10:font, s12 bold cE8EBF5, Segoe UI
Gui, 10:Add, Text, x28 y14 h30 , SITE RESET`nEMAIL
Gui, 10:font,
Gui, 10:font, cE8EBF5, Segoe UI

;Gui, 10:Add, Text, x12 y9 w160 h20 , Who's the email being sent to?
;Gui, 10:Add, Edit, x172 y9 w80 h20 gNameCheck vBox7, 
Gui, 10:Add, Button, x152 y46 w110 h20 , Autofill

Gui, 10:Add, Text, x28 y76 w140 h20 , Site Code:
Gui, 10:Add, Edit, -E0x200 x152 y74 w110 h20 vBox1, 
Gui, 10:Add, Text, x28 y106 w150 h20 , Site Name:
Gui, 10:Add, Edit, -E0x200 x152 y104 w110 h20 vBox2, 
Gui, 10:Add, Button, x270 y133 w22 h22 , ?
Gui, 10:Add, Text, x28 y136 h20 , Months of History:
Gui, 10:Add, Edit, -E0x200 x152 y134 w110 h20 vBox3, 
Gui, 10:Add, Text, x28 y166 w140 h20 , Clients:
Gui, 10:Add, Edit, -E0x200 x152 y164 w110 h20 vBox4, 
Gui, 10:Add, Text, x28 y196 w140 h20 , Loyalty:
Gui, 10:Add, DropDownList, x152 y194 w110 vChoice1, V2|V3|NA
Gui, 10:Add, Text, x28 y226 w140 h20 , Loyalty actions
Gui, 10:Add, DropDownList, x152 y224 w110 vChoice2, Carried Balance exported|Settings.dbf updated|NA
Gui, 10:Add, Text, x28 y256 w140 h20 , Change of POS/Catman
Gui, 10:Add, DropDownList, x152 y254 w110 vChoice3, Yes|No|NA
Gui, 10:Add, Text, x28 y286 w140 h30 , Date new POS
Gui, 10:Add, Edit, -E0x200 x152 y284 w110 h20 vBox10, 
Gui, 10:Add, Text, x28 y316 w140 h20 , Staff member name:
Gui, 10:Add, Edit, -E0x200 x152 y314 w110 h20 vBox9, 
Gui, 10:Add, Text, x28 y346 w140 h20 , Reason:
Gui, 10:Add, Edit, -E0x200 x152 y344 w110 h20 vBox6,

Gui, 10:Add, Groupbox, x300 y26 w360 h382, Preview
Gui, 10:Add, Text, x320 y56 w320 h332 vPreviewSR, 

Gui, 10:Add, Button, x23 y379 w75 h30 , &Confirm
Gui, 10:Add, Button, x106 y379 w75 h30 , &Back
Gui, 10:Add, Button, x189 y379 w75 h30 , &Exit
Gui, 10:Show, %Gui_Cord% w686 h430, %A_Space%

loop
{
    Gui, 10:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt
	
    msgText = To: `t`tdhobden@intellipharm.com.au`nCC:`t`tbrodie.creaser/rick@intellipharm.com.au`nSubject: `tSITE RESET EMAIL - %Box1% %Box2%`n`n`n%Box1%`n%Box2%`nReason: %Box6%`n`nMonths of History:`t`t%Box3%`nClients:`t`t`t`t%Box4%`n`nLoyalty:`t`t`t`t%Choice1%`nLoyalty Actions:`t`t`t%Choice2%`nChange of POS/Catman:`t`t%Choice3%`nDate of New POS:`t`t%Box10%`n`n%Name%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 10:Text, PreviewSR, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}


return

10Button?:
;InputBox, count, STARTUP TIME,Please set the time you would like HSNET to start.`nFormat is '12:00' in 24 hour time., ,240,160,200,200,,,00:15
InputBox, count, DATE, Format: yyyyMMdd

T1=%count%
;T2=20110228010203

x := ElapsedTime(T1)

Answer := x.Yr * (12) + x.Mon

MsgBox % "Months since " T1 "`n"
;. "`n" x.Yr		" Years"
;. "`n" x.Mon	" Months"
. "`n" Answer	" Months"
;. "`n" x.Day	" Days"
;. "`n" x.Hr		" Hours"
;. "`n" x.Min	" Minutes"
;. "`n" x.Sec	" Seconds"

;x := ElapsedTime(T1, T2)
;MsgBox % "Duration between " T1 "`nand " T2 "`n" 
;. "`n" x.Yr		" Years"
;. "`n" x.Mon	" Months"
;. "`n" x.Day	" Days"
;. "`n" x.Hr		" Hours"
;. "`n" x.Min	" Minutes"
;. "`n" x.Sec	" Seconds"
ElapsedTime(T1, T2:=""){  ; http://www.autohotkey.com/board/topic/119833-elapsed-time-calculator/
	;if (T1>T2)
	;	Tx:=T1,T1:=T2,T2:=Tx,Neg:=1
	FormatTime,T1,%T1%,yyyyMMdd
	FormatTime,T2,%T2%,yyyyMMdd
	Yr:=SubStr(T2,1,4)-(Yr1:=SubStr(T1,1,4)),Mon:=SubStr(T2,5,2)-(Mon1:=SubStr(T1,5,2)),Day:=SubStr(T2,7,2)-SubStr(T1,7,2)
	Hr:=SubStr(T2,9,2)-SubStr(T1,9,2),Min:=SubStr(T2,11,2)-SubStr(T1,11,2),Sec:=SubStr(T2,13,2)-SubStr(T1,13,2),Res:=[]
	if Sec<0
		Sec+=60,Min--
	if Min<0
		Min+=60,Hr--
	if Hr<0
		Hr+=24,Day--
	if Day<0
		Day+=(Mon1~="[469]|11")?30:Mon1=2?(Mod(Yr1,4)?28:29):31,Mon--
	if Mon<0
		Mon+=12,Yr--
	for each,v in StrSplit("Yr,Mon,Day,Hr,Min,Sec",",")
		x:=%v%*(Neg?-1:1),Res[v]:=(T1&&T2)?x:"Error"
	return Res
} 
return

10ButtonAutofill:
v1 := "Store ID"
v2 := "Name"
    if errorlevel
        return
    RegExMatch(clipboard, "m)^" v1 "(.+)$", a)
    RegExMatch(clipboard, "m)^" v2 "(.+)$", b)
    if !(a1 and b1)
        MsgBox ,,Error, Not found. Please copy the Site IQ record in full.
    else
		Gui, 10:Destroy
		Gui, Destroy
		IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position

		Gui, 10:-SysMenu +Border
		Gui, 10:Color, 1d1f21, 383D46
		Gui, 10:font, s12 bold cE8EBF5, Segoe UI
		Gui, 10:Add, Text, x28 y14 h30 , SITE RESET`nEMAIL
		Gui, 10:font,
		Gui, 10:font, cE8EBF5, Segoe UI

		;Gui, 10:Add, Text, x12 y9 w160 h20 , Who's the email being sent to?
		;Gui, 10:Add, Edit, x172 y9 w80 h20 gNameCheck vBox7, 
		Gui, 10:Add, Button, x152 y46 w110 h20 , Autofill

		Gui, 10:Add, Text, x28 y76 w140 h20 , Site Code:
		Gui, 10:Add, Edit, -E0x200 x152 y74 w110 h20 vBox1, % trim(a1)
		Gui, 10:Add, Text, x28 y106 w150 h20 , Site Name:
		Gui, 10:Add, Edit, -E0x200 x152 y104 w110 h20 vBox2, % trim(b1)
		Gui, 10:Add, Button, x270 y133 w22 h22 , ?
		Gui, 10:Add, Text, x28 y136 h20 , Months of History:
		Gui, 10:Add, Edit, -E0x200 x152 y134 w110 h20 vBox3, 
		Gui, 10:Add, Text, x28 y166 w140 h20 , Clients:
		Gui, 10:Add, Edit, -E0x200 x152 y164 w110 h20 vBox4, 
		Gui, 10:Add, Text, x28 y196 w140 h20 , Loyalty:
		Gui, 10:Add, DropDownList, x152 y194 w110 vChoice1, V2|V3|NA
		Gui, 10:Add, Text, x28 y226 w140 h20 , Loyalty Actions:
		Gui, 10:Add, DropDownList, x152 y224 w110 vChoice2, Carried Balance exported|Settings.dbf updated|NA
		Gui, 10:Add, Text, x28 y256 w140 h20 , Change of POS/Catman
		Gui, 10:Add, DropDownList, x152 y254 w110 vChoice3, Yes|No|NA
		Gui, 10:Add, Text, x28 y286 w140 h30 , Date new POS
		Gui, 10:Add, Edit, -E0x200 x152 y284 w110 h20 vBox10, 
		Gui, 10:Add, Text, x28 y316 w140 h20 , Staff member name:
		Gui, 10:Add, Edit, -E0x200 x152 y314 w110 h20 vBox9, 
		Gui, 10:Add, Text, x28 y346 w140 h20 , Reason:
		Gui, 10:Add, Edit, -E0x200 x152 y344 w110 h20 vBox6,

		Gui, 10:Add, Groupbox, x300 y26 w360 h382, Preview
		Gui, 10:Add, Text, x320 y56 w320 h332 vPreviewSR, 

		Gui, 10:Add, Button, x23 y379 w75 h30 , &Confirm
		Gui, 10:Add, Button, x106 y379 w75 h30 , &Back
		Gui, 10:Add, Button, x189 y379 w75 h30 , &Exit
		Gui, 10:Show, %Gui_Cord% w686 h430, %A_Space%

		loop
		{
			Gui, 10:Submit, NoHide
			FormatTime, Date,, yyyy/MM/dd
			FormatTime, Time,, h:mmtt
			
			msgText = To: `t`tdhobden@intellipharm.com.au`nCC:`t`tbrodie.creaser/rick@intellipharm.com.au`nSubject: `tSITE RESET EMAIL - %Box1% %Box2%`n`n`n%Box1%`n%Box2%`nReason: %Box6%`n`nMonths of History:`t`t%Box3%`nClients:`t`t`t`t%Box4%`n`nLoyalty:`t`t`t`t%Choice1%`nLoyalty Actions:`t`t`t%Choice2%`nChange of POS/Catman:`t`t%Choice3%`nDate of New POS:`t`t%Box10%`n`n%Name%

			if NOT (msgText == oldMsgText)
			{
			GuiControl, 10:Text, PreviewSR, %msgText%
			oldMsgText := msgText
			}

			sleep 100
		}


		return

10ButtonBack:
Gui, 10:Destroy
gosub Q7
return

10ButtonExit:
Reload
return

10ButtonConfirm:
	Gui, Submit
GuiControlGet, MyDateTime
	
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Site Reset Email`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

str = 
( %
<html>
<head>
<title>SITE RESET</title>
</head>
<body style="margin: 0 !important; padding: 0 !important;">
<table border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center" style="font-size: 32px; font-family: Segoe UI, Arial, sans-serif; color: #333333; padding-top: 30px;" class="padding-copy">SITE RESET</td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 0 0 0 0; font-size: 16px; line-height: 25px; font-family: Segoe UI, Arial, sans-serif; color: #666666;" class="padding-copy">
)
str2 =
( %
<br>
)
str3 =
( %
</br><br>Reason: &nbsp;
)
str4 =
( %
 </br></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;" class="padding">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td style="padding: 10px 0 0 0; border-top: 3px solid #eaeaea;">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px; font-weight: bold;">Months of History</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">
)
str5 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px; font-weight: bold;">Clients</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">
)
str6 = 
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 10px 0 0 0; border-top: 3px solid #eaeaea; border-bottom: 3px solid #eaeaea;">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Loyalty</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str7 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Loyalty Actions</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str8 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 0 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Change of POS/Catman</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str9 =
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
							<tr>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 100%;" align="left">
                                        <tr>
                                            <td style="padding: 0 0 10px 0; border-top: 1px solid #eaeaea;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 16px;">Date of New POS</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" width="47%" style="width: 47%;" align="right">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" style="font-family: Arial, sans-serif; color: #7ca230; font-size: 16px;">
)
str10 = 
( %
</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left" style="padding: 0 0 0 0; font-size: 14px; line-height: 18px; font-family: Segoe UI, Arial, sans-serif; color: #aaaaaa; font-style: italic;" class="padding-copy">
)
str11 =
( %
</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="500" class="responsive-table">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" style="padding-top: 25px;" class="padding">
                                                <table border="0" cellspacing="0" cellpadding="0" class="mobile-button-container">
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
)

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To := "dhobden@intellipharm.com.au"
email.Cc := "brodie.creaser@intellipharm.com.au; rick@intellipharm.com.au"
email.Subject := "SITE RESET EMAIL " Box1 " " Box2 ;objects like this (the email code) use strange inverted variables. The stuff in commas is plain text, the text without commas are the above variables. To enter a new line it needs to be in commas as it's code. Without commas means it's looking for a variable.
email.HTMLBody := str . Box2 . str2 . Box1 . str3 . Box6 . str4 . Box3 . str5 . Box4 . str6 . Choice1 . str7 . Choice2 . str8 . Choice3 . str9 . Box10 . str10 . Name . str11
email.Display
	
	reload
return

;=====================================================SITE RESET EMAIL END

;=====================================================FRED EXCEL

FredExcel:
Gui, Destroy

Gui, 47:-SysMenu +Border
Gui, 47:Color, 1d1f21, 383D46
Gui, 47:font, s12 bold cE8EBF5, Segoe UI
Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
Gui, 47:font,
Gui, 47:font, cE8EBF5, Segoe UI
Gui, 47:Add, Button, x152 y39 w110 h20 , Autofill
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
Gui, 47:Add, Text, x28 y311 w140 h30 , Secondary Contact:
Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
Gui, 47:Add, Button, x23 y345 w75 h30 , &Confirm
Gui, 47:Add, Button, x106 y345 w75 h30 , &Back
Gui, 47:Add, Button, x189 y345 w75 h30 , &Exit

Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
Gui, 47:Add, Text, x320 y76 w320 h250 vFredExcelPrev, 

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

		Gui, 47:-SysMenu +Border
		Gui, 47:Color, 1d1f21, 383D46
		Gui, 47:font, s12 bold cE8EBF5, Segoe UI
		Gui, 47:Add, Text, x28 y14 h30 , FRED EXCEL`nGENERATOR
		Gui, 47:font,
		Gui, 47:font, cE8EBF5, Segoe UI
		Gui, 47:Add, Button, x152 y39 w110 h20 , Autofill
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
		Gui, 47:Add, Text, x28 y311 w140 h30 , Secondary Contact:
		Gui, 47:Add, Edit, -E0x200 x152 y309 w110 h20 vBox9,
		Gui, 47:Add, Button, x23 y345 w75 h30 , &Confirm
		Gui, 47:Add, Button, x106 y345 w75 h30 , &Back
		Gui, 47:Add, Button, x189 y345 w75 h30 , &Exit

		Gui, 47:font, cE8EBF5

		Gui, 47:Add, Groupbox, x300 y46 w360 h300 , Preview
		Gui, 47:Add, Text, x320 y76 w320 h250 vFredExcelPrev, 

		Gui, 47:Show, %Gui_Cord% w686 h395, %A_Space%

		loop
		{
			Gui, 47:Submit, NoHide
			FormatTime, Date,, yyyy/MM/dd
			FormatTime, Time,, h:mmtt
			
			IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
			IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

			msgText = To: `t`tdataaccessrequest@fred.com.au`nCC:`t`tsupport@intellipharm.com.au`nSubject:`t`tData Access Request for - %Box1% from Intelllipharm`n`n`nHi, `nDocument attached with store details for FRED Credential Request.`nStore name: %Box1%`nSite Code: %Box7%`n`nKind Regards,`n%Name% %Surname%`nIntellipharm`n1300 255 160

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
gui, submit

;WinWaitClose, ahk_class AutoHotkeyGUI

IfNotExist, C:\AutoHotKey\Files\FRED.xlsx
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\FRED.xlsx, C:\AutoHotKey\Files\FRED.xlsx, 1
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
;email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intelllipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return

FredConNO:
attach	:= "C:\AutoHotKey\FRED Access " Box1 ".xlsx"

email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
;email.To := "dataaccessrequest@fred.com.au"
email.Cc := "support@intellipharm.com.au"
email.Subject := "Data Access Request for - " Box1 " from Intelllipharm"
email.Body := "Hi, `nDocument attached with store details for FRED Credential Request.`n" "Store name: " Box1 "`n" "Site Code: "Box7 "`n`n" "Kind Regards" "`n" Name " " Surname "`nIntellipharm`n1300 255 160"
email.Attachments.add(attach)
email.Display
reload
return