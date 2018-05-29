SupINSTALL:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position

IfNotExist, C:\AutoHotKey\Files\thumbsup.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\thumbsup.png, C:\AutoHotKey\Files\thumbsup.png
}
IfNotExist, C:\AutoHotKey\Files\bau.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\buttons\bau.png, C:\AutoHotKey\Files\bau.png
}

IfNotExist, C:\AutoHotKey\Files\flash.png
{
	FileCopy, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\flash.png, C:\AutoHotKey\Files\flash.png
}

Gui, Destroy 
FileRead, codelist, G:\Support\Public Staff Folders\Aaron\Sitecodes\codelist.txt
Gui, 18:-SysMenu -caption -Border

;Gui, 18:Add, Picture, x0 y75 , C:\AutoHotKey\Files\back-sup.png
;Gui, 18:Add, Picture, x270 y75 , C:\AutoHotKey\Files\back-right.png

Gui, 18:font, cE8EBF5, Segoe UI
Gui, 18:Color, %BGColour%, 2b2e43
Gui, 18:Add, Picture, x0 y120 , C:\AutoHotKey\Files\ui\back-sup-wide.png
Gui, 18:Add, Text, x0 y0 w652 h25 Center GuiMove,
Gui, 18:Add, Checkbox, x18 y59 vHSNET, HSNET%A_Space%
Gui, 18:Add, Checkbox, x18 y79 vDIN, #DISPXIN%A_Space%
Gui, 18:Add, Checkbox, x18 y99 vPIN, #POSXIN%A_Space%
Gui, 18:Add, Checkbox, x18 y119 vJUMP, #JUMPSHIP%A_Space%
Gui, 18:Add, Text, x110 y59 w100 h50 , HSNET Installed
Gui, 18:Add, Text, x110 y79 w100 h50 , DISPX Installed
Gui, 18:Add, Text, x110 y99 w100 h50 , POSX Installed
Gui, 18:Add, Text, x110 y119 w200 h50 , Disconnected before extraction completed
Gui, 18:font, s10 cE8EBF5 bold, Segoe UI
Gui, 18:Add, Text, x18 y180 h20 w254 vPreviewCODE, 
Gui, 18:font,
Gui, 18:font, cE8EBF5 , Segoe UI
Gui, 18:Add, Text, yp+30 h15 BackGroundTrans, SITE CODE
Gui, 18:Add, Text, yp+30 h15 BackGroundTrans, Name of the person you spoke to
Gui, 18:Add, Text, yp+30 w180 h20 BackGroundTrans, Checked the network for installs
Gui, 18:Add, Text, yp+30 w180 h20 BackGroundTrans, Resolution
Gui, 18:Add, Text, yp+30 w180 h20 BackGroundTrans, Antivirus in use
Gui, 18:Add, Text, yp+30 w180 h20 BackGroundTrans, Exceptions added
Gui, 18:Add, Text, yp+30 w180 h20 BackGroundTrans, Help Icon location?
Gui, 18:Add, Edit, xp+190 yp-184 w80 h20 -E0x200 vSCODE,
Gui, 18:Add, Edit, yp+30 w80 h20 -E0x200 vConName,
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vNetwork, |Yes|No
Gui, 18:Add, Edit, yp+30 w80 -E0x200 vRes,
Gui, 18:Add, Edit, yp+30 w80 h20 readonly -E0x200 -VScroll vBox3G,%A_space%Set on Site IQ
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vExc, |Yes|No
Gui, 18:Add, DropDownList, yp+30 w80 -E0x200 vIco, |Top Right|Bottom Right|Top Left|Bottom Left|Random
Gui, 18:Add, Checkbox, x326 y59 vIN, #IN
Gui, 18:Add, Checkbox, x326 y79 vOUT, #OUT
Gui, 18:Add, Checkbox, x326 y99 vEMAIL, #EMAIL
Gui, 18:font, s16 cE8EBF5 bold, Segoe UI
Gui, 18:Add, Text, x326 y14 , CONTACT INITIATION
Gui, 18:Add, Text, x18 y14 , INSTALLATION
Gui, 18:font,
Gui, 18:font, s8 cE8EBF5, Segoe UI
Gui, 18:Add, Text, x406 y59, An incoming call initiated the install
Gui, 18:Add, Text, x406 y79, An outgoing call initiated the install
Gui, 18:Add, Text, x406 y99, An email initiated the install
Gui, 18:Add, Button, x326 y388 w90 h30 hwndSupIn1, Confirm
Gui, 18:Add, Button, x432 y388 w90 h30 hwndSupIn2, Back
Gui, 18:Add, Button, x536 y388 w90 h30 hwndSupIn3, Exit
Gui, 18:Add, GroupBox, x326 y159 w300 h210, Preview
Gui, 18:Add, Text, x329 y179 w20 h188
Gui, 18:Add, Text, x336 y179 w288 h188 vPreview

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(SupIn1, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupIn2, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupIn3, Opt1, Opt2, , , Opt5)

