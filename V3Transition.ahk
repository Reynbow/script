#SingleInstance, Force

IfNotExist, C:\AutoHotKey\Files\API Site Template.xlsx
{
sleep 50
FileCreateDir, C:\AutoHotKey\Files\
sleep 50
FileCopy, G:\Loyalty\Loyalty Projects\API ROLLOUT\Template\API Site Template.xlsx, C:\AutoHotKey\Files\
sleep 50
}
gosub MainGUI
WinWaitClose, ahk_class AutoHotkeyGUI
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
IniRead, vName, C:\AutoHotKey\settings.ini, UserName, name
FileAppend, %Date% - %Time% - %vName% - API Rollout Form `n, G:\Support\Public Staff Folders\Aaron\scriptlog.txt
Run C:\AutoHotKey\Files\API Site Template.xlsx
gosub TemplateCheck
WinWaitClose, ahk_class AutoHotkeyGUI
Sleep 500
SendInput, %Sitecode%{DOWN}%StoreName%{DOWN}%Spoke%{DOWN 2}%PCName%{DOWN}%CBDispDept%{DOWN}%DispDept%{DOWN}%CBPlpset%{DOWN}%CBFolder%{DOWN}%CBWebsite%{DOWN}%CBIcon%{DOWN}%CBFAQ%{DOWN}%CBDisV2%{DOWN 2}%Tills%{DOWN}%POS%{DOWN}%LoyMode%{DOWN 2}%BoxT1A%{DOWN}%T1Startup%{DOWN}%BoxT1B%{DOWN}%T1Excep%{DOWN}%T1URL%{DOWN}%T1Icon%{DOWN}%T1FAQ%{DOWN}%T1Receipt%{DOWN}%T1Points%{DOWN}%T1prompt%{DOWN}%T1Stops%{DOWN}%T1Zed%{DOWN}%T1mtn%{DOWN}%BoxT1C%
sleep 2000
gosub, Till2
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT2A%{DOWN}%T2Startup%{DOWN}%BoxT2B%{DOWN}%T2Excep%{DOWN}%T2URL%{DOWN}%T2Icon%{DOWN}%T2FAQ%{DOWN}%T2Receipt%{DOWN}%T2Points%{DOWN}%T2prompt%{DOWN}%T2Stops%{DOWN}%T2Zed%{DOWN}%T2mtn%{DOWN}%BoxT2C%
sleep 1000
gosub, Till3
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT3A%{DOWN}%T3Startup%{DOWN}%BoxT3B%{DOWN}%T3Excep%{DOWN}%T3URL%{DOWN}%T3Icon%{DOWN}%T3FAQ%{DOWN}%T3Receipt%{DOWN}%T3Points%{DOWN}%T3prompt%{DOWN}%T3Stops%{DOWN}%T3Zed%{DOWN}%T3mtn%{DOWN}%BoxT3C%
sleep 1000
gosub, Till4
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT4A%{DOWN}%T4Startup%{DOWN}%BoxT4B%{DOWN}%T4Excep%{DOWN}%T4URL%{DOWN}%T4Icon%{DOWN}%T4FAQ%{DOWN}%T4Receipt%{DOWN}%T4Points%{DOWN}%T4prompt%{DOWN}%T4Stops%{DOWN}%T4Zed%{DOWN}%T4mtn%{DOWN}%BoxT4C%
sleep 1000
gosub, Till5
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT5A%{DOWN}%T5Startup%{DOWN}%BoxT5B%{DOWN}%T5Excep%{DOWN}%T5URL%{DOWN}%T5Icon%{DOWN}%T5FAQ%{DOWN}%T5Receipt%{DOWN}%T5Points%{DOWN}%T5prompt%{DOWN}%T5Stops%{DOWN}%T5Zed%{DOWN}%T5mtn%{DOWN}%BoxT5C%
sleep 1000
gosub, Till6
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT6A%{DOWN}%T6Startup%{DOWN}%BoxT6B%{DOWN}%T6Excep%{DOWN}%T6URL%{DOWN}%T6Icon%{DOWN}%T6FAQ%{DOWN}%T6Receipt%{DOWN}%T6Points%{DOWN}%T6prompt%{DOWN}%T6Stops%{DOWN}%T6Zed%{DOWN}%T6mtn%{DOWN}%BoxT6C%
sleep 1000
gosub, Till7
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT7A%{DOWN}%T7Startup%{DOWN}%BoxT7B%{DOWN}%T7Excep%{DOWN}%T7URL%{DOWN}%T7Icon%{DOWN}%T7FAQ%{DOWN}%T7Receipt%{DOWN}%T7Points%{DOWN}%T7prompt%{DOWN}%T7Stops%{DOWN}%T7Zed%{DOWN}%T7mtn%{DOWN}%BoxT7C%
sleep 1000
gosub, Till8
WinWaitClose, ahk_class AutoHotkeyGUI
SendInput, %BoxT8A%{DOWN}%T8Startup%{DOWN}%BoxT8B%{DOWN}%T8Excep%{DOWN}%T8URL%{DOWN}%T8Icon%{DOWN}%T8FAQ%{DOWN}%T8Receipt%{DOWN}%T8Points%{DOWN}%T8prompt%{DOWN}%T8Stops%{DOWN}%T8Zed%{DOWN}%T8mtn%{DOWN}%BoxT8C%
gosub, ButtonEND
return

TemplateCheck:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, font, s8, Helvetica
Gui, Add, Text, x18 y22 h15, PLEASE SELECT CELL "B2"
Gui, Add, Text, x18, PICTURE BELOW
Gui, Add, Picture, x18 y75 w579 h83 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\apitemplate.png
Gui, Add, Text, x18, `nAFTER SELECTING "B2", CLICK CONFIRM, THEN WAIT
Gui, Add, Button, x415 y208 w90 h30, &Next
Gui, Add, Button, x515 y208 w90 h30, E&xit
Gui, Show, h250 w620, API Template
return

