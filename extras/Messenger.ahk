File=G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\data.txt ;Change this to what ever directory is being shared with the other computer.
IniRead, vName, C:\AutoHotKey\settings.ini, UserName, name
;Name:=%vName% ;Comment this if you want to choose your own name in the chat. This is just to make things more simple.
;InputBox, Name, Username, Please enter a username. ;Uncomment this to choose your own name.
FileRead, Data, %File%
Gui, Destroy
Gui, Add, Edit, ReadOnly -BackgroundTrans +Border vTextData w300 h400, %Data%
Gui, Add, Edit, vTextInput  x10 y415 w200 h50,
Gui, Add, Button, gSend x215 y415 w95 h50, Send
Gui, Show,, Rainbow Road
WinGet Gui_ID, ID, A
SetTimer, ParseData, 500
Return

Send:
$Enter::
Gui, Submit, Nohide
IfWinNotActive, Rainbow Road
{
	Send, {Enter}
	Return
}
If (TextInput = "/del log")
{
	FileDelete, %File%
	FileAppend,, %File%
	GuiControl,, TextInput, 
	Return
}
;FileAppend, %name%:`n%TextInput%`n`n, %File%
FileAppend, %vName%:`n%TextInput%`n`n, %File%
GuiControl,, TextInput, 
Return

ParseData:
FileRead, Data, %File%
If (Data <> LastData)
{
	GuiControl,, TextData, %Data%
	GuiControl Focus, TextData
	ControlGetFocus ClassLog, ahk_id %Gui_ID%
	ControlSend %ClassLog%, ^{End}, ahk_id %Gui_ID%
	GuiControl Focus, TextInput
        TrayTip, New message!
        Sleep 500
        TrayTip
}
LastData=%Data%
Return

GuiClose:
ExitApp