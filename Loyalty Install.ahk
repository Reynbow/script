#SingleInstance, Force
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1

IfNotExist, C:\AutoHotKey\Files\Loyalty Template.xlsx
{
sleep 50
FileCreateDir, C:\AutoHotKey\Files\
sleep 50
FileCopy, G:\Loyalty\Install Template\Loyalty Template.xlsx, C:\AutoHotKey\Files\
sleep 50
}

;Gui, +AlwaysOnTop

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

Gui,-SysMenu +ToolWindow +Border
Gui, font, s16 bold cc5c8c6, Segoe UI
Gui, Color, 1d1f21, 383D46
Gui, Add, Text, x10 y6 h20 , LOYALTY INSTALL
Gui, font, s8 bold cc5c8c6, Segoe UI
Gui, Add, Text, x10 y50 h20 w225 vPreviewCODE,
Gui, font, 
Gui, font, s8 cc5c8c6, Segoe UI
Gui, Add, Text, yp+25 h20 , Store Prefix:
Gui, Add, Text, yp+25 h20 , SITE CODE:
Gui, Add, Text, yp+25 h20 , Store Name:
Gui, Add, Text, yp+25 w60 h20 , Spoke to:
Gui, Add, Text, xp+185 yp+0 h20 , *

Gui, Add, DropDownList, xp-80 yp-78 w100 vPrefix, ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vSCODE,
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vStoreName,
Gui, Add, Edit, yp+25 w100 h20 -E0x200 vSpoke,

Gui, Add, Text, xp-105 yp+40 h20 , Back Office PC details:
Gui, Add, Text, yp+25 h20 , PC Name:
Gui, Add, Edit, xp+60 yp-3 w100 h20 -E0x200 vPCName,
Gui, Add, Checkbox, xp-60 yp+28 h20 vCb_DispDept, Disp Depts in Settings.dbf
Gui, Add, Edit, xp+160 yp+0 w50 h20 -E0x200 vDispDept,
Gui, Add, Checkbox, xp-160 yp+25 w180 h20 vDDUI, Disp Depts set in UI
Gui, Add, Checkbox, yp+25 w180 h20 vCb_Folder, Intpharm folder shared

Gui, Add, Text, x235 y15 w40 h20 , POS:
Gui, Add, Text, x235 yp+25 w90 h20 , Total Tills:
Gui, Add, Text, x395 y40 w90 h20 , *
Gui, Add, Text, x410 y15 w80 h20 , Loyalty Mode:

Gui, Add, Edit, x290 y12 w100 h20 -E0x200 vPOS,
Gui, Add, Edit, x290 yp+25 w100 h20 -E0x200 vTills,
Gui, Add, DropDownList, x490 y12 w100 vLoyMode, Auto|Partial|Manual


Gui, Add, Groupbox, x-10 y325 w655 h290 ,
Gui, font, s12 bold cc5c8c6, Segoe UI
Gui, Add, Text, x10 y350 h20 , COMMENT TEMPLATE
Gui, font,
Gui, font, cc5c8c6, Segoe UI

Gui, Add, Checkbox, x10 yp+40 w190 h20 vCb_APIROLL , #LOYINSTALL
Gui, Add, Checkbox, x10 yp+25 w180 h20 vCb_INDROLL, #LOYRESTALL
Gui, Add, Checkbox, x10 yp+25 h20 vRBStock , Redemption Barcode/s added in stock
Gui, Add, Text, x12 yp+40 w180 h20, Test Card Number:
Gui, Add, Edit, xp+100 yp-2 h20 w160 -E0x200 vTestCard,
Gui, Add, Checkbox, x10 yp+29 w180 vCb_TillsTested, All tills tested and working
Gui, Add, Checkbox, x10 yp+25 h20 vCb_Training , Training complete - Trained:
Gui, Add, Edit, xp+170 yp-2 w90 h20 -E0x200 vTrainedName,
Gui, Add, Checkbox, x10 yp+29 h20 vCb_Document, Installation document attached to LOYV3 Client



Gui, Add, Checkbox, x290 y360 h20 vCb_Addition, Still to be completed:
Gui, Add, Edit, x290 yp+25 w300 h112 -E0x200 vNotes ,


Gui, Add, Picture, x310 y498 w95 h95 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png
Gui, Add, Text, x435 y507 h20 ,*
Gui, font, s8 bold cc5c8c6, Segoe UI
Gui, Add, Button, x443 y507 w72 h40 , &Comment Only
Gui, font,
Gui, font, cc5c8c6, Segoe UI
Gui, Add, Button, x517 y507 w72 h40 , &Confirm
Gui, Add, Button, x443 y550 w146 h30 , &Exit


Gui, Add, Tab2, x230 y69 w365 h250 , Till 1|Till 2|Till 3|Till 4|Till 5|Till 6|Till 7|Till 8
Gui, Add, Text, xp+25 yp+50 h20 , First Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT1A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT1_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT1B,
Gui, Add, CheckBox, xp+110 h20 vT1_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 w160 h20 vT1_Stops, LOCKSET ;Stops: Hook updated (V3 Transition)
Gui, Add, CheckBox, yp+25 h20 vT1_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT1_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT1_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT1_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN1, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT1_Zed, Zed: $0 Receipts ON
Gui, Add, Text, yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit, yp+15 w140 h18 -E0x200 vT1mtn, 