Till2:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 2
return

Till3:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 3
return

Till4:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 4
return

Till5:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 5
return

Till6:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 6
return

Till7:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 7
return

Till8:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, Add, Text, x102 y19 w320 h20 , If there is another Till`, select the next Till Tab and select cell B2
Gui, Add, Button, x412 y159 w60 h30 , Next
Gui, Add, Button, x482 y159 w100 h30 , END
Gui, Add, Picture, x12 y9 w80 h50 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till.png
Gui, Add, Picture, x12 y69 w579 h80 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\till2.png
Gui, Show, w600 h207, TILL 8
return

ButtonNext:
Gui, Submit
return

MainGUI:
Gui, +AlwaysOnTop
Gui, font, s12 bold, Helvetica
Gui, Add, Text, x50 y10 w100 h20 , V3 Transition
Gui, font,
Gui, font, s8, Helvetica
pre = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG
Gui, Add, Text, x10 y38 w60 h20 , Store Prefix:
Gui, Add, DropDownList, x80 y35 w100 vPrefix, %pre%
Gui, Add, Text, x10 y63 w50 h20 , Sitecode:
Gui, Add, Edit, x80 y60 w100 h20 vSitecode,
Gui, Add, Text, x10 y88 w80 h20 , Store Name:
Gui, Add, Edit, x80 y85 w100 h20 vStoreName,
Gui, Add, Text, x10 y113 w60 h20 , Spoke to:
Gui, Add, Text, x185 y113 h20 , *
Gui, Add, Edit, x80 y110 w100 h20 vSpoke,
Gui, Add, CheckBox, x10 y135 w160 h20 vCb_DisV2, Disabled V2 in SiteIQ
Gui, font, s8 bold, Helvetica
Gui, Add, Text, x10 y170 h20 , Back Office PC details:
Gui, font,
Gui, font, s8, Helvetica
Gui, Add, Text, x10 y194 w100 h20 , PC Name:
Gui, Add, Edit, x80 y191 w100 h20 vPCName,
Gui, Add, Checkbox, x10 y214 w150 h20 vCb_DispDept, Disp Depts in Settings.dbf
Gui, Add, Edit, x160 y214 w50 h20 vDispDept,
Gui, Add, Checkbox, x10 y234 w190 h20 vCb_Plpset, Plpset.dbf backed-up and deleted
Gui, Add, Checkbox, x10 y254 w180 h20 vCb_Folder, Intpharm folder shared
Gui, Add, Checkbox, x10 y274 w180 h20 vCb_Website, Website shortcut URL updated
Gui, Add, Checkbox, x10 y294 w180 h20 vCb_Icon, Inthelp icon updated
loylist = Auto|Partial|Manual
Gui, Add, Text, x220 y13 w40 h20 , POS:
Gui, Add, Edit, x290 y10 w100 h20 vPOS,
Gui, Add, Text, x220 y38 w90 h20 , Total Tills:
Gui, Add, Text, x395 y38 w90 h20 , *
Gui, Add, Edit, x290 y35 w100 h20 vTills,
Gui, Add, Text, x410 y13 w80 h20 , Loyalty Mode:
Gui, Add, DropDownList, x490 y13 w100 vLoyMode, %loylist%
Gui, Add, Picture, x0 y340 w210 h9 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\sep3.png
Gui, Add, Picture, x210 y340 w210 h9 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\sep3.png
Gui, Add, Picture, x420 y340 w210 h9 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\sep3.png
Gui, font, s12 bold, Helvetica
Gui, Add, Text, x10 y370 h20 , V3 Transition Comment Template
Gui, font,
Gui, font, s8, Helvetica
Gui, Add, Checkbox, x10 y405 w190 h20 vCb_APIROLL , #APIROLL
Gui, Add, Checkbox, x10 y425 w180 h20 vCb_INDROLL, #INDROLL
Gui, Add, Checkbox, x10 y445 w180 h20 vCb_LOYV3, #LOYV3
Gui, Add, Checkbox, x10 y490 w180 h20 vCb_TillsTested, All tills tested and working
Gui, Add, Checkbox, x10 y510 w180 h20 vCb_Transition, Transition complete
Gui, Add, Checkbox, x10 y530 h20 vCb_Training , Training complete - Trained:
Gui, Add, Edit, x170 y530 w100 h20 vTrainedName,
Gui, Add, Checkbox, x10 y550 h20 vCb_Document, Transition document attached to LOYV3 Client
Gui, Add, Checkbox, x290 y380 h20 vCb_Addition, Still to be completed:
Gui, Add, Edit, x290 y400 w300 h95 vNotes ,
Gui, Add, Picture, x318 y498 w95 h95 , G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\files\all_tag_6.png
Gui, Add, Text, x435 y365 h20 ,*
Gui, Add, Button, x443 y360 w146 h30 , &Comment Only
Gui, Add, Button, x443 y515 w146 h30 , &Confirm
Gui, Add, Button, x443 y550 w146 h30 , &Exit
Gui, Add, Tab2, x215 y69 w380 h250 , Till 1|Till 2|Till 3|Till 4|Till 5|Till 6|Till 7|Till 8
Gui, Add, Text, x232 y102 h20 , First Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT1A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT1_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT1B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT1_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT1_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT1_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT1_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT1_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT1_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT1_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT1_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 2
Gui, Add, Text, x232 y102 h20 , Second Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT2A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT2_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT2B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT2_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT2_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT2_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT2_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT2_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT2_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT2_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT2_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 3
Gui, Add, Text, x232 y102 h20 , Third Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT3A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT3_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT3B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT3_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT3_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT3_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT3_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT3_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT3_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT3_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT3_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 4
Gui, Add, Text, x232 y102 h20 , Fourth Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT4A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT4_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT4B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT4_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT4_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT4_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT4_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT4_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT4_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT4_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT4_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 5
Gui, Add, Text, x232 y102 h20 , Fifth Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT5A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT5_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT5B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT5_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT5_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT5_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT5_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT5_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT5_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT5_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT5_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 6
Gui, Add, Text, x232 y102 h20 , Sixth Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT6A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT6_Startup, Balance Checker in startup
Gui, Add, CheckBox, x372 y139 w110 h20 vT6_Excep, Exceptions added
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT6B,
Gui, Add, CheckBox, x232 y159 w180 h20 vT6_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT6_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT6_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT6_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT6_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT6_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT6_Zed, Zed: $0 Recipts ON

Gui, Tab, Till 7
Gui, Add, Text, x232 y102 h20 , Seventh Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT7A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT7_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT7B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT7_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT7_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT7_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT7_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT7_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT7_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT7_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT7_Zed, Zed: $0 Recipts ON
Gui, Tab, Till 8
Gui, Add, Text, x232 y102 h20 , Eighth Till Name:
Gui, Add, Edit, x330 y99 w100 h20 vBoxT8A,
Gui, Add, CheckBox, x232 y119 w150 h20 vT8_Startup, Balance Checker in startup
Gui, Add, Text, x232 y142 w30 h20 , AV:
Gui, Add, Edit, x262 y139 w100 h20 vBoxT8B,
Gui, Add, CheckBox, x372 y139 w110 h20 vT8_Excep, Exceptions added
Gui, Add, CheckBox, x232 y159 w180 h20 vT8_URL, Website shortcut URL updated
Gui, Add, CheckBox, x232 y179 w180 h20 vT8_Icon, Int help icon updated
Gui, Add, CheckBox, x232 y229 w180 h20 vT8_Receipt, Loyalty Receipt printed
Gui, Add, CheckBox, x232 y249 w180 h20 vT8_Points, Live points working
Gui, Add, CheckBox, x232 y269 w180 h20 vT8_prompt, Promptpos = bcpos
Gui, Add, CheckBox, x422 y229 w160 h20 vT8_Stops, Stops: Hook updated
Gui, Add, CheckBox, x422 y249 w160 h20 vT8_Zed, Zed: $0 Recipts ON
Gui, Show, x200 y200 w605 h595, V3 Transition
return
ButtonConfirm:
Gui, Submit
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
return
ButtonEND:
Gui, Destroy
FormatTime, Date,, yyyyMMdd
FormatTime, Time,, h:mmtt
Clipboard=%Time% - %CbAPIROLL% %CbLOYV3% %CbINDROLL% - Spoke to: %Spoke% - Total Tills: %Tills% - %CbTillsTested% - %CbTransition% %CbTraining% %TrainedName% - %CbDocument% - %CbAddition% %notes%
FileCreateDir, G:\Loyalty\All Stores\%pre%\%Sitecode% - %StoreName%\Install Sheet\
sleep 500
WinActivate, Microsoft Excel - API Site Template.xlsx
sleep 500
FileCreateDir, G:\Loyalty\All Stores\%Prefix%\%Sitecode% - %StoreName%\Install Sheet\
SendInput {F12}
WinWaitActive, Save As
SendInput, G:\Loyalty\All Stores\%Prefix%\%Sitecode% - %StoreName%\Install Sheet\%Sitecode% - %Date%{ENTER}
sleep 500
gosub ConfirmationWindow
return

ButtonCommentOnly:
Gui, Submit
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
FormatTime, Date,, yyyyMMdd
FormatTime, Time,, h:mmtt
Clipboard=%Time% - %CbAPIROLL% %CbLOYV3% %CbINDROLL% - Spoke to: %Spoke% - Total Tills: %Tills% - %CbTillsTested% - %CbTransition% %CbTraining% %TrainedName% - %CbDocument% - %CbAddition% %notes%
ExitApp

ButtonExit:
ExitApp

ConfirmationWindow:
Gui, Destroy
Gui, +AlwaysOnTop
Gui, font, s10, Helvetica
Gui, Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
Gui, font,
Gui, Add, Button, x78 y70 w80 h28 , Yes
Gui, Add, Button, x168 y70 w80 h28 , No
Gui, Show, w267 h113, Complete!
return
ButtonYes:
Gui, Destroy
run, G:\Loyalty\All Stores\%Prefix%\%Sitecode% - %StoreName%\Install Sheet\
ExitApp
ButtonNo:
ExitApp