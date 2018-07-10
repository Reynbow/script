SupDO:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\Autohotkey\Files\issues.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\issues.png, C:\Autohotkey\Files\issues.png
}

IfNotExist, C:\Autohotkey\Files\fix.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\fix.png, C:\Autohotkey\Files\fix.png
}

Loop,
 {
  FileReadLine, Tags%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

 Loop,
 {
  FileReadLine, TagDesc%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }


Gui, Destroy
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list2GF = |Top Right|Bottom Right|Top Left|Bottom Left|Random
list3GF = |Yes|No|NA
Gui, 15:-SysMenu -caption -Border %OnTopSetting%
Gui, 15:Add, Text, x0 y0 w652 h25 Center GuiMove,
Gui, 15:font, s16 bold cE8EBF5, Segoe UI
Gui, 15:Color, %BGColour%, 2b2e43
Gui, 15:Add, Picture, x0 y310 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, 15:Add, Text, x20 y12 , GENERAL FIX
Gui, 15:Add, Text, x306 y12 , ISSUES
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Text, x40 y87 w120h50 , What was the fix for
Gui, 15:Add, Checkbox, x172 y70 vPFIX , #POSXFIX%A_Space%
Gui, 15:Add, Checkbox, x172 y90 vDFIX, #DISPXFIX%A_Space%
Gui, 15:Add, Checkbox, x172 y110 vHFIX, #HSNETFIX%A_Space%
Gui, 15:font, s10 bold cE8EBF5, Segoe UI
Gui, 15:Add, Text, x18 y150 h20 w254 vPreviewCODE, 
Gui, 15:font,
Gui, 15:font, cE8EBF5, Segoe UI
Gui, 15:Add, Text, yp+30 h15 , SITE CODE
Gui, 15:Add, Text, yp+30 h15 , Spoke to
Gui, 15:Add, Text, yp+30 h20, Reason for the outage
Gui, 15:Add, Text, yp+30 h20, Changes made to the site
Gui, 15:Add, Text, yp+30 h20, Resolution
Gui, 15:Add, Text, yp+30 h20, Antivirus in use
Gui, 15:Add, Text, yp+30 h20, Exceptions added
Gui, 15:Add, Text, yp+30 h20, Help Icon location
Gui, 15:Add, Edit, xp+175 y178 w80 h20 -E0x200 vSCODE , 
Gui, 15:Add, Edit, yp+30 w80 h20 -E0x200 vSpoke , 
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vOutage , 
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vChange , 	
Gui, 15:Add, Edit, yp+30 w80 -E0x200 vRes , 
Gui, 15:Add, Edit, yp+30 w80 readonly -E0x200 vBox5GF , Set on Site IQ
Gui, 15:Add, DropDownList, yp+30 w80 vAV , %list3GF%
Gui, 15:Add, DropDownList, yp+30 w80 vHelp , %list2GF%
Gui, 15:font, s8 bold cE8EBF5, Segoe UI
Gui, 15:Add, Checkbox, checked x300 y45 vDO, #DATAOUT
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Checkbox, yp+20 vCb_1 , %Tags1%
Gui, 15:Add, Checkbox, yp+20 vCb_2 , %Tags2%
Gui, 15:Add, Checkbox, yp+20 vCb_3 , %Tags3%
Gui, 15:Add, Checkbox, yp+20 vCb_4 , %Tags4%
Gui, 15:Add, Checkbox, yp+20 vCb_5 , %Tags5%
Gui, 15:Add, Checkbox, yp+20 vCb_6 , %Tags6%
Gui, 15:Add, Checkbox, yp+20 vCb_7 , %Tags7%
Gui, 15:Add, Checkbox, yp+20 vCb_8 , %Tags8%
Gui, 15:Add, Checkbox, yp+20 vCb_9 , %Tags9%
Gui, 15:Add, Checkbox, yp+20 vCb_10 , %Tags10%
Gui, 15:Add, Checkbox, yp+20 vCb_11 , %Tags11%
Gui, 15:Add, Checkbox, yp+20 vCb_12 , %Tags12%
Gui, 15:Add, Checkbox, yp+20 vCb_13 , %Tags13%
Gui, 15:Add, Checkbox, yp+20 vCb_14 , %Tags14%
Gui, 15:Add, Checkbox, yp+20 vCb_15 , %Tags15%
Gui, 15:Add, Checkbox, yp+20 vCb_16 , %Tags16%
Gui, 15:Add, Checkbox, yp+20 vCb_17 , %Tags17%
Gui, 15:Add, Checkbox, yp+20 vCb_18 , %Tags18%
Gui, 15:Add, Checkbox, yp+20 vCb_19 , %Tags19%
Gui, 15:Add, Checkbox, yp+20 vCb_20 , %Tags20%
Gui, 15:Add, Checkbox, yp+20 vCb_21 , %Tags21%
Gui, 15:Add, Checkbox, yp+20 vCb_22 , %Tags22%
Gui, 15:Add, Checkbox, yp+20 vCb_23 , %Tags23%
Gui, 15:Add, Checkbox, yp+20 vCb_24 , %Tags24%
;Gui, 15:Add, Checkbox, yp+20 vCb_25 , %Tags25%
;Gui, 15:Add, Checkbox, yp+20 vCb_26 , %Tags26%
;Gui, 15:Add, Checkbox, yp+20 vCb_27 , %Tags27%
;Gui, 15:Add, Checkbox, yp+20 vCb_28 , %Tags28%
;Gui, 15:Add, Checkbox, yp+20 vCb_29 , %Tags29%
;Gui, 15:Add, Checkbox, yp+20 vCb_30 , %Tags30%
Gui, 15:font, s8 bold cE8EBF5, Segoe UI
Gui, 15:Add, Text, x400 y45, Use this tag for all Data Issues
Gui, 15:font,
Gui, 15:font, s8 cE8EBF5, Segoe UI
Gui, 15:Add, Text, yp+20 w250, %TagDesc1%
Gui, 15:Add, Text, yp+20 w250, %TagDesc2%
Gui, 15:Add, Text, yp+20 w250, %TagDesc3%
Gui, 15:Add, Text, yp+20 w250, %TagDesc4%
Gui, 15:Add, Text, yp+20 w250, %TagDesc5%
Gui, 15:Add, Text, yp+20 w250, %TagDesc6%
Gui, 15:Add, Text, yp+20 w250, %TagDesc7%
Gui, 15:Add, Text, yp+20 w250, %TagDesc8%
Gui, 15:Add, Text, yp+20 w250, %TagDesc9%
Gui, 15:Add, Text, yp+20 w250, %TagDesc10%
Gui, 15:Add, Text, yp+20 w250, %TagDesc11%
Gui, 15:Add, Text, yp+20 w250, %TagDesc12%
Gui, 15:Add, Text, yp+20 w250, %TagDesc13%
Gui, 15:Add, Text, yp+20 w250, %TagDesc14%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc15%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc16%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc17%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc18%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc19%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc20%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc21%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc22%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc23%
Gui, 15:Add, Text, yp+20 w250 BackGroundTrans, %TagDesc24%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc25%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc26%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc27%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc28%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc29%
;Gui, 15:Add, Text, yp+20 w250, %TagDesc30%

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 15:Add, Button, x400 y18 w80 h20 gEDITdo, EDIT
	}