Gui, 18:Show, %Gui_Cord% w652 h432,  
Gui, 2:Destroy
Gui, 30:Destroy

loop
{
    Gui, 18:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, 18:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

    HSNET := HSNET ? " HSNET" : ""
	DIN := DIN ? " #DISPXIN" : ""
	PIN := PIN ? " #POSXIN" : ""
	IN := IN ? " #IN" : ""
	OUT := OUT ? " #OUT" : ""
	EMAIL := EMAIL ? " #EMAIL" : ""
	JUMP := JUMP ? " #JUMPSHIP" : ""
	
	ConName := ConName ? " •• SPOKE TO: " ConName : ""
	Network := Network ? " •• DUAL IN CHECKED: " Network : ""
	Res := Res ? " •• RESOLUTION: " Res " " Jump : ""
	Exc := Exc ? " •• AV EXCEPTIONS ADDED: " Exc : ""
	Ico := Ico ? " •• HELP ICON: " Ico : ""

    msgText= % Time " - #INSTALL •• SYSTEMS INSTALLED:" HSNET DIN PIN IN OUT EMAIL ConName Network Res Exc Ico

	;msgText=%Time% - #INSTALL %Cb_4_Text%%Cb_5_Text%%Cb_6_Text%%Cb_7_Text% - Spoke to %Box1G% - CHANGES MADE: Installed %Cb_1_Text% %Cb_2_Text% %Cb_3_Text% - Checked network for alternate installs: %Choice1G% - RESOLUTION: %Box2G% - HELP ICON: %Choice2G% - AV EXCEPTIONS ADDED: %Choice3G%


    if NOT (msgText == oldMsgText)
    {
       GuiControl, 18:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}
return

18ButtonBack:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 18:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return

18ButtonExit:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Reload
return

18ButtonConfirm:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, Submit,

If(Cb_1=1)
 GuiControlGet, Cb_1_Text,, Cb_1, Text
If(Cb_2=1)
 GuiControlGet, Cb_2_Text,, Cb_2, Text
If(Cb_3=1)
 GuiControlGet, Cb_3_Text,, Cb_3, Text
If(Cb_4=1)
 GuiControlGet, Cb_4_Text,, Cb_4, Text
If(Cb_5=1)
 GuiControlGet, Cb_5_Text,, Cb_5, Text
If(Cb_6=1)
 GuiControlGet, Cb_6_Text,, Cb_6, Text

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
	Clipboard = %msgText%
	TrayTip, Clipboard Ready, %msgText%, 5, 16
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Installation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
;FileAppend, Technician - [[ %Name% ]]`n%Clipboard%`n`n`n, G:\Support\Public Staff Folders\Aaron\notes\note_log.txt

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileCreateDir, G:\Support\Public Staff Folders\Aaron\points\%Name%\
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% Install.txt

;ADDING POINTS
IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
Points++  ; This adds 1 to your variable TimesOpened.
Points++
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

;WRITE THE MACRO
IniWrite %msgText%, C:\AutoHotKey\settings.ini, MACROLIST, MACRO9

Gui, 18:Destroy
Gui, 73:Add, Picture, x-88 y-51 w400 h800 , C:\AutoHotKey\Files\flash.png
Gui, 73:Font, S10 Bold, Segoe UI
Gui, 73:Add, Text, x202 y29 w230 h30 , Remember install dates for Site IQ!
Gui, 73:Add, Button, x290 y199 w150 h30 , Close
Gui, 73:Show, w466 h263,  
return

73ButtonClose:
Reload
return