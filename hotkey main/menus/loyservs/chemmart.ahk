chemmart:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Chemmart\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 56:font, s12 bold, Segoe UI
Gui, 56:Add, Text, center x0 y14 h30 w286 , TerryWhite Chemmart
Gui, 56:font,
Gui, 56:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 56:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 56:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 56:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 56:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 56:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 56:Add, Text, x28 y156 w80 h20 , Username
Gui, 56:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 56:Add, Text, x28 y186 w80 h20 , Password
Gui, 56:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 56:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 56:Add, Button, x102 y228 w78 h30 , Back
Gui, 56:Add, Button, x185 y228 w78 h30 , Exit
Gui, 56:Show, %Gui_Cord% w286 h278, 
return

56ButtonExit:
Reload
return

56ButtonBack:
Gui, 56:Destroy
gosub Q13
return

56ButtonConfirm:
Gui, submit

FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, surname
If (!SCODE)
	{
	SCODE = NULLCODE
	}
FileAppend, %Date% - %VersionNum% - %SCODE% - %Time% - %Name% %Surname% - LOYSERV File Create - %SCODE%`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

run, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 57:font, s10, Segoe UI
	Gui, 57:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 57:font, 
	Gui, 57:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 57:Add, Button, x168 y70 w80 h28 , No
	Gui, 57:Show, w267 h113, Warning!
	return
	
	57ButtonYes:
	run, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	57ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Chemmart\loyserv.dbf, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 58:font, s10, Segoe UI
	Gui, 58:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 58:font, 
	Gui, 58:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 58:Add, Button, x168 y70 w80 h28 , No
	Gui, 58:Show, w267 h113, Complete!
	return
	
	58ButtonYes:
	run, G:\Loyalty\All Stores\TWCM\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	58ButtonNo:
	Reload
	return
}
return