If Dog = Aaron
	{
	Gui, 15:Add, Button, x400 y18 w80 h20 gEDITdo, EDIT
	}

Gui, 15:Add, Button, x60 y448 w170 h30 hwndSupDO1, Confirm
Gui, 15:Add, Button, x60 y488 w80 h30 hwndSupDO2, Back
Gui, 15:Add, Button, x150 y488 w80 h30 hwndSupDO3, Exit
Gui, 15:Add, GroupBox, x16 y550 w620 h110, Preview
Gui, 15:Add, Text, x18 y570 w50 h88
Gui, 15:Add, Text, x144 y558 w490 h30
Gui, 15:Add, Text, x30 y570 w604 h88 vPreview, 

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(SupDO1, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupDO2, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupDO3, Opt1, Opt2, , , Opt5)

Gui, 15:Show, %Gui_Cord% h675 w650,  
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 15:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 15:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	DO := DO ? " - #DATAOUT " : ""

    PFIX := PFIX ? " #POSXFIX" : ""
	DFIX := DFIX ? " #DISPXFIX" : ""
	HFIX := HFIX ? " #HSNETFIX" : ""

	Spoke := Spoke ? " •• SPOKE TO: " Spoke : ""
	Outage := Outage ? " •• OUTAGE CAUSE: " Outage : ""
	Change := Change ? " •• CHANGES MADE: " Change : ""
	Res := Res ? " •• RESOLUTION: " Res : ""
	Help := Help ? " •• HELP ICON: " Help : ""
	AV := AV ? " •• AV EXCEP ADDED: " AV : ""

	CB1 := Cb_1 ? " " Tags1 : ""
	CB2 := Cb_2 ? " " Tags2 : ""
	CB3 := Cb_3 ? " " Tags3 : ""
	CB4 := Cb_4 ? " " Tags4 : ""
	CB5 := Cb_5 ? " " Tags5 : ""
	CB6 := Cb_6 ? " " Tags6 : ""
	CB7 := Cb_7 ? " " Tags7 : ""
	CB8 := Cb_8 ? " " Tags8 : ""
	CB9 := Cb_9 ? " " Tags9 : ""
	CB10 := Cb_10 ? " " Tags10 : ""
	CB11 := Cb_11 ? " " Tags11 : ""
	CB12 := Cb_12 ? " " Tags12 : ""
	CB13 := Cb_13 ? " " Tags13 : ""
	CB14 := Cb_14 ? " " Tags14 : ""
    CB15 := Cb_15 ? " " Tags15 : ""
	CB16 := Cb_16 ? " " Tags16 : ""
	CB17 := Cb_17 ? " " Tags17 : ""
	CB18 := Cb_18 ? " " Tags18 : ""
	CB19 := Cb_19 ? " " Tags19 : ""
	CB20 := Cb_20 ? " " Tags20 : ""
	CB21 := Cb_21 ? " " Tags21 : ""
	CB22 := Cb_22 ? " " Tags22 : ""
	CB23 := Cb_23 ? " " Tags23 : ""
	CB24 := Cb_24 ? " " Tags24 : ""
	CB25 := Cb_25 ? " " Tags25 : ""
	CB26 := Cb_26 ? " " Tags26 : ""
	CB27 := Cb_27 ? " " Tags27 : ""
	CB28 := Cb_28 ? " " Tags28 : ""
	CB29 := Cb_29 ? " " Tags29 : ""
	CB30 := Cb_30 ? " " Tags30 : ""
	
	msgText = % Time DO PFIX DFIX HFIX CB1 CB2 CB3 CB4 CB5 CB6 CB7 CB8 CB9 CB10 CB11 CB12 CB13 CB14 CB15 CB16 CB17 CB18 CB19 CB20 CB21 CB22 CB23 CB24 CB25 CB26 CB27 CB28 CB29 CB30 " #OUT " Spoke Outage Change Res Help AV

    ;msgText = %Time% - %Cb_22_Text%%Cb_1_Text%%Cb_2_Text%%Cb_3_Text% #OUT - SPOKE TO: %Box1GF% - OUTAGE WAS CAUSED BY: %Box2GF% - CHANGES MADE: %Box3GF% - RESOLUTION: %Box4GF% - HELP ICON: %Choice2GF% - AV EXCEPTIONS ADDED: %Choice1GF% - TAGS: %Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text%%Cb_8_Text%%Cb_9_Text%%Cb_10_Text%%Cb_11_Text%%Cb_12_Text%%Cb_13_Text%%Cb_14_Text%%Cb_15_Text%%Cb_16_Text%%Cb_17_Text%%Cb_18_Text%%Cb_19_Text%%Cb_20_Text%%Cb_21_Text%%Cb_23_Text%%Cb_24_Text%%Cb_25_Text%%Cb_26_Text%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 15:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

15ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

15Buttonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 15:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

15ButtonConfirm:

Clipboard = %msgText%

If clipboard Contains #NEWPC
	{
	;WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
	Gui, 15:hide
	Gui, A:+AlwaysOnTop
	Gui, A:Margin, 16, 16
	Gui, A:Color, 247BA0, 383D46 ;, 282a2e
	Gui, A:-SysMenu -Border
	Gui, A:Font, s11, Segoe UI

	Gui, A:Add, Text, xm cF3FFBD -E0x200 , You selected the #NEWPC tag.
	Gui, A:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

	Gui, A:Add, Button, xm w120 h30 gAcnNEWPC, ACNIELSEN
	Gui, A:Add, Button, x+10 w120 h30 gApiNEWPC, API
	Gui, A:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
	Gui, A:Show, , #NEWPC
	return
	
	AcnNEWPC:
	Gui, A:Destroy
	Gui, B:+AlwaysOnTop
	Gui, B:Margin, 16, 16
	Gui, B:Color, 247BA0, 383D46 ;, 282a2e
	Gui, B:-SysMenu -Border
	Gui, B:Font, s11, Segoe UI

	Gui, B:Add, Text, xm cF3FFBD -E0x200 , Was a backup used for the reinstall?
	
	Gui, B:Add, Button, xm w120 h30 gBackupYES, Yes
	Gui, B:Add, Button, x+10 w120 h30 gBackupNO, No
	Gui, B:Show, , #NEWPC
	return

	ApiNewPC:
		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := "ricky.white@intellipharm.com.au"
		email.Bcc := "brodie.creaser@intellipharm.com.au"
		email.Cc := "renae.hutchinson@intellipharm.com.au"
		email.Subject := "API - " SCODE
		email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #NEWPC`nCompleted by:`t   " Name "`n`n`n "
		email.Send
		gosub Neither
		return

	BackupNO:
		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := "aaron.beecham@intellipharm.com.au"
		email.Cc := "brodie.creaser@intellipharm.com.au"
		email.Subject := "ACNIELSEN - " SCODE
		email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #NEWPC`nCompleted by:`t   " Name "`n`n`n "
		email.Send
		gosub Neither
		return

	} 
	else If clipboard contains #POSCHANGE
		{
			Gui, 15:hide
			Gui, C:+AlwaysOnTop
			Gui, C:Margin, 16, 16
			Gui, C:Color, 247BA0, 383D46 ;, 282a2e
			Gui, C:-SysMenu -Border
			Gui, C:Font, s11, Segoe UI

			Gui, C:Add, Text, xm cF3FFBD -E0x200 , You selected the #POSCHANGE tag.
			Gui, C:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

			Gui, C:Add, Button, xm w120 h30 gAcnPOS, ACNIELSEN
			Gui, C:Add, Button, x+10 w120 h30 gApiPOS, API
			Gui, C:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
			Gui, C:Show, , #POSCHANGE
			return

				AcnPOS:
				email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
				email.To := "aaron.beecham@intellipharm.com.au"
				email.Cc := "brodie.creaser@intellipharm.com.au"
				email.Subject := "ACNIELSEN - " SCODE
				email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #POSCHANGE`nCompleted by:`t   " Name "`n`n`n "
				email.Send
				gosub Neither
				return

				ApiPOS:
				email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
				email.To := "ricky.white@intellipharm.com.au"
				email.Bcc := "brodie.creaser@intellipharm.com.au"
				email.Cc := "renae.hutchinson@intellipharm.com.au"
				email.Subject := "API - " SCODE
				email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #POSCHANGE`nCompleted by:`t   " Name "`n`n`n "
				email.Send
				gosub Neither
				return

		}
		else If clipboard contains #DISPCHANGE
			{
				Gui, 15:hide
				Gui, D:+AlwaysOnTop
				Gui, D:Margin, 16, 16
				Gui, D:Color, 247BA0, 383D46 ;, 282a2e
				Gui, D:-SysMenu -Border
				Gui, D:Font, s11, Segoe UI

				Gui, D:Add, Text, xm cF3FFBD -E0x200 , You selected the #DISPCHANGE tag.
				Gui, D:Add, Text, xm cF3FFBD -E0x200 , Please select if this was a reinstall`nfor ACNIELSEN or API

				Gui, D:Add, Button, xm w120 h30 gAcnDIS, ACNIELSEN
				Gui, D:Add, Button, x+10 w120 h30 gApiDIS, API
				Gui, D:Add, Button, x15 y+10 w250 h30 gNeither, NEITHER
				Gui, D:Show, , #DISPCHANGE
				return

					AcnDIS:
					email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
					email.To := "aaron.beecham@intellipharm.com.au"
					email.Cc := "brodie.creaser@intellipharm.com.au"
					email.Subject := "ACNIELSEN - " SCODE
					email.Body := "ACNIELSEN STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #DISPCHANGE`nCompleted by:`t   " Name "`n`n`n "
					email.Send
					gosub Neither
					return

					ApiDIS:
					email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
					email.To := "ricky.white@intellipharm.com.au"
					email.Bcc := "brodie.creaser@intellipharm.com.au" 
					email.Cc := "renae.hutchinson@intellipharm.com.au"
					email.Subject := "API - " SCODE
					email.Body := "API STORE UPDATE`n`nStore ID:`t`t" SCODE "`nAction taken:`t     #DISPCHANGE`nCompleted by:`t   " Name "`n`n`n "
					email.Send
					gosub Neither
					return
			}


