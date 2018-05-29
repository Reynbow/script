SupADMIN:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\AutoHotKey\Files\all_tag_6.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png, C:\AutoHotKey\Files\all_tag_6.png
}

Loop,
 {
  FileReadLine, AID%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AIT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Gui, Destroy

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74:-SysMenu -caption -Border
Gui, 74:Color, %BGColour%, 2b2e43
Gui, 74:Add, Picture, x460 y245 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 74:Add, Edit, x1920 y2490 w80 vPlacehold,
Gui, 74:Add, Text, x18 y18 , CONTACT INITIATION
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x18 y45 vCb_1, #IN%A_Space%
Gui, 74:Add, Checkbox, x18 y65 vCb_2, #OUT%A_Space%
Gui, 74:Add, Checkbox, x18 y85 vCb_3, #EMAIL%A_Space%
Gui, 74:Add, Text, x118 y45 w150 h50 , Incoming Call	
Gui, 74:Add, Text, x118 y65 w150 h50 , Outgoing Call
Gui, 74:Add, Text, x118 y85 w150 h50 , Email contact
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x306 y18, INSTALL RELATED
Gui, 74:font, s8 bold, Segoe UI
Gui, 74:Add, Checkbox, x306 y45 vCb_4, %AinT1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x306 y65 vCb_5, %AinT2%
Gui, 74:Add, Checkbox, x306 y85 vCb_6, %AinT3%
Gui, 74:Add, Checkbox, x306 y105 vCb_7, %AinT4%
Gui, 74:Add, Checkbox, x306 y125 vCb_8, %AinT5%
Gui, 74:Add, Checkbox, x306 y145 vCb_9, %AinT6%
Gui, 74:font, s8 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y45, %AinD1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y65, %AinD2%
Gui, 74:Add, Text, x406 y85, %AinD3%
Gui, 74:Add, Text, x406 y105, %AinD4%
Gui, 74:Add, Text, x406 y125, %AinD5%
Gui, 74:Add, Text, x406 y145, %AinD6%
Gui, 74:Add, Text, x18 y110 h15, CONTACT NAME:
Gui, 74:font, s10 cE8EBF5 bold, Segoe UI
Gui, 74:Add, Text, x18 y130 h15, S I T E   C O D E :
Gui, 74:Add, Text, yp+30 h20 w254 vPreviewCODE, 
Gui, 74:font, 
Gui, 74:font, s8 cE8EBF5
Gui, 74:Add, Edit, x152 y104 w120 h20 -E0x200 vBox1GF, 
Gui, 74:Add, Edit, x152 y129 w120 h20 -E0x200 vSCODE, 
Gui, 74:Add, Text, x18 y192 h15, Notes section:
Gui, 74:Add, Edit, x17 y207 w254 h70 -E0x200 -VScroll vBox2GF, 
Gui, 74:font, s8 , Segoe UI
Gui, 74:Add, GroupBox, x18 y290 h150 w255 , Preview
Gui, 74:Add, Text, x30 y310 h118 w238 vPreviewALL, 
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x586 y18, ISSUES
Gui, 74:font, s8 bold cE8EBF5, Segoe UI

IniRead, Dog, C:\AutoHotKey\settings.ini, UserName, Name

If Dog = Brodie
	{
	Gui, 74:Add, Button, x686 y18 w80 h20 gADMINedit, EDIT
	}
If Dog = Aaron
	{
	Gui, 74:Add, Button, x686 y18 w80 h20 gADMINedit, EDIT
	}

Gui, 74:Add, Checkbox, x586 y45 vCb_10, %AIT1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Checkbox, x586 y65 vCb_11, %AIT2%
Gui, 74:Add, Checkbox, x586 y85 vCb_12, %AIT3%
Gui, 74:Add, Checkbox, x586 y105 vCb_13, %AIT4%
Gui, 74:Add, Checkbox, x586 y125 vCb_40, %AIT5%
Gui, 74:Add, Checkbox, x586 y145 vCb_14, %AIT6%
Gui, 74:Add, Checkbox, x586 y165 vCb_15, %AIT7%
Gui, 74:Add, Checkbox, x586 y185 vCb_16, %AIT8%
Gui, 74:Add, Checkbox, x586 y205 vCb_17, %AIT9%
Gui, 74:Add, Checkbox, x586 y225 vCb_18, %AIT10%
Gui, 74:Add, Checkbox, x586 y245 vCb_19, %AIT11%
Gui, 74:Add, Checkbox, x586 y265 vCb_20, %AIT12%
Gui, 74:Add, Checkbox, x586 y285 vCb_21, %AIT13%
Gui, 74:Add, Checkbox, x586 y305 vCb_22, %AIT14%
Gui, 74:Add, Checkbox, x586 y325 vCb_41, %AIT15%
Gui, 74:Add, Checkbox, x586 y345 vCb_42, %AIT16%
Gui, 74:Add, Checkbox, x586 y365 vCb_23, %AIT17%
Gui, 74:Add, Checkbox, x586 y385 vCb_24, %AIT18%
Gui, 74:Add, Checkbox, x586 y405 vCb_25, %AIT19%
Gui, 74:Add, Checkbox, x586 y425 vCb_26, %AIT20%
Gui, 74:Add, Checkbox, x586 y445 vCb_27, %AIT21%
Gui, 74:Add, Checkbox, x586 y465 vCb_28, %AIT22%
Gui, 74:Add, Checkbox, x586 y485 vCb_38, %AIT23%
Gui, 74:font, s8 bold cE8EBF5 , Segoe UI
Gui, 74:Add, Text, x686 y45, %AID1%
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, BackGroundTrans x686 y65, %AID2%
Gui, 74:Add, Text, BackGroundTrans x686 y85, %AID3%
Gui, 74:Add, Text, BackGroundTrans x686 y105, %AID4%
Gui, 74:Add, Text, BackGroundTrans x686 y125, %AID5%
Gui, 74:Add, Text, BackGroundTrans x686 y145, %AID6%
Gui, 74:Add, Text, BackGroundTrans x686 y165, %AID7%
Gui, 74:Add, Text, BackGroundTrans x686 y185, %AID8%
Gui, 74:Add, Text, BackGroundTrans x686 y205, %AID9%
Gui, 74:Add, Text, BackGroundTrans x686 y225, %AID10%
Gui, 74:Add, Text, BackGroundTrans x686 y245, %AID11%
Gui, 74:Add, Text, BackGroundTrans x686 y265, %AID12%
Gui, 74:Add, Text, BackGroundTrans x686 y285, %AID13%
Gui, 74:Add, Text, BackGroundTrans x686 y305, %AID14%
Gui, 74:Add, Text, BackGroundTrans x686 y325, %AID15%
Gui, 74:Add, Text, BackGroundTrans x686 y345, %AID16%
Gui, 74:Add, Text, BackGroundTrans x686 y365, %AID17%
Gui, 74:Add, Text, BackGroundTrans x686 y385, %AID18%
Gui, 74:Add, Text, BackGroundTrans x686 y405, %AID19%
Gui, 74:Add, Text, BackGroundTrans x686 y425, %AID20%
Gui, 74:Add, Text, BackGroundTrans x686 y445, %AID21%
Gui, 74:Add, Text, BackGroundTrans x686 y465, %AID22%
Gui, 74:Add, Text, BackGroundTrans x686 y485, %AID23%
Gui, 74:font, s12 bold cE8EBF5, Segoe UI
Gui, 74:Add, Text, x306 y278 , PRODUCTS
Gui, 74:font,
Gui, 74:font, s8 cE8EBF5, Segoe UI
Gui, 74:Add, Text, x406 y280 , (optional)
Gui, 74:Add, Checkbox, x306 y305 vCb_29, %APT1%
Gui, 74:Add, Checkbox, x306 y325 vCb_30, %APT2%
Gui, 74:Add, Checkbox, x306 y345 vCb_31, %APT3%
Gui, 74:Add, Checkbox, x306 y365 vCb_32, %APT4%
Gui, 74:Add, Checkbox, x306 y385 vCb_33, %APT5%
Gui, 74:Add, Checkbox, x306 y405 vCb_34, %APT6%
Gui, 74:Add, Checkbox, x306 y425 vCb_35, %APT7%
Gui, 74:Add, Checkbox, x306 y445 vCb_36, %APT8%
Gui, 74:Add, Checkbox, x306 y465 vCb_37, %APT9%
Gui, 74:Add, Checkbox, x306 y485 vCb_39, %APT10%
Gui, 74:Add, Text, BackGroundTrans x406 y305 -E0x200, %APD1%
Gui, 74:Add, Text, BackGroundTrans x406 y325 -E0x200, %APD2%
Gui, 74:Add, Text, BackGroundTrans x406 y345 -E0x200, %APD3%
Gui, 74:Add, Text, BackGroundTrans x406 y365 -E0x200, %APD4%
Gui, 74:Add, Text, BackGroundTrans x406 y385 -E0x200, %APD5%
Gui, 74:Add, Text, BackGroundTrans x406 y405 -E0x200, %APD6%
Gui, 74:Add, Text, BackGroundTrans x406 y425 -E0x200, %APD7%
Gui, 74:Add, Text, BackGroundTrans x406 y445 -E0x200, %APD8%
Gui, 74:Add, Text, BackGroundTrans x406 y465 -E0x200, %APD9%
Gui, 74:Add, Text, BackGroundTrans x406 y485 -E0x200, %APD10%
Gui, 74:Add, Button, x18 y468 w80 h30 -E0x200 hwndSupAD1, Confirm
Gui, 74:Add, Button, x105 y468 w80 h30 -E0x200 hwndSupAD2, Back
Gui, 74:Add, Button, x192 y468 w80 h30 -E0x200 hwndSupAD3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(SupAD1, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupAD2, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupAD3, Opt1, Opt2, , , Opt5)

Gui, 74:Show, %Gui_Cord% w910 h512,%A_space%
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 74:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 74:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    Cb_1_Text := Cb_1 ? "- #IN " : ""
	Cb_2_Text := Cb_2 ? "- #OUT " : ""
	Cb_3_Text := Cb_3 ? "- #EMAIL " : ""
	Cb_4_Text := Cb_4 ? "#INSTALL" : ""
	Cb_5_Text := Cb_5 ? "#DISPXIN " : ""
	Cb_6_Text := Cb_6 ? "#POSXIN " : ""
	Cb_7_Text := Cb_7 ? "#QA " : ""
    Cb_8_Text := Cb_8 ? "#QACOMP " : ""
	Cb_9_Text := Cb_9 ? "#CANCEL " : ""
	Cb_10_Text := Cb_10 ? "#DATAOUT " : ""
	Cb_11_Text := Cb_11 ? AIT2 : ""
	Cb_12_Text := Cb_12 ? AIT3 : ""
	Cb_13_Text := Cb_13 ? AIT4 : ""
	Cb_14_Text := Cb_14 ? AIT6 : ""
	Cb_15_Text := Cb_15 ? AIT7 : ""
	Cb_16_Text := Cb_16 ? AIT8 : ""
	Cb_17_Text := Cb_17 ? AIT9 : ""
	Cb_18_Text := Cb_18 ? AIT10 : ""
	Cb_19_Text := Cb_19 ? AIT11 : ""
	Cb_20_Text := Cb_20 ? AIT12 : ""
	Cb_21_Text := Cb_21 ? AIT13 : ""
	Cb_22_Text := Cb_22 ? AIT14 : ""
	Cb_23_Text := Cb_23 ? AIT17 : ""
	Cb_24_Text := Cb_24 ? AIT18 : ""
	Cb_25_Text := Cb_25 ? AIT19 : ""
	Cb_26_Text := Cb_26 ? AIT20 : ""
	Cb_27_Text := Cb_27 ? AIT21 : ""
	Cb_28_Text := Cb_28 ? AIT22 : ""
	Cb_29_Text := Cb_29 ? APT1 : ""
	Cb_30_Text := Cb_30 ? APT2 : ""
	Cb_31_Text := Cb_31 ? APT3 : ""
	Cb_32_Text := Cb_32 ? APT4 : ""
	Cb_33_Text := Cb_33 ? APT5 : ""
	Cb_34_Text := Cb_34 ? APT6 : ""
	Cb_35_Text := Cb_35 ? APT7 : ""
	Cb_36_Text := Cb_36 ? APT8 : ""
	Cb_37_Text := Cb_37 ? APT9 : ""
	Cb_38_Text := Cb_38 ? AIT23 : ""
	Cb_39_Text := Cb_39 ? APT10 : ""
	Cb_40_Text := Cb_40 ? AIT5 : ""
	Cb_41_Text := Cb_41 ? AIT15 : ""
	Cb_42_Text := Cb_42 ? AIT16 : ""

	ConN := ConN ? " - Contact Name:" : ""

	Box1GF := Box1GF ? " Spoke to: " Box1GF " " : ""

	msgText = % Time " #ATG " Box1GF Cb_1_Text Cb_2_Text Cb_3_Text Cb_4_Text Cb_5_Text Cb_6_Text Cb_7_Text Cb_8_Text Cb_9_Text Cb_10_Text Cb_11_Text Cb_12_Text Cb_13_Text Cb_14_Text Cb_15_Text Cb_16_Text Cb_17_Text Cb_18_Text Cb_19_Text Cb_20_Text Cb_21_Text Cb_22_Text Cb_23_Text Cb_24_Text Cb_25_Text Cb_26_Text Cb_27_Text Cb_28_Text Cb_29_Text Cb_30_Text Cb_31_Text Cb_32_Text Cb_33_Text Cb_34_Text Cb_35_Text Cb_36_Text Cb_37_Text Cb_38_Text Cb_39_Text Cb_40_Text Cb_41_Text Cb_42_Text " •• " Box2GF

    if NOT (msgText == oldMsgText)
    {
       GuiControl, 74:Text, PreviewALL, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}



Return

74ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

74Buttonback:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

74ButtonConfirm:
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
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - General Full Tags`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt	
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

reload
Return


ADMINedit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

Gui, Destroy

Loop,
 {
  FileReadLine, AID%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AIT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, APT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinD%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

Loop,
 {
  FileReadLine, AinT%A_Index%, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt, %A_Index%
  If Errorlevel <> 0
     Break
 }

FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 74EDIT:-SysMenu +Border
Gui, 74EDIT:Color, 1d1f21, 383D46


Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x18 y18, INSTALL RELATED
Gui, 74EDIT:font, s8 bold, Segoe UI
Gui, 74EDIT:Add, Checkbox, x18 y45 , %AinT1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN1, %AinT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN2, %AinT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN3, %AinT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN4, %AinT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vIN5, %AinT6%
Gui, 74EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x118 y45, %AinD1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd1, %AinD2%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd2, %AinD3%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd3, %AinD4%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd4, %AinD5%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vINd5, %AinD6%
Gui, 74EDIT:font, 

Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x318 y18, ISSUES
Gui, 74EDIT:font, s8 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Checkbox, x318 y45 , %AIT1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI1, %AIT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI2, %AIT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI3, %AIT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI4, %AIT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI5, %AIT6%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI6, %AIT7%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI7, %AIT8%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI8, %AIT9%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI9, %AIT10%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI10, %AIT11%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI11, %AIT12%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI12, %AIT13%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI13, %AIT14%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI14, %AIT15%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI15, %AIT16%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI16, %AIT17%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI17, %AIT18%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI18, %AIT19%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI19, %AIT20%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI20, %AIT21%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI21, %AIT22%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vI22, %AIT23%
Gui, 74EDIT:font, s8 bold cE8EBF5 , Segoe UI
Gui, 74EDIT:Add, Text, x418 y45, %AID1%
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID1, %AID2%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID2, %AID3%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID3, %AID4%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID4, %AID5%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID5, %AID6%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID6, %AID7%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID7, %AID8%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID8, %AID9%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID9, %AID10%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID10, %AID11%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID11, %AID12%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID12, %AID13%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID13, %AID14%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID14, %AID15%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID15, %AID16%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID16, %AID17%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID17, %AID18%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID18, %AID19%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID19, %AID20%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID20, %AID21%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID21, %AID22%
Gui, 74EDIT:Add, edit, yp+20 w250 -E0x200 vID22, %AID23%

Gui, 74EDIT:font, s12 bold cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x18 y278 , PRODUCTS
Gui, 74EDIT:font,
Gui, 74EDIT:font, s8 cE8EBF5, Segoe UI
Gui, 74EDIT:Add, Text, x118 y280 , (optional)
Gui, 74EDIT:Add, edit, x18 y305 w98 -E0x200 , %APT1%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP1, %APT2%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP2, %APT3%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP3, %APT4%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP4, %APT5%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP5, %APT6%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP6, %APT7%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP7, %APT8%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP8, %APT9%
Gui, 74EDIT:Add, edit, yp+20 w98 -E0x200 vP9, %APT10%
Gui, 74EDIT:Add, edit, x118 y305 w190 -E0x200, %APD1%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD1, %APD2%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD2, %APD3%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD3, %APD4%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD4, %APD5%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD5, %APD6%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD6, %APD7%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD7, %APD8%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD8, %APD9%
Gui, 74EDIT:Add, edit, yp+20 w190 -E0x200 vPD9, %APD10%

Gui, 74EDIT:Add, Button, x418 y18 w80 h20 gADMINsave, SAVE
Gui, 74EDIT:Add, Button, x588 y18 w80 h20 gADMINexit, EXIT

Gui, 74EDIT:Add, Button, x18 y180 w80 h20 gOPENadminINSTALLt, OPEN
Gui, 74EDIT:Add, Button, x18 y520 w80 h20 gOPENadminPRODUCTSt, OPEN
Gui, 74EDIT:Add, Button, x318 y520 w80 h20 gOPENadminISSUESt, OPEN

Gui, 74EDIT:Add, Button, x118 y180 w80 h20 gOPENadminINSTALLd, OPEN
Gui, 74EDIT:Add, Button, x118 y520 w80 h20 gOPENadminPRODUCTSd, OPEN
Gui, 74EDIT:Add, Button, x418 y520 w80 h20 gOPENadminISSUESd, OPEN

Gui, 74EDIT:Add, Text, x18 y213 h20, Open text files directly.

Gui, 74EDIT:font,
Gui, 74EDIT:font, s6 cE8EBF5, Segoe UI
;Gui, 74EDIT:Add, Button, x18 y447 w80 h15 , Repeat

Gui, 74EDIT:Show, %Gui_Cord% ,%A_space%
return

ADMINexit:
reload
return

ADMINsave:
Gui, 74EDIT:Submit
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt
FileDelete, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt

FileAppend, 
(
#INSTALL
%IN1%
%IN2%
%IN3%
%IN4%
%IN5%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt

FileAppend,
(
%P1%
%P2%
%P3%
%P4%
%P5%
%P6%
%P7%
%P8%
%P9%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt

FileAppend,
(
#DATA
%I1%
%I2%
%I3%
%I4%
%I5%
%I6%
%I7%
%I8%
%I9%
%I10%
%I11%
%I12%
%I13%
%I14%
%I15%
%I16%
%I17%
%I18%
%I19%
%I20%
%I21%
%I22%
%I23%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt

FileAppend,
(
Software installation
%INd1%
%INd2%
%INd3%
%INd4%
%INd5%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt

FileAppend,
(
%PD1%
%PD2%
%PD3%
%PD4%
%PD5%
%PD6%
%PD7%
%PD8%
%PD9%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt

FileAppend,
(
Use this tag for all data issues
%ID1%
%ID2%
%ID3%
%ID4%
%ID5%
%ID6%
%ID7%
%ID8%
%ID9%
%ID10%
%ID11%
%ID12%
%ID13%
%ID14%
%ID15%
%ID16%
%ID17%
%ID18%
%ID19%
%ID20%
%ID21%
%ID22%
%ID23%
), G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt

Msgbox, 0, UPDATE TAGS, Update Complete

RELOAD
return

OPENadminINSTALLt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install tag.txt
return

OPENadminPRODUCTSt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod tag.txt
return

OPENadminISSUESt:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues tag.txt
return

OPENadminINSTALLd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin install desc.txt
return

OPENadminPRODUCTSd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin prod desc.txt
return

OPENadminISSUESd:
run, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\tags\admin issues desc.txt
return