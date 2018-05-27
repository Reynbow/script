﻿WeekPoints:
FormatTime, Day,, dddd

If Day = Friday
    {
    fri = %a_now%
    FormatTime, fri, %fri%, yyyyMMdd

    thur = %a_now%
    thur += -1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -2, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -3, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -4, days
    FormatTime, mon, %mon%, yyyyMMdd
    }


If Day = Thursday
    {

    fri = %a_now%
    fri += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -1, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -2, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -3, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Wednesday
    {

    fri = %a_now%
    fri += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -1, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -2, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Tuesday
    {

    fri = %a_now%
    fri += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    tue = %a_now%
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -1, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Monday
    {

    fri = %a_now%
    fri += +4, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	tue = %a_now%
    tue += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    mon = %a_now%
    FormatTime, mon, %mon%, yyyyMMdd
    }

IniRead, AaronFri, G:\Support\Public Staff Folders\Aaron\points\Aaron\%fri%.ini, Count Points, Points, 0
IniRead, CraigFri, G:\Support\Public Staff Folders\Aaron\points\Craig\%fri%.ini, Count Points, Points, 0
IniRead, BrodieFri, G:\Support\Public Staff Folders\Aaron\points\Brodie\%fri%.ini, Count Points, Points, 0
IniRead, JimFri, G:\Support\Public Staff Folders\Aaron\points\James\%fri%.ini, Count Points, Points, 0
IniRead, JoelFri, G:\Support\Public Staff Folders\Aaron\points\Joel\%fri%.ini, Count Points, Points, 0
IniRead, JoshFri, G:\Support\Public Staff Folders\Aaron\points\Josh\%fri%.ini, Count Points, Points, 0
IniRead, RenaeFri, G:\Support\Public Staff Folders\Aaron\points\Renae\%fri%.ini, Count Points, Points, 0
IniRead, RickFri, G:\Support\Public Staff Folders\Aaron\points\Rick\%fri%.ini, Count Points, Points, 0

IniRead, AaronThu, G:\Support\Public Staff Folders\Aaron\points\Aaron\%thur%.ini, Count Points, Points, 0
IniRead, CraigThu, G:\Support\Public Staff Folders\Aaron\points\Craig\%thur%.ini, Count Points, Points, 0
IniRead, BrodieThu, G:\Support\Public Staff Folders\Aaron\points\Brodie\%thur%.ini, Count Points, Points, 0
IniRead, JimThu, G:\Support\Public Staff Folders\Aaron\points\James\%thur%.ini, Count Points, Points, 0
IniRead, JoelThu, G:\Support\Public Staff Folders\Aaron\points\Joel\%thur%.ini, Count Points, Points, 0
IniRead, JoshThu, G:\Support\Public Staff Folders\Aaron\points\Josh\%thur%.ini, Count Points, Points, 0
IniRead, RenaeThu, G:\Support\Public Staff Folders\Aaron\points\Renae\%thur%.ini, Count Points, Points, 0
IniRead, RickThu, G:\Support\Public Staff Folders\Aaron\points\Rick\%thur%.ini, Count Points, Points, 0

IniRead, AaronWed, G:\Support\Public Staff Folders\Aaron\points\Aaron\%wed%.ini, Count Points, Points, 0
IniRead, CraigWed, G:\Support\Public Staff Folders\Aaron\points\Craig\%wed%.ini, Count Points, Points, 0
IniRead, BrodieWed, G:\Support\Public Staff Folders\Aaron\points\Brodie\%wed%.ini, Count Points, Points, 0
IniRead, JimWed, G:\Support\Public Staff Folders\Aaron\points\James\%wed%.ini, Count Points, Points, 0
IniRead, JoelWed, G:\Support\Public Staff Folders\Aaron\points\Joel\%wed%.ini, Count Points, Points, 0
IniRead, JoshWed, G:\Support\Public Staff Folders\Aaron\points\Josh\%wed%.ini, Count Points, Points, 0
IniRead, RenaeWed, G:\Support\Public Staff Folders\Aaron\points\Renae\%wed%.ini, Count Points, Points, 0
IniRead, RickWed, G:\Support\Public Staff Folders\Aaron\points\Rick\%wed%.ini, Count Points, Points, 0

IniRead, AaronTue, G:\Support\Public Staff Folders\Aaron\points\Aaron\%tue%.ini, Count Points, Points, 0
IniRead, CraigTue, G:\Support\Public Staff Folders\Aaron\points\Craig\%tue%.ini, Count Points, Points, 0
IniRead, BrodieTue, G:\Support\Public Staff Folders\Aaron\points\Brodie\%tue%.ini, Count Points, Points, 0
IniRead, JimTue, G:\Support\Public Staff Folders\Aaron\points\James\%tue%.ini, Count Points, Points, 0
IniRead, JoelTue, G:\Support\Public Staff Folders\Aaron\points\Joel\%tue%.ini, Count Points, Points, 0
IniRead, JoshTue, G:\Support\Public Staff Folders\Aaron\points\Josh\%tue%.ini, Count Points, Points, 0
IniRead, RenaeTue, G:\Support\Public Staff Folders\Aaron\points\Renae\%tue%.ini, Count Points, Points, 0
IniRead, RickTue, G:\Support\Public Staff Folders\Aaron\points\Rick\%tue%.ini, Count Points, Points, 0

IniRead, AaronMon, G:\Support\Public Staff Folders\Aaron\points\Aaron\%mon%.ini, Count Points, Points, 0
IniRead, CraigMon, G:\Support\Public Staff Folders\Aaron\points\Craig\%mon%.ini, Count Points, Points, 0
IniRead, BrodieMon, G:\Support\Public Staff Folders\Aaron\points\Brodie\%mon%.ini, Count Points, Points, 0
IniRead, JimMon, G:\Support\Public Staff Folders\Aaron\points\James\%mon%.ini, Count Points, Points, 0
IniRead, JoelMon, G:\Support\Public Staff Folders\Aaron\points\Joel\%mon%.ini, Count Points, Points, 0
IniRead, JoshMon, G:\Support\Public Staff Folders\Aaron\points\Josh\%mon%.ini, Count Points, Points, 0
IniRead, RenaeMon, G:\Support\Public Staff Folders\Aaron\points\Renae\%mon%.ini, Count Points, Points, 0
IniRead, RickMon, G:\Support\Public Staff Folders\Aaron\points\Rick\%mon%.ini, Count Points, Points, 0

AaronTotal 		:= AaronFri + AaronThu + AaronWed + AaronTue + AaronMon
CraigTotal 		:= CraigFri + CraigThu + CraigWed + CraigTue + CraigMon
BrodieTotal 	:= BrodieFri + BrodieThu + BrodieWed + BrodieTue + BrodieMon
JimTotal 		:= JimFri + JimThu + JimWed + JimTue + JimMon
JoelTotal 		:= JoelFri + JoelThu + JoelWed + JoelTue + JoelMon
JoshTotal 		:= JoshFri + JoshThu + JoshWed + JoshTue + JoshMon
RenaeTotal 		:= RenaeFri + RenaeThu + RenaeWed + RenaeTue + RenaeMon
RickTotal 		:= RickFri + RickThu + RickWed + RickTue + RickMon

NiceMon = %a_now%
NiceMon += -4, days
FormatTime, NiceMon, %NiceMon%, dd/MM/yyyy
NiceTue = %a_now%
NiceTue += -3, days
FormatTime, NiceTue, %NiceTue%, dd/MM/yyyy
NiceWed = %a_now%
NiceWed += -2, days
FormatTime, NiceWed, %NiceWed%, dd/MM/yyyy
NiceThu = %a_now%
NiceThu += -1, days
FormatTime, NiceThu, %NiceThu%, dd/MM/yyyy
FormatTime, NiceFri, %NiceFri%, dd/MM/yyyy


XL := ComObjCreate("Excel.Application")
XL.WorkBooks.Add

XL.Range("A2").Value := "Aaron"
XL.Range("A3").Value := "Craig"
XL.Range("A4").Value := "Brodie"
XL.Range("A5").Value := "Jim"
XL.Range("A6").Value := "Joel"
XL.Range("A7").Value := "Josh"
XL.Range("A8").Value := "Renae"
XL.Range("A9").Value := "Rick"

XL.Range("B1").Value := Points
XL.Range("B2").Value := AaronTotal
XL.Range("B3").Value := CraigTotal
XL.Range("B4").Value := BrodieTotal
XL.Range("B5").Value := JimTotal
XL.Range("B6").Value := JoelTotal
XL.Range("B7").Value := JoshTotal
XL.Range("B8").Value := RenaeTotal
XL.Range("B9").Value := RickTotal

XL.Range("A1:B9").Select
XL.ActiveSheet.Shapes.AddChart.Select
XL.ActiveChart.ChartType := 51
XL.ActiveChart.ClearToMatchStyle
XL.ActiveChart.ChartStyle := 44
XL.ActiveChart.ClearToMatchStyle

XL.ActiveSheet.ChartObjects("Chart 1").Activate
XL.ActiveChart.SetElement(102)
XL.ActiveChart.SetElement(2)
XL.ActiveChart.ChartTitle.Text := "CURRENT WEEK TOTALS"

XL.ActiveSheet.ChartObjects("Chart 1").Activate
XL.ActiveSheet.Shapes("Chart 1").ScaleWidth(1.21,0,0)  ;Magnified at 130%... use ".8" for 80% above
XL.ActiveSheet.Shapes("Chart 1").ScaleHeight(1,0,0) ;;Magnified at 130%..

XL.Worksheets("Sheet1").ChartObjects(1).Chart.Export("C:\AutoHotKey\Files\pic1.bmp")

XL.ActiveWorkbook.Close(0)
XL.Quit

Data_Source=
(
-	Aaron	Craig	Brodie	James	Joel	Josh	Renae	Rick	
Monday	%AaronMon%	%CraigMon%	%BrodieMon%	%JimMon%	%JoelMon%	%JoshMon%	%RenaeMon%	%RickMon%
Tuesday	%AaronTue%	%CraigTue%	%BrodieTue%	%JimTue%	%JoelTue%	%JoshTue%	%RenaeTue%	%RickTue%
Wednesday	%AaronWed%	%CraigWed%	%BrodieWed%	%JimWed%	%JoelWed%	%JoshWed%	%RenaeWed%	%RickWed%
Thursday	%AaronThu%	%CraigThu%	%BrodieThu%	%JimThu%	%JoelThu%	%JoshThu%	%RenaeThu%	%RickThu%
Friday	%AaronFri%	%CraigFri%	%BrodieFri%	%JimFri%	%JoelFri%	%JoshFri%	%RenaeFri%	%RickFri%
%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%	%A_Space%
TOTAL	%AaronTotal%	%CraigTotal%	%BrodieTotal%	%JimTotal%	%JoelTotal%	%JoshTotal%	%RenaeTotal%	%RickTotal%
)	
; Call the function 
LV_Table(Data_Source)
return

LV_Table(Data_Source){
IfNotInString,Data_Source,%A_tab%
	FileRead, Data_Source, %Data_Source% ;Assume path and read into variabl

;***********parse the data******************* 
obj := Object() ;holder for header and rows
loop,parse,Data_Source,`n,`r
{
if (A_Index=1) ;~ IfEqual, A_Index,1,SetEnv,HEADERS,%A_LoopField%   ;~ IfEqual, A_Index,1,continue
	RowHeader:=StrSplit(A_LoopField, A_tab) ;~ splice row into object

rowData:= StrSplit(A_LoopField, A_tab) ;~ splice row into object
obj.Insert(rowData)
maxrows:=A_Index ;
}

dRows:=35 , dCols:=800 ;Set minimum display size for columns and rows
Gui, MyListView: New,,%Data_Source%
Gui, MyListView:Add, Picture, x0 y100, C:\AutoHotKey\Files\pic1.bmp
GuiControl, -Redraw, MyListView  ; Improve performance by disabling redrawing during load. 
	for k,v in obj ;iterate over object
		if (k=1){
			for k1,v1 in obj.1
				strHeader .=  "|" obj.1[k1] ;extract header to concatenated piped list
			dRows:=obj.MaxIndex()
		IfGreaterOrEqual, dRows,25,SetEnv,dRows,26 ;reset display rows if below 26
		IfLessOrEqual, k1,90,SetEnv,dCols,650 ;reset display columns if 
		IfLessOrEqual, k1,10,SetEnv,dCols,400 ;reset display columns if 
	rows:=obj.MaxIndex() ;this might help draw faster
	Gui, Add, ListView, x10 y10 w559 h163 grid hwndHLV , % count%rows% SubStr(strHeader,2) ;define LIstview and headers- Remove firs Pipe
   }  ;end of header section

   Else LV_Add("", Obj[k]*) ;add data rows- LV_Add is a variadic function
   
    LV_ModifyCol(1, 75, "")
    LV_ModifyCol(2, 60)
    LV_ModifyCol(3, 60)
    LV_ModifyCol(4, 60)
    LV_ModifyCol(5, 60)
    LV_ModifyCol(6, 60)
	LV_ModifyCol(7, 60)
	LV_ModifyCol(8, 60)
	LV_ModifyCol(9, 60)

	;LV_Colors.Row(HLV, A_Index, 0xFFECB0, 0x000000)

   	LV_Modify( LV_GetCount(), "Vis" )

   GuiControl, +Redraw, MyListView  ; Re-enable redrawing (it was disabled above).
Gui, +Border -MaximizeBox
;Gui, Add, Button, x10 y185 w100 h25 gExport2Excel, Export to Excel
Gui, Color, 000000
Gui, Add, Button, x468 y395 w100 h25 gClose, Close

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Cords := StrSplit(Gui_Cord, A_Space, "x" "y" A_Space)
XPOS := Cords[1]
YPOS := Cords[2]
XPOS100 := (XPOS + 100)
YPOS100 := (YPOS + 225)

Gui, MyListView:Show, x%XPOS100% y%YPOS100% w580 h430, POINT COUNTER
}
return