BackupYES:
Neither:
Gui, A:Destroy
Gui, B:Destroy
Gui, C:Destroy
Gui, D:Destroy

;WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
;IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, 15:Submit, NoHide
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	;Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Data Out Fix`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%Name%\
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Data Out.txt

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
Points++  ; This adds 1 to your variable TimesOpened.
Points++
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

reload
Return

EDITdo:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\Autohotkey\Files\issues.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\issues.png, C:\Autohotkey\Files\issues.png
}

IfNotExist, C:\Autohotkey\Files\fix.png
{
FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\fix.png, C:\Autohotkey\Files\fix.png
}

Loop,
 {
  FileReadLine, Tags%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

 Loop,
 {
  FileReadLine, TagDesc%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }


Gui, Destroy

Gui, 15EDIT:-SysMenu +Border
Gui, 15EDIT:font, s16 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Color, 1d1f21, 383D46
Gui, 15EDIT:Add, Text, x20 y12 , ISSUES
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Add, Checkbox, checked x20 y45 vDO, #DATAOUT
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_1 vTags1, %Tags1%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_2 vTags2, %Tags2%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_3 vTags3, %Tags3%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_4 vTags4, %Tags4%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_5 vTags5, %Tags5%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_6 vTags6, %Tags6%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_7 vTags7, %Tags7%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_8 vTags8, %Tags8%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_9 vTags9, %Tags9%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_10 vTags10, %Tags10%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_11 vTags11, %Tags11%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_12 vTags12, %Tags12%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_13 vTags13, %Tags13%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_14 vTags14, %Tags14%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_15 vTags15, %Tags15%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_16 vTags16, %Tags16%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_17 vTags17, %Tags17%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_18 vTags18, %Tags18%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_19 vTags19, %Tags19%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_20 vTags20, %Tags20%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_21 vTags21, %Tags21%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_22 vTags22, %Tags22%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_23 vTags23, %Tags23%
Gui, 15EDIT:Add, edit, yp+20 w98 -E0x200 vCb_24 vTags24, %Tags24%

Gui, 15EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 15EDIT:Add, Text, x120 y45, Use this tag for all Data Issues
Gui, 15EDIT:font,
Gui, 15EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc1, %TagDesc1%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc2, %TagDesc2%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc3, %TagDesc3%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc4, %TagDesc4%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc5, %TagDesc5%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc6, %TagDesc6%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc7, %TagDesc7%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc8, %TagDesc8%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc9, %TagDesc9%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc10, %TagDesc10%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc11, %TagDesc11%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc12, %TagDesc12%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc13, %TagDesc13%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc14, %TagDesc14%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc15, %TagDesc15%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc16, %TagDesc16%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc17, %TagDesc17%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc18, %TagDesc18%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc19, %TagDesc19%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc20, %TagDesc20%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc21, %TagDesc21%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc22, %TagDesc22%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc23, %TagDesc23%
Gui, 15EDIT:Add, edit, yp+20 -E0x200 w250 vTagDesc24, %TagDesc24%

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 15EDIT:Add, Button, x120 y18 w80 h20 gSAVEdo, SAVE
	}
If Dog = Aaron
	{
	Gui, 15EDIT:Add, Button, x120 y18 w80 h20 gSAVEdo, SAVE
	}

Gui, 15EDIT:Add, Button, x290 y18 w80 h20 gEXIT, EXIT

Gui, 15EDIT:Add, Button, x20 y560 w80 h20 gOPENhashDO, OPEN
Gui, 15EDIT:Add, Button, x120 y560 w80 h20 gOPENdescDO, OPEN

Gui, 15EDIT:Add, Text, x220 y564 h20, Open text files directly.

Gui, 15EDIT:Show, %Gui_Cord% h595, Data Out Tags
return

OPENhashDO:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt
return


OPENdescDO:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt
return

SAVEdo:
Gui, 15EDIT:Submit
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt

FileAppend, %Tags1%`n%Tags2%`n%Tags3%`n%Tags4%`n%Tags5%`n%Tags6%`n%Tags7%`n%Tags8%`n%Tags9%`n%Tags10%`n%Tags11%`n%Tags12%`n%Tags13%`n%Tags14%`n%Tags15%`n%Tags16%`n%Tags17%`n%Tags18%`n%Tags19%`n%Tags20%`n%Tags21%`n%Tags22%`n%Tags23%`n%Tags24% ,G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out tags.txt
FileAppend, %TagDesc1%`n%TagDesc2%`n%TagDesc3%`n%TagDesc4%`n%TagDesc5%`n%TagDesc6%`n%TagDesc7%`n%TagDesc8%`n%TagDesc9%`n%TagDesc10%`n%TagDesc11%`n%TagDesc12%`n%TagDesc13%`n%TagDesc14%`n%TagDesc15%`n%TagDesc16%`n%TagDesc17%`n%TagDesc18%`n%TagDesc19%`n%TagDesc20%`n%TagDesc21%`n%TagDesc22%`n%TagDesc23%`n%TagDesc24%,G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\data out descriptions.txt

Msgbox, 0, UPDATE TAGS, Update Complete
reload
return