Gui, Tab, Till 2
Gui, Add, Text, xp-165 yp-167 h20 , Second Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT2A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT2_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT2B,
Gui, Add, CheckBox, xp+110 h20 vT2_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT2_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT2_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT2_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT2_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT2_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN2, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT2_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT2mtn, 

Gui, Tab, Till 3
Gui, Add, Text, xp-165 yp-167 h20 , Third Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT3A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT3_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT3B,
Gui, Add, CheckBox, xp+110 h20 vT3_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT3_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT3_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT3_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT3_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT3_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN3, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT3_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT3mtn, 

Gui, Tab, Till 4
Gui, Add, Text, xp-165 yp-167 h20 , Fourth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT4A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT4_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT4B,
Gui, Add, CheckBox, xp+110 h20 vT4_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT4_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT4_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT4_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT4_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT4_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN4, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT4_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT4mtn, 

Gui, Tab, Till 5
Gui, Add, Text, xp-165 yp-167 h20 , Fifth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT5A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT5_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT5B,
Gui, Add, CheckBox, xp+110 h20 vT5_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT5_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT5_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT5_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT5_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT5_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN5, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT5_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT5mtn, 

Gui, Tab, Till 6
Gui, Add, Text, xp-165 yp-167 h20 , Sixth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT6A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT6_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT6B,
Gui, Add, CheckBox, xp+110 h20 vT6_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT6_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT6_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT6_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT6_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT6_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN6, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT6_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT6mtn, 

Gui, Tab, Till 7
Gui, Add, Text, xp-165 yp-167 h20 , Seventh Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT7A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT7_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT7B,
Gui, Add, CheckBox, xp+110 h20 vT7_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT7_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT7_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT7_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT7_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT7_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN7, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT7_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT7mtn, 

Gui, Tab, Till 8
Gui, Add, Text, xp-165 yp-167 h20 , Eighth Till Name:
Gui, Add, Edit, xp+100 w100 h20 -E0x200 vBoxT8A,
Gui, Add, CheckBox, xp-100 yp+25 h20 vT8_Startup, Balance Checker in startup
Gui, Add, Text, yp+25 w30 h20 , AV:
Gui, Add, Edit, xp+25 yp-2 w100 h20 -E0x200 vBoxT8B,
Gui, Add, CheckBox, xp+110 h20 vT8_Excep, Exceptions added
Gui, Add, CheckBox, xp-135 yp+44 h20 vT8_Stops, LOCKSET
Gui, Add, CheckBox, yp+25 h20 vT8_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, yp+25 h20 vT8_Points, Live points working
Gui, Add, CheckBox, yp+25 h20 vT8_prompt, Promptpos = bcpos
Gui, Add, CheckBox, xp+165 yp-75 h20 vT8_LOTSMAN, LOTSMAN_
Gui, Add, Edit, xp+90 w20 h16 -E0x200 vLOTSMAN8, 
Gui, Add, CheckBox, xp-90 yp+25 w160 h20 vT8_Zed, Zed: $0 Receipts ON
Gui, Add, Text,  yp+35 h20, MTNTOP PPREWARD:
Gui, Add, Edit,  yp+15 w140 h18 -E0x200 vT8mtn, 

Gui, Show, x200 y200 w605 h595,%A_Space%

loop
{
    Gui, Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }
	sleep 100
}

return

ButtonConfirm:
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name

	email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
	email.To := "ricky.white@intellipharm.com.au"
	email.Subject := "LOYALTY INSTALL COMPLETE - " SCODE
	email.Body := "LOYALTY INSTALL INFORMATION`n`nStore ID:`t`t" SCODE "`nCompleted by:`t   " Name "`n`n`n "
	email.Send

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

if (!Tills){
msgbox, 16, Warning, Please enter Total Tills, 
return
}

Gui, Submit,

