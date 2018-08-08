SupCancellation:
Gui, Destroy
Gui, 99:Destroy
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
FileRead, codelist, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\codelist.txt
Gui, BC:-SysMenu -caption -Border %OnTopSetting%
Gui, BC:Color, %BGColour%, 2b2e43
Gui, BC:Add, Text, x0 y0 w910 h25 Center GuiMove,
Gui, BC:Add, Picture, x0 y160 , C:\AutoHotKey\Files\ui\back-sup.png
Gui, BC:font, s16 bold cE8EBF5, Segoe UI
Gui, BC:Add, Text, x20 y12 , STORE CANCELATION
Gui, BC:font, 
Gui, BC:font, cE8EBF5, Segoe UI
Gui, BC:Add, Checkbox, x18 y65 vIN, Incoming Call
Gui, BC:Add, Checkbox, yp+20 vOUT, Outgoing Call
Gui, BC:Add, Checkbox, yp+20 vEMAIL, Email

Gui, BC:Add, Text, yp+35 h20 w254 vPreviewCODE, 

Gui, BC:Add, Text, yp+30 h15 , STORE ID:
Gui, BC:Add, Text, yp+30 h15 , Name of the person who cancelled
Gui, BC:Add, Text, yp+30 h15 , Role of the person who cancelled

Gui, BC:Add, Edit, xp+190 yp-60 -E0x200 w90 vSCODE ,
Gui, BC:Add, Edit, yp+30 -E0x200 w90 vSpoke ,
Gui, BC:Add, Edit, yp+30 -E0x200 w90 vRole ,

Gui, BC:Add, Checkbox, x320 y95 vAPI, API
Gui, BC:Add, Checkbox, yp+20 vApotex, Apotex
Gui, BC:Add, Checkbox, yp+20 vLoyalty, Loyalty
Gui, BC:Add, Checkbox, yp+20 vPrivate, Private Label
Gui, BC:Add, Checkbox, yp+20 vRanbaxy, Ranbaxy
Gui, BC:Add, Checkbox, yp+20 vSandoz, Sandoz
Gui, BC:Add, Checkbox, yp+20 vSanofi, Sanofi
Gui, BC:Add, Checkbox, yp+20 vStoreIQ, Store IQ

Gui, BC:Add, Text, x18 yp+40 w180 h20, Additional Notes:
Gui, BC:Add, Edit, -E0x200 yp+20 w388 h40 -VScroll vAdditional ,

Gui, BC:Add, GroupBox, yp+50 w265 h120, Preview
Gui, BC:Add, Text, xp+2 yp+20 w20 h98 ,
Gui, BC:Add, Text, xp+8 w253 h98 vPreview, 

Gui, BC:Add, Button, xp+265 yp-13 w100 h30 hwndSupCan1, Confirm
Gui, BC:Add, Button, yp+41 w100 h30 hwndSupCan2, Back
Gui, BC:Add, Button, yp+41 w100 h30 hwndSupCan3, Exit

Opt1 := [0, "WHITE"    ,       , 0x0C131E , , , "WHITE", 2]
Opt2 := [ , 0x2b2e43   ,       ,  "WHITE" , , , 0x2b2e43, 2]
Opt5 := [ ,            ,       , 0x0C131E]        

ImageButton.Create(SupCan1, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupCan2, Opt1, Opt2, , , Opt5)
ImageButton.Create(SupCan3, Opt1, Opt2, , , Opt5)

Gui, BC:Show, %Gui_Cord% w420 h480, %A_Space%

