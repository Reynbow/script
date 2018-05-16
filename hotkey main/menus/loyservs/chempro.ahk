Chempro:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Chempro\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 59:font, s12 bold, Segoe UI
Gui, 59:Add, Text, center x0 y14 h30 w286 , Chempro
Gui, 59:font,
Gui, 59:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 59:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 59:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 59:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 59:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 59:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 59:Add, Text, x28 y156 w80 h20 , Username
Gui, 59:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 59:Add, Text, x28 y186 w80 h20 , Password
Gui, 59:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 59:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 59:Add, Button, x102 y228 w78 h30 , Back
Gui, 59:Add, Button, x185 y228 w78 h30 , Exit
Gui, 59:Show, %Gui_Cord% w286 h278, 
return

59ButtonExit:
Reload
return

59ButtonBack:
Gui, 59:Destroy
gosub Q13
return

59ButtonConfirm:
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

run, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf
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
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 60:font, s10, Segoe UI
	Gui, 60:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 60:font, 
	Gui, 60:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 60:Add, Button, x168 y70 w80 h28 , No
	Gui, 60:Show, w267 h113, Warning!
	return
	
	60ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	60ButtonNo:
	Reload
	return
}

IfNotExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Dataset & Plpset\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Legacy Database\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Loyserv\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Promotions\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Sqlconn & Settings\
FileCreateDir, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\Store Reports\
sleep 2000
FileCopy, C:\AutoHotKey\Files\LOYSERV\Chempro\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 61:font, s10, Segoe UI
	Gui, 61:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 61:font, 
	Gui, 61:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 61:Add, Button, x168 y70 w80 h28 , No
	Gui, 61:Show, w267 h113, Complete!
	return
	
	61ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	61ButtonNo:
	Reload
	return
}
return