If(Cb_DispDept=1)
GuiControlGet, CBDispDept,, Cb_DispDept, Text
If(Cb_Plpset=1)
GuiControlGet, CBPlpset,, Cb_Plpset, Text
If(Cb_Folder=1)
GuiControlGet, CBFolder,, Cb_Folder, Text
If(Cb_Website=1)
GuiControlGet, CBWebsite,, Cb_Website, Text
If(Cb_Icon=1)
GuiControlGet, CBIcon,, Cb_Icon, Text
If(Cb_FAQ=1)
GuiControlGet, CBFAQ,, Cb_FAQ, Text
If(Cb_DisV2=1)
GuiControlGet, CBDisV2,, Cb_DisV2, Text
If(T1_Startup=1)
GuiControlGet, T1Startup,, T1_Startup, Text
If(T1_Excep=1)
GuiControlGet, T1Excep,, T1_Excep, Text
If(T1_URL=1)
GuiControlGet, T1URL,, T1_URL, Text
If(T1_Icon=1)
GuiControlGet, T1Icon,, T1_Icon, Text
If(T1_FAQ=1)
GuiControlGet, T1FAQ,, T1_FAQ, Text
If(T1_Receipt=1)
GuiControlGet, T1Receipt,, T1_Receipt, Text
If(T1_Points=1)
GuiControlGet, T1Points,, T1_Points, Text
If(T1_prompt=1)
GuiControlGet, T1prompt,, T1_prompt, Text
If(T1_Stops=1)
GuiControlGet, T1Stops,, T1_Stops, Text
If(T1_Zed=1)
GuiControlGet, T1Zed,, T1_Zed, Text
If(T1_mtn=1)
GuiControlGet, T1mtn,, T1_mtn, Text
If(T2_Startup=1)
GuiControlGet, T2Startup,, T2_Startup, Text
If(T2_Excep=1)
GuiControlGet, T2Excep,, T2_Excep, Text
If(T2_URL=1)
GuiControlGet, T2URL,, T2_URL, Text
If(T2_Icon=1)
GuiControlGet, T2Icon,, T2_Icon, Text
If(T2_FAQ=1)
GuiControlGet, T2FAQ,, T2_FAQ, Text
If(T2_Receipt=1)
GuiControlGet, T2Receipt,, T2_Receipt, Text
If(T2_Points=1)
GuiControlGet, T2Points,, T2_Points, Text
If(T2_prompt=1)
GuiControlGet, T2prompt,, T2_prompt, Text
If(T2_Stops=1)
GuiControlGet, T2Stops,, T2_Stops, Text
If(T2_Zed=1)
GuiControlGet, T2Zed,, T2_Zed, Text
If(T2_mtn=1)
GuiControlGet, T2mtn,, T2_mtn, Text
If(T3_Startup=1)
GuiControlGet, T3Startup,, T3_Startup, Text
If(T3_Excep=1)
GuiControlGet, T3Excep,, T3_Excep, Text
If(T3_URL=1)
GuiControlGet, T3URL,, T3_URL, Text
If(T3_Icon=1)
GuiControlGet, T3Icon,, T3_Icon, Text
If(T3_FAQ=1)
GuiControlGet, T3FAQ,, T3_FAQ, Text
If(T3_Receipt=1)
GuiControlGet, T3Receipt,, T3_Receipt, Text
If(T3_Points=1)
GuiControlGet, T3Points,, T3_Points, Text
If(T3_prompt=1)
GuiControlGet, T3prompt,, T3_prompt, Text
If(T3_Stops=1)
GuiControlGet, T3Stops,, T3_Stops, Text
If(T3_Zed=1)
GuiControlGet, T3Zed,, T3_Zed, Text
If(T3_mtn=1)
GuiControlGet, T3mtn,, T3_mtn, Text
If(T4_Startup=1)
GuiControlGet, T4Startup,, T4_Startup, Text
If(T4_Excep=1)
GuiControlGet, T4Excep,, T4_Excep, Text
If(T4_URL=1)
GuiControlGet, T4URL,, T4_URL, Text
If(T4_Icon=1)
GuiControlGet, T4Icon,, T4_Icon, Text
If(T4_FAQ=1)
GuiControlGet, T4FAQ,, T4_FAQ, Text
If(T4_Receipt=1)
GuiControlGet, T4Receipt,, T4_Receipt, Text
If(T4_Points=1)
GuiControlGet, T4Points,, T4_Points, Text
If(T4_prompt=1)
GuiControlGet, T4prompt,, T4_prompt, Text
If(T4_Stops=1)
GuiControlGet, T4Stops,, T4_Stops, Text
If(T4_Zed=1)
GuiControlGet, T4Zed,, T4_Zed, Text
If(T4_mtn)
GuiControlGet, T4mtn,, T4_mtn, Text
If(T5_Startup=1)
GuiControlGet, T5Startup,, T5_Startup, Text
If(T5_Excep=1)
GuiControlGet, T5Excep,, T5_Excep, Text
If(T5_URL=1)
GuiControlGet, T5URL,, T5_URL, Text
If(T5_Icon=1)
GuiControlGet, T5Icon,, T5_Icon, Text
If(T5_FAQ=1)
GuiControlGet, T5FAQ,, T5_FAQ, Text
If(T5_Receipt=1)
GuiControlGet, T5Receipt,, T5_Receipt, Text
If(T5_Points=1)
GuiControlGet, T5Points,, T5_Points, Text
If(T5_prompt=1)
GuiControlGet, T5prompt,, T5_prompt, Text
If(T5_Stops=1)
GuiControlGet, T5Stops,, T5_Stops, Text
If(T5_Zed=1)
GuiControlGet, T5Zed,, T5_Zed, Text
If(T5_mtn)
GuiControlGet, T5mtn,, T5_mtn, Text
If(T6_Startup=1)
GuiControlGet, T6Startup,, T6_Startup, Text
If(T6_Excep=1)
GuiControlGet, T6Excep,, T6_Excep, Text
If(T6_URL=1)
GuiControlGet, T6URL,, T6_URL, Text
If(T6_Icon=1)
GuiControlGet, T6Icon,, T6_Icon, Text
If(T6_FAQ=1)
GuiControlGet, T6FAQ,, T6_FAQ, Text
If(T6_Receipt=1)
GuiControlGet, T6Receipt,, T6_Receipt, Text
If(T6_Points=1)
GuiControlGet, T6Points,, T6_Points, Text
If(T6_prompt=1)
GuiControlGet, T6prompt,, T6_prompt, Text
If(T6_Stops=1)
GuiControlGet, T6Stops,, T6_Stops, Text
If(T6_Zed=1)
GuiControlGet, T6Zed,, T6_Zed, Text
If(T6_mtn)
GuiControlGet, T6mtn,, T6_mtn, Text
If(T7_Startup=1)
GuiControlGet, T7Startup,, T7_Startup, Text
If(T7_Excep=1)
GuiControlGet, T7Excep,, T7_Excep, Text
If(T7_URL=1)
GuiControlGet, T7URL,, T7_URL, Text
If(T7_Icon=1)
GuiControlGet, T7Icon,, T7_Icon, Text
If(T7_FAQ=1)
GuiControlGet, T7FAQ,, T7_FAQ, Text
If(T7_Receipt=1)
GuiControlGet, T7Receipt,, T7_Receipt, Text
If(T7_Points=1)
GuiControlGet, T7Points,, T7_Points, Text
If(T7_prompt=1)
GuiControlGet, T7prompt,, T7_prompt, Text
If(T7_Stops=1)
GuiControlGet, T7Stops,, T7_Stops, Text
If(T7_Zed=1)
GuiControlGet, T7Zed,, T7_Zed, Text
If(T7_mtn)
GuiControlGet, T7mtn,, T7_mtn, Text
If(T8_Startup=1)
GuiControlGet, T8Startup,, T8_Startup, Text
If(T8_Excep=1)
GuiControlGet, T8Excep,, T8_Excep, Text
If(T8_URL=1)
GuiControlGet, T8URL,, T8_URL, Text
If(T8_Icon=1)
GuiControlGet, T8Icon,, T8_Icon, Text
If(T8_FAQ=1)
GuiControlGet, T8FAQ,, T8_FAQ, Text
If(T8_Receipt=1)
GuiControlGet, T8Receipt,, T8_Receipt, Text
If(T8_Points=1)
GuiControlGet, T8Points,, T8_Points, Text
If(T8_prompt=1)
GuiControlGet, T8prompt,, T8_prompt, Text
If(T8_Stops=1)
GuiControlGet, T8Stops,, T8_Stops, Text
If(T8_Zed=1)
GuiControlGet, T8Zed,, T8_Zed, Text
If(T8_mtn)
GuiControlGet, T8mtn,, T8_mtn, Text
If(Cb_APIROLL=1)
GuiControlGet, CbAPIROLL,, Cb_APIROLL, Text
If(Cb_INDROLL=1)
GuiControlGet, CbINDROLL,, Cb_INDROLL, Text
If(Cb_LOYV3=1)
GuiControlGet, CbLOYV3,, Cb_LOYV3, Text
If(Cb_TillsTested=1)
GuiControlGet, CbTillsTested,, Cb_TillsTested, Text
If(Cb_Transition=1)
GuiControlGet, CbTransition,, Cb_Transition, Text
If(Cb_Training=1)
GuiControlGet, CbTraining,, Cb_Training, Text
If(Cb_Document=1)
GuiControlGet, CbDocument,, Cb_Document, Text
If(Cb_Addition=1)
GuiControlGet, CbAddition,, Cb_Addition, Text

