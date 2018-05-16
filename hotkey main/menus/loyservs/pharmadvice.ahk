pharmadvice:
Gui, Destroy

IfNotExist, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
	{
	FileCreateDir, C:\AutoHotKey\Files\LOYSERV\Chemmart\
	FileCopy, G:\Loyalty\Loyalty Software & Support\V3 INSTALL\LOYSERV Blank\Pharmacist Advice\loyserv.dbf,  C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
	}

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
list1 = ACN|ALPH|AM|APIB|APIP|APOT|GENP|IMSC|INT|IPSS|LOYL|PCYU|PH|SIG|TWAP
Gui, 80:font, s12 bold, Segoe UI
Gui, 80:Add, Text, center x0 y14 h30 w286 , Pharmacist Advice
Gui, 80:font,
Gui, 80:Add, Text, x28 y66 w80 h20 , Site Code Prefix
Gui, 80:Add, DropDownList, x152 y64 w110 vChoiceCHEM, %list1%
Gui, 80:Add, Text, x28 y96 w80 h20 , Site Code
Gui, 80:Add, Edit, x152 y94 w110 h20 vBox1,
Gui, 80:Add, Text, x28 y126 w80 h20 , Store Name
Gui, 80:Add, Edit, x152 y124 w110 h20 vBox2, 
Gui, 80:Add, Text, x28 y156 w80 h20 , Username
Gui, 80:Add, Edit, x152 y154 w110 h20 vBox3,
Gui, 80:Add, Text, x28 y186 w80 h20 , Password
Gui, 80:Add, Edit, x152 y184 w110 h20 vBox4, 
Gui, 80:Add, Button, x18 y228 w78 h30 , Confirm
Gui, 80:Add, Button, x102 y228 w78 h30 , Back
Gui, 80:Add, Button, x185 y228 w78 h30 , Exit
Gui, 80:Show, %Gui_Cord% w286 h278, 
return


80ButtonExit:
Reload
return

80ButtonBack:
Gui, 72:Destroy
gosub Q13
return

80ButtonConfirm:
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

run, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf
WinWaitActive, ahk_exe vfp9.exe
sleep 500
sleep 500
SendInput, {TAB 2}
SendRaw, %Box3%
SendInput,{TAB}
SendRaw,%Box4%
Sendinput,{TAB}
sleep 250
sleep 250
SendInput,{ALT}fx
sleep 200
IfExist, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\loyserv.dbf
{
	Gui, Destroy
	Gui, 81:font, s10, Segoe UI
	Gui, 81:Add, Text, x24 y22 w240 h40 , File already exists!`nWould you like to open target folder?
	Gui, 81:font, 
	Gui, 81:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 81:Add, Button, x168 y70 w80 h28 , No
	Gui, 81:Show, w267 h113, Warning!
	return
	
	81ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	81ButtonNo:
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
FileCopy, C:\AutoHotKey\Files\LOYSERV\Pharmacist Advice\loyserv.dbf, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
sleep 2000

	Gui, Destroy
	Gui, 82:font, s10, Segoe UI
	Gui, 82:Add, Text, x24 y22 w240 h40 , File created successfully!`nWould you like to open target folder?
	Gui, 82:font, 
	Gui, 82:Add, Button, x78 y70 w80 h28 , Yes
	Gui, 82:Add, Button, x168 y70 w80 h28 , No
	Gui, 82:Show, w267 h113, Complete!
	return
	
	82ButtonYes:
	run, G:\Loyalty\All Stores\%ChoiceCHEM%\%Box1% - %Box2%\loyserv\
	Reload
	return
	
	82ButtonNo:
	Reload
	return
}
return