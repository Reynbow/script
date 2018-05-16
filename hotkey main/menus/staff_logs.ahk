#SingleInstance, Force

logviewer:
FormatTime, scripttime,, yyyyMM
FileRead, Data_Source, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt

LV_Table(Data_Source,"-") ; use comma as the delimiter

Return

;***********LV_Table Function******************* 
LV_Table(Data_Source, delimiter="`t",UseHeader=1,Title=""){
if FileExist(Data_Source) ;if file exists use it as source
	FileRead, Data_Source, %Data_Source% ;read in and store as variable

;***********parse the data in variable and store in object******************* 
data_obj := StrSplit(Data_Source,"`n","`r") ;parse earch row and store in object
rowHeader:=StrReplace(data_obj.RemoveAt(1),Delimiter,"|",Numb_Columns) ; Remove header from Object and convert to pipe delimited
if (useHeader=0){
	loop, % Numb_Columns+1
		RH.="Col_" A_Index "|"
	rowHeader:=RH
}

dCols:= (Numb_Columns<10) ? 400: ((Numb_Columns<80) ? 650 : 1100) ;if cols <10 use 400; if cols <80 use 650 ; else use 1100
dRows:= (data_obj.MaxIndex() >27) ? 26 : data_obj.MaxIndex() ;if rows >27 use 26 else use # of rows
Gui, Table_View: New,,%Title% ;create new gui window and set title
Gui, Add, ListView, w539 h600 grid, % rowHeader ;set headers

For Each, Row In data_obj ;add the data lines to the ListView
   LV_Add("", StrSplit(Row, Delimiter)*) ;LV_Add is a variadic function
    LV_ModifyCol(1, 70, "DATE")
    LV_ModifyCol(2, 68, "VERSION")
    LV_ModifyCol(3, 80, "SITECODE")
    LV_ModifyCol(4, 65, "TIME")
    LV_ModifyCol(5, 110, "STAFF MEMBER")
    LV_ModifyCol(6, 125, "TASK")
    LV_Modify( LV_GetCount(), "Vis" )
Gui, -SysMenu +Border -MaximizeBox
Gui, Color, 1d1f21
Gui, font, bold cE8EBF5 s9, Segoe UI
Gui, Add, Button, x10 y615 h30 w100 gRELOAD, RELOAD
Gui, Add, Button, x448 y615 h30 w100 gCLOSE, CLOSE
IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Gui, Table_View:Show, %Gui_Cord% h655, %A_Space%
Return

CLOSE:
ExitApp

RELOAD:
Reload
Return

}
return