FileCopy, C:\AutoHotKey\Files\Loyalty Template.xlsx, C:\AutoHotKey\Files\Loyalty Template BACKUP.xlsx, 1

IniWrite %Prefix%, C:\AutoHotKey\settings.ini, Loyalty, Prefix
IniWrite, %SCODE%, C:\AutoHotKey\settings.ini, Loyalty, Sitecode
IniWrite, %StoreName%, C:\AutoHotKey\settings.ini, Loyalty, StoreName


FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname

FileReadLine, VersionNum, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1

IniRead Prefix, C:\AutoHotKey\settings.ini, Loyalty, Prefix
IniRead, Sitecode, C:\AutoHotKey\settings.ini, Loyalty, Sitecode
IniRead, StoreName, C:\AutoHotKey\settings.ini, Loyalty, StoreName

FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %vName% %Surname% - Loyalty Install `n, G:\Support\Public Staff Folders\Aaron\scriptlog.txt

WorkBookPath        := "C:\AutoHotKey\Files\Loyalty Template.xlsx"	; store the path to the workbook
objExcel			:= ComObjCreate("Excel.Application")        	; create a handle to a new excel application
objWorkBook		    := objExcel.Workbooks.Open(WorkBookPath)    	; opens the existing excel table
objExcel.Visible	:= FALSE            							; make excel visible

objExcel.Sheets("Till 1").Select

objExcel.Range("B2").Value := Sitecode
objExcel.Range("B3").Value := StoreName
objExcel.Range("B4").Value := Spoke
objExcel.Range("B6").Value := PCName
objExcel.Range("B7").Value := CbDispDept
objExcel.Range("B8").Value := DispDept

objExcel.Range("A9").RowHeight := 0	;install doesn't use these sections in the template

objExcel.Range("B10").Value := CbFolder

objExcel.Range("A10").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A11").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A12").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A13").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A14").RowHeight := 0	;install doesn't use these sections in the template

objExcel.Range("B16").Value := Tills
objExcel.Range("B17").Value := POS
objExcel.Range("B18").Value := LoyMode
objExcel.Range("B20").Value := BoxT1A
objExcel.Range("B21").Value := T1Startup
objExcel.Range("B22").Value := BoxT1B
objExcel.Range("B23").Value := T1Excep

objExcel.Range("A24").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A25").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A26").RowHeight := 0	;install doesn't use these sections in the template

objExcel.Range("B27").Value := T1Receipt
objExcel.Range("B28").Value := T1Points
objExcel.Range("B29").Value := T1prompt
objExcel.Range("B30").Value := T1Stops
objExcel.Range("B31").Value := T1Zed
objExcel.Range("B32").Value := LOTSMAN1
objExcel.Range("B33").Value := T1mtn

objExcel.Sheets("Till 2").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template

objExcel.Range("B2").Value := BoxT2A
objExcel.Range("B3").Value := T2Startup
objExcel.Range("B4").Value := BoxT2B
objExcel.Range("B5").Value := T2Excep
objExcel.Range("B9").Value := T2Receipt
objExcel.Range("B10").Value := T2Points
objExcel.Range("B11").Value := T2prompt
objExcel.Range("B12").Value := T2Stops
objExcel.Range("B13").Value := T2Zed
objExcel.Range("B14").Value := LOTSMAN2
objExcel.Range("B15").Value := T2mtn

objExcel.Sheets("Till 3").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template

objExcel.Range("B2").Value := BoxT3A
objExcel.Range("B3").Value := T3Startup
objExcel.Range("B4").Value := BoxT3B
objExcel.Range("B5").Value := T3Excep
objExcel.Range("B9").Value := T3Receipt
objExcel.Range("B10").Value := T3Points
objExcel.Range("B11").Value := T3prompt
objExcel.Range("B12").Value := T3Stops
objExcel.Range("B13").Value := T3Zed
objExcel.Range("B14").Value := LOTSMAN3
objExcel.Range("B15").Value := T3mtn

objExcel.Sheets("Till 4").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("B2").Value := BoxT4A
objExcel.Range("B3").Value := T4Startup
objExcel.Range("B4").Value := BoxT4B
objExcel.Range("B5").Value := T4Excep
objExcel.Range("B9").Value := T4Receipt
objExcel.Range("B10").Value := T4Points
objExcel.Range("B11").Value := T4prompt
objExcel.Range("B12").Value := T4Stops
objExcel.Range("B13").Value := T4Zed
objExcel.Range("B14").Value := LOTSMAN4
objExcel.Range("B15").Value := T4mtn

objExcel.Sheets("Till 5").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("B2").Value := BoxT5A
objExcel.Range("B3").Value := T5Startup
objExcel.Range("B4").Value := BoxT5B
objExcel.Range("B5").Value := T5Excep
objExcel.Range("B9").Value := T5Receipt
objExcel.Range("B10").Value := T5Points
objExcel.Range("B11").Value := T5prompt
objExcel.Range("B12").Value := T5Stops
objExcel.Range("B13").Value := T5Zed
objExcel.Range("B14").Value := LOTSMAN5
objExcel.Range("B15").Value := T5mtn

objExcel.Sheets("Till 6").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("B2").Value := BoxT6A
objExcel.Range("B3").Value := T6Startup
objExcel.Range("B4").Value := BoxT6B
objExcel.Range("B5").Value := T6Excep
objExcel.Range("B9").Value := T6Receipt
objExcel.Range("B10").Value := T6Points
objExcel.Range("B11").Value := T6prompt
objExcel.Range("B12").Value := T6Stops
objExcel.Range("B13").Value := T6Zed
objExcel.Range("B14").Value := LOTSMAN6
objExcel.Range("B15").Value := T6mtn

objExcel.Sheets("Till 7").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("B2").Value := BoxT7A
objExcel.Range("B3").Value := T7Startup
objExcel.Range("B4").Value := BoxT7B
objExcel.Range("B5").Value := T7Excep
objExcel.Range("B9").Value := T7Receipt
objExcel.Range("B10").Value := T7Points
objExcel.Range("B11").Value := T7prompt
objExcel.Range("B12").Value := T7Stops
objExcel.Range("B13").Value := T7Zed
objExcel.Range("B14").Value := LOTSMAN7
objExcel.Range("B15").Value := T7mtn

objExcel.Sheets("Till 8").Select
objExcel.Range("A6").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A7").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("A8").RowHeight := 0	;install doesn't use these sections in the template
objExcel.Range("B2").Value := BoxT8A
objExcel.Range("B3").Value := T8Startup
objExcel.Range("B4").Value := BoxT8B
objExcel.Range("B5").Value := T8Excep
objExcel.Range("B9").Value := T8Receipt
objExcel.Range("B10").Value := T8Points
objExcel.Range("B11").Value := T8prompt
objExcel.Range("B12").Value := T8Stops
objExcel.Range("B13").Value := T8Zed
objExcel.Range("B14").Value := LOTSMAN8
objExcel.Range("B15").Value := T8mtn

objExcel.Sheets("Till 1").Select

objWorkBook.Save
objExcel.Quit()
objExcel 	:= ""

IniRead Prefix, C:\AutoHotKey\settings.ini, Loyalty, Prefix
IniRead, Sitecode, C:\AutoHotKey\settings.ini, Loyalty, Sitecode
IniRead, StoreName, C:\AutoHotKey\settings.ini, Loyalty, StoreName

msgText=%Time% - %CbAPIROLL% %CbLOYV3% %CbINDROLL% - Spoke to: %Spoke% - Total Tills: %Tills% - Test Card: %TestCard% - %CbTillsTested% - %CbTransition% %CbTraining% %TrainedName% - %CbDocument% - %DDUI% - %RBStock% - %CbAddition% %notes%

Clipboard = %msgText%

FileCreateDir, G:\Loyalty\All Stores\%Prefix%\%SCODE% - %StoreName%\Install Sheet\
sleep 500
FormatTime, Date,, yyyyMMdd
FileCopy, C:\AutoHotKey\Files\Loyalty Template.xlsx, G:\Loyalty\All Stores\%Prefix%\%SCODE% - %StoreName%\Install Sheet\%SCODE% - %Date%.xlsx
FileCopy, C:\AutoHotKey\Files\Loyalty Template BACKUP.xlsx, C:\AutoHotKey\Files\Loyalty Template.xlsx, 1

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%vName%\
IfEqual, Tills, 1
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 2
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 3
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 4
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 5
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 6
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 7
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 8
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

IfEqual, Tills, 1
	{
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 2
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 3
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 4
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 5
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 6
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 7
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 8
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}	

IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

If(Cb_APIROLL=1)
	{
	Gui, 73:+AlwaysOnTop
	Gui, 73:Add, Picture, x-88 y-51 w400 h800 , C:\AutoHotKey\Files\flash.png
	Gui, 73:Font, S10 Bold, Segoe UI
	Gui, 73:Add, Text, x202 y29 w230 h30 , Remember install dates for Site IQ!
	Gui, 73:Add, Button, x290 y199 w150 h30 , Close
	Gui, 73:Show, w466 h263,  
	}

gosub ConfirmationWindow

return

ButtonCommentOnly:

Gui, Submit, Nohide

if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

if (!Tills){
msgbox, 16, Warning, Please enter Total Tills, 
return
}

If(Cb_DispDept=1)
GuiControlGet, CBDispDept,, Cb_DispDept, Text
If(Cb_Plpset=1)
GuiControlGet, CBPlpset,, Cb_Plpset, Text
If(Cb_Folder=1)
GuiControlGet, CBFolder,, Cb_Folder, Text
If(Cb_Website=1)
GuiControlGet, CBWebsite,, Cb_Website, Text
If(Cb_Icon=1)
GuiControlGet, CBIcon,, Cb_Icon, Text
If(Cb_FAQ=1)
GuiControlGet, CBFAQ,, Cb_FAQ, Text
If(Cb_DisV2=1)
GuiControlGet, CBDisV2,, Cb_DisV2, Text
If(T1_Startup=1)
GuiControlGet, T1Startup,, T1_Startup, Text
If(T1_Excep=1)
GuiControlGet, T1Excep,, T1_Excep, Text
If(T1_URL=1)
GuiControlGet, T1URL,, T1_URL, Text
If(T1_Icon=1)
GuiControlGet, T1Icon,, T1_Icon, Text
If(T1_FAQ=1)
GuiControlGet, T1FAQ,, T1_FAQ, Text
If(T1_Receipt=1)
GuiControlGet, T1Receipt,, T1_Receipt, Text
If(T1_Points=1)
GuiControlGet, T1Points,, T1_Points, Text
If(T1_prompt=1)
GuiControlGet, T1prompt,, T1_prompt, Text
If(T1_Stops=1)
GuiControlGet, T1Stops,, T1_Stops, Text
If(T1_Zed=1)
GuiControlGet, T1Zed,, T1_Zed, Text
If(T1_mtn=1)
GuiControlGet, T1mtn,, T1_mtn, Text
If(T2_Startup=1)
GuiControlGet, T2Startup,, T2_Startup, Text
If(T2_Excep=1)
GuiControlGet, T2Excep,, T2_Excep, Text
If(T2_URL=1)
GuiControlGet, T2URL,, T2_URL, Text
If(T2_Icon=1)
GuiControlGet, T2Icon,, T2_Icon, Text
If(T2_FAQ=1)
GuiControlGet, T2FAQ,, T2_FAQ, Text
If(T2_Receipt=1)
GuiControlGet, T2Receipt,, T2_Receipt, Text
If(T2_Points=1)
GuiControlGet, T2Points,, T2_Points, Text
If(T2_prompt=1)
GuiControlGet, T2prompt,, T2_prompt, Text
If(T2_Stops=1)
GuiControlGet, T2Stops,, T2_Stops, Text
If(T2_Zed=1)
GuiControlGet, T2Zed,, T2_Zed, Text
If(T2_mtn=1)
GuiControlGet, T2mtn,, T2_mtn, Text
If(T3_Startup=1)
GuiControlGet, T3Startup,, T3_Startup, Text
If(T3_Excep=1)
GuiControlGet, T3Excep,, T3_Excep, Text
If(T3_URL=1)
GuiControlGet, T3URL,, T3_URL, Text
If(T3_Icon=1)
GuiControlGet, T3Icon,, T3_Icon, Text
If(T3_FAQ=1)
GuiControlGet, T3FAQ,, T3_FAQ, Text
If(T3_Receipt=1)
GuiControlGet, T3Receipt,, T3_Receipt, Text
If(T3_Points=1)
GuiControlGet, T3Points,, T3_Points, Text
If(T3_prompt=1)
GuiControlGet, T3prompt,, T3_prompt, Text
If(T3_Stops=1)
GuiControlGet, T3Stops,, T3_Stops, Text
If(T3_Zed=1)
GuiControlGet, T3Zed,, T3_Zed, Text
If(T3_mtn=1)
GuiControlGet, T3mtn,, T3_mtn, Text
If(T4_Startup=1)
GuiControlGet, T4Startup,, T4_Startup, Text
If(T4_Excep=1)
GuiControlGet, T4Excep,, T4_Excep, Text
If(T4_URL=1)
GuiControlGet, T4URL,, T4_URL, Text
If(T4_Icon=1)
GuiControlGet, T4Icon,, T4_Icon, Text
If(T4_FAQ=1)
GuiControlGet, T4FAQ,, T4_FAQ, Text
If(T4_Receipt=1)
GuiControlGet, T4Receipt,, T4_Receipt, Text
If(T4_Points=1)
GuiControlGet, T4Points,, T4_Points, Text
If(T4_prompt=1)
GuiControlGet, T4prompt,, T4_prompt, Text
If(T4_Stops=1)
GuiControlGet, T4Stops,, T4_Stops, Text
If(T4_Zed=1)
GuiControlGet, T4Zed,, T4_Zed, Text
If(T4_mtn)
GuiControlGet, T4mtn,, T4_mtn, Text
If(T5_Startup=1)
GuiControlGet, T5Startup,, T5_Startup, Text
If(T5_Excep=1)
GuiControlGet, T5Excep,, T5_Excep, Text
If(T5_URL=1)
GuiControlGet, T5URL,, T5_URL, Text
If(T5_Icon=1)
GuiControlGet, T5Icon,, T5_Icon, Text
If(T5_FAQ=1)
GuiControlGet, T5FAQ,, T5_FAQ, Text
If(T5_Receipt=1)
GuiControlGet, T5Receipt,, T5_Receipt, Text
If(T5_Points=1)
GuiControlGet, T5Points,, T5_Points, Text
If(T5_prompt=1)
GuiControlGet, T5prompt,, T5_prompt, Text
If(T5_Stops=1)
GuiControlGet, T5Stops,, T5_Stops, Text
If(T5_Zed=1)
GuiControlGet, T5Zed,, T5_Zed, Text
If(T5_mtn)
GuiControlGet, T5mtn,, T5_mtn, Text
If(T6_Startup=1)
GuiControlGet, T6Startup,, T6_Startup, Text
If(T6_Excep=1)
GuiControlGet, T6Excep,, T6_Excep, Text
If(T6_URL=1)
GuiControlGet, T6URL,, T6_URL, Text
If(T6_Icon=1)
GuiControlGet, T6Icon,, T6_Icon, Text
If(T6_FAQ=1)
GuiControlGet, T6FAQ,, T6_FAQ, Text
If(T6_Receipt=1)
GuiControlGet, T6Receipt,, T6_Receipt, Text
If(T6_Points=1)
GuiControlGet, T6Points,, T6_Points, Text
If(T6_prompt=1)
GuiControlGet, T6prompt,, T6_prompt, Text
If(T6_Stops=1)
GuiControlGet, T6Stops,, T6_Stops, Text
If(T6_Zed=1)
GuiControlGet, T6Zed,, T6_Zed, Text
If(T6_mtn)
GuiControlGet, T6mtn,, T6_mtn, Text
If(T7_Startup=1)
GuiControlGet, T7Startup,, T7_Startup, Text
If(T7_Excep=1)
GuiControlGet, T7Excep,, T7_Excep, Text
If(T7_URL=1)
GuiControlGet, T7URL,, T7_URL, Text
If(T7_Icon=1)
GuiControlGet, T7Icon,, T7_Icon, Text
If(T7_FAQ=1)
GuiControlGet, T7FAQ,, T7_FAQ, Text
If(T7_Receipt=1)
GuiControlGet, T7Receipt,, T7_Receipt, Text
If(T7_Points=1)
GuiControlGet, T7Points,, T7_Points, Text
If(T7_prompt=1)
GuiControlGet, T7prompt,, T7_prompt, Text
If(T7_Stops=1)
GuiControlGet, T7Stops,, T7_Stops, Text
If(T7_Zed=1)
GuiControlGet, T7Zed,, T7_Zed, Text
If(T7_mtn)
GuiControlGet, T7mtn,, T7_mtn, Text
If(T8_Startup=1)
GuiControlGet, T8Startup,, T8_Startup, Text
If(T8_Excep=1)
GuiControlGet, T8Excep,, T8_Excep, Text
If(T8_URL=1)
GuiControlGet, T8URL,, T8_URL, Text
If(T8_Icon=1)
GuiControlGet, T8Icon,, T8_Icon, Text
If(T8_FAQ=1)
GuiControlGet, T8FAQ,, T8_FAQ, Text
If(T8_Receipt=1)
GuiControlGet, T8Receipt,, T8_Receipt, Text
If(T8_Points=1)
GuiControlGet, T8Points,, T8_Points, Text
If(T8_prompt=1)
GuiControlGet, T8prompt,, T8_prompt, Text
If(T8_Stops=1)
GuiControlGet, T8Stops,, T8_Stops, Text
If(T8_Zed=1)
GuiControlGet, T8Zed,, T8_Zed, Text
If(T8_mtn)
GuiControlGet, T8mtn,, T8_mtn, Text
If(Cb_APIROLL=1)
GuiControlGet, CbAPIROLL,, Cb_APIROLL, Text
If(Cb_INDROLL=1)
GuiControlGet, CbINDROLL,, Cb_INDROLL, Text
If(Cb_LOYV3=1)
GuiControlGet, CbLOYV3,, Cb_LOYV3, Text
If(Cb_TillsTested=1)
GuiControlGet, CbTillsTested,, Cb_TillsTested, Text
If(Cb_Transition=1)
GuiControlGet, CbTransition,, Cb_Transition, Text
If(Cb_Training=1)
GuiControlGet, CbTraining,, Cb_Training, Text
If(Cb_Document=1)
GuiControlGet, CbDocument,, Cb_Document, Text
If(Cb_Addition=1)
GuiControlGet, CbAddition,, Cb_Addition, Text

IniRead, vName, C:\AutoHotKey\settings.ini, UserName, name

FormatTime, Date,, yyyyMMdd
FormatTime, Time,, h:mmtt
Clipboard = %Time% - %CbAPIROLL% %CbLOYV3% %CbINDROLL% - Spoke to: %Spoke% - Total Tills: %Tills% - Test Card: %TestCard% - %CbTillsTested% - %CbTransition% %CbTraining% %TrainedName% - %CbDocument% - %DDUI% - %RBStock% - %CbAddition% %notes%


;POINTS CALC - ADDING SITE CODES
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%vName%\

IfEqual, Tills, 1
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 2
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 3
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 4
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 5
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 6
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 7
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}

IfEqual, Tills, 8
	{
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date% Loy Install.txt
	}


;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

IfEqual, Tills, 1
	{
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 2
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 3
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 4
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 5
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 6
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 7
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}

IfEqual, Tills, 8
	{
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	
	Points++
	Points++
	Points++
	}	

IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%vName%\%date%.ini, Count Points, Points

MsgBox, 0, Comment Created, Comment has been copied to clipboard, points added to point counter.`n`nClicking "Comment Only" will create a new comment for the clipboard and add the points again. Please only do this if you need to add more points to your point counter.

If(Cb_APIROLL=1)
	{
	Gui, 73:+AlwaysOnTop
	Gui, 73:Add, Picture, x-88 y-51 w400 h800 , C:\AutoHotKey\Files\flash.png
	Gui, 73:Font, S10 Bold, Segoe UI
	Gui, 73:Add, Text, x202 y29 w230 h30 , Remember install dates for Site IQ!
	Gui, 73:Add, Button, x290 y199 w150 h30 , Close
	Gui, 73:Show, w466 h263,  
	}
return

73ButtonClose:
gui, 73:Destroy
return

ButtonExit:
ExitApp

ConfirmationWindow:
Gui, Destroy
;Gui, +AlwaysOnTop
Gui, font, s10, Segoe UI
Gui, Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
Gui, font,
Gui, Add, Button, x78 y70 w80 h28 , Yes
Gui, Add, Button, x168 y70 w80 h28 , No
Gui, Show, w267 h113, Complete!
return

ButtonYes:
Gui, Destroy
run, G:\Loyalty\All Stores\%Prefix%\%SCODE% - %StoreName%\Install Sheet\
ExitApp

ButtonNo:
ExitApp