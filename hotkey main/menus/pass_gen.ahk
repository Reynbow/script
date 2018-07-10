PassGen:
WinGetPos, gui_x, gui_y,,, ahk_class AutoHotkeyGUI
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, 87:-SysMenu -caption -Border %OnTopSetting%
Gui, 87:Color, %BGColour%, 2b2e43
Gui, 87:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, 87:Add, Picture, x0 y75 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, 87:Font, s8 cE8EBF5, Segoe UI
Gui, 87:Add, GroupBox, x16 y30 w130 h140,password contains...
Gui, 87:Add, Checkbox, x26 y47 w115 h30 vCheck1 checked,lower case letters
Gui, 87:Add, Checkbox, x26 y77 w115 h30 vCheck2 checked,capital letters
Gui, 87:Add, Checkbox, x26 y107 w115 h30 vCheck3 checked,digits
Gui, 87:Add, Checkbox, x26 y137 w115 h30 vCheck4,special chars
Gui, 87:Add, GroupBox, x154 y30 w100 h50,password length
Gui, 87:Add, Edit, -E0x200 x164 y50 w80 h20 vPasslen, 16
Gui, 87:Add, GroupBox, x154 y82 w100 h88, Info
Gui, 87:Add, Text, x161 y97 w90 h69 , generated password will automatically copied to clipboard!
Gui, 87:Add, Button, x16 y304 w237 h30 Default hwndPass1 gGenPass, Generate & Copy
Gui, 87:Add, Button, x16 y344 w115 h30 hwndPass2, Back
Gui, 87:Add, Button, x137 y344 w115 h30 hwndPass3, Close
Gui, 87:Font, s16 cE8EBF5, Segoe UI
Gui, 87:Add, Edit, -E0x200 x16 y184 w237 -VScroll h100 vNewPass readonly,  

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(Pass1, Opt1, Opt2, , , Opt5)
ImageButton.Create(Pass2, Opt1, Opt2, , , Opt5)
ImageButton.Create(Pass3, Opt1, Opt2, , , Opt5)

Gui, 87:Show, %Gui_Cord% h398 w271, %A_Space%
Return
;---------------
87ButtonClose:
Reload
return
;---------------
87ButtonBack:
Gui, 87:Destroy
Gui, 99P:Destroy
do_lines_pre = 0
gosub Q1
return
;---------------
GenPass:
Gui, 87:Submit, NoHide ; Save the values of the check buttons.
if (passlen <= 0) 
{
  msgbox,16, Well aren't you a special snowflake..., You want a password with 0 characters? What are you... a Pharmacist?
  GuiControl,, Passlen, 8
  GuiControl,, NewPass,
  Clipboard = 
  return
}
if (passlen > 1000) 
{
  msgbox,64, Info, Attention: Maximum password length is 1000 characters ! ;-)
  GuiControl,, Passlen, 1000
  GuiControl,, NewPass,
  Clipboard = 
  return
}
strpool =
pass =
chAlpha1 = abcdefghijklmnopqrstuvwxyz
chAlpha2 = ABCDEFGHIJKLMNOPQRSTUVWXYZ
chNumeric = 1234567890
chExtra = !"£$`%^&*()_-=+{}[]`;:``@'#~<>,./?\|¬¦
if (check1 = 0) and (check2 = 0) and (check3 = 0) and (check4 = 0)
{
  msgbox,64, Info,Please check a minimum of 1 checkbox !
  GuiControl,, NewPass,
  GuiControl,, check1,1
  GuiControl,, check2,1
  GuiControl,, check3,1
  Clipboard = 
  return
}
if Check1 = 1 
  strpool = %strpool%%chAlpha1%
if Check2 = 1 
  strpool = %strpool%%chAlpha2%
if Check3 = 1 
  strpool = %strpool%%chNumeric%
if Check4 = 1 
  strpool = %strpool%%chExtra%
StringSplit, list, strpool
Loop, % passlen
{
	Random, rnd, 1, % list0
	i := list%rnd%
	pass = %pass%%i%
}
GuiControl,, NewPass, %pass%
Clipboard = %pass%
Return