loop
{
    Gui, BC:Submit, NoHide

	var := SCODE
    RegExMatch(codelist, "m)^" var "(.+)$", a)
	codetext = % trim(a1)

    if NOT (codeText == oldcodeText)
    {
       GuiControl, BC:Text, PreviewCODE, %codeText%
       oldcodeText := codeText
    }

	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	IN := In ? " #IN " : ""
	Out := Out ? "#OUT " : ""
	Email := Email ? "#EMAIL " : ""
	
	API := API ? "#APID " : ""
	Apotex := Apotex ? "#APOD " : ""
	Loyalty := Loyalty ? "#LOYALTY " : ""
	Private := Private ? "#PRIVATE " : ""
	Ranbaxy := Ranbaxy ? "#NAV " : ""
	Sandoz := Sandoz ? "#DI " : ""
	Sanofi := Sanofi ? "#SANCEN " : ""
	StoreIQ := StoreIQ ? "#STOREIQ " : ""
	
    msgText = %Time% - #CANCEL REQUEST •• %IN%%OUT%%EMAIL%•• SPOKE TO: %Spoke% the %role% who requested the cancellation. •• CLIENTS CANCELLED: %API%%APOTEX%%LOYALTY%%PRIVATE%%RANBAXY%%SANDOZ%%SANOFI%%STOREIQ%•• %Additional%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, BC:Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

BCButtonExit:
reload
return

BCButtonBack:
	Gui, BC:destroy
	gosub, Q1
return

BCButtonConfirm:
if (!SCODE){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}


Clipboard = %msgText%

	If clipboard Contains #SANCEN
		{

		#Include csv.ahk

		CSV_Load("G:\Support\Clients\SANOFI\Territory List\sanaccts.csv","A",",")

		TheID = % CSV_MatchCellColumn("A", SCODE, 4, 1)

		TheCol = % CSV_ReadCell("A", TheID, 2)
		TheName = % CSV_ReadCell("A", TheID, 3)
		ThePHCode = % CSV_ReadCell("A", TheID, 1)

		;msgbox % ThePHCode

		Gui, BC:hide
		Gui, A:+AlwaysOnTop
		Gui, A:Margin, 16, 16
		Gui, A:Color, 1d1f21, 383D46
		Gui, A:-SysMenu +Border
		Gui, A:Add, Edit, x-100 y-100 -E0x200 , dummy
		Gui, A:font, cE8EBF5 bold s16, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , SANOFI CANCELATION
		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI

		Gui, A:Add, Text, xm -E0x200 , Please confirm the below information is correct.`nMake any changes required.
		
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , Store Name:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vStoreName, %TheCol%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , PH Code:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vThePHCode, %ThePHCode%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		Gui, A:font, cE8EBF5 s10, Segoe UI
		Gui, A:Add, Text, xm -E0x200 , Rep Name:
		Gui, A:font, 
		Gui, A:font, cE8EBF5 s12, Segoe UI

		Gui, A:Add, Edit, yp+20 -E0x200 w250 vTheName, %TheName%

		Gui, A:font, 
		Gui, A:font, cE8EBF5, Segoe UI
		

		Gui, A:Add, Button, xm w120 h30 gSanCancConf , CONFIRM
		Gui, A:Add, Button, x+10 w120 h30 gBackCancel, BACK
		Gui, A:Add, Button, x15 y+10 w250 h30 gEXIT, EXIT
		Gui, A:Show, , %A_Space%
		return

		SanCancConf:
		Gui, A:Submit

		IfEqual, TheName, Cristina Lo Giudice
			{
				TheName = Cristina LoGiudice
			}

		StringReplace, TheEmail, TheName, %A_Space%, ., All

		;MsgBox % TheName "`n" TheEmail "@sanofi.com.au"

		email := ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
		email.To := TheEmail "@sanofi.com"
		email.Cc := "support@intellipharm.com.au"
		email.Subject := "Sanofi Cancellation - " ThePHCode " - " StoreName
		email.Body := "Hi " TheName ",`n`nThis email is to advise you that " ThePHCode " " StoreName " has requested the Sanofi reporting service be cancelled for their store.`n`nTo reinstate the reporting service for this store, please arrange for the store to complete a new signup via Sanofi Central.`n`n"
		email.Display

		gosub continuecancel
		return
		}

continuecancel:
Gui, Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - Cancellation`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
	TrayTip, Clipboard Ready, %clipboard%, 5, 16
reload
return