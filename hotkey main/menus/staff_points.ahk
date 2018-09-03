WeekPoints:


Loop, 7{
    NUMM++
FileReadLine, Employee%NUMM%, G:\Support\Public Staff Folders\Aaron\Update\staff_points_list.txt, %NUMM%
}

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

IniRead, Employee1Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee1%\%fri%.ini, Count Points, Points, 0
IniRead, Employee2Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee2%\%fri%.ini, Count Points, Points, 0
IniRead, Employee3Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee3%\%fri%.ini, Count Points, Points, 0
IniRead, Employee4Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee4%\%fri%.ini, Count Points, Points, 0
IniRead, Employee5Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee5%\%fri%.ini, Count Points, Points, 0
IniRead, Employee6Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee6%\%fri%.ini, Count Points, Points, 0
IniRead, Employee7Fri, G:\Support\Public Staff Folders\Aaron\points\%Employee7%\%fri%.ini, Count Points, Points, 0

IniRead, Employee1Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee1%\%thur%.ini, Count Points, Points, 0
IniRead, Employee2Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee2%\%thur%.ini, Count Points, Points, 0
IniRead, Employee3Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee3%\%thur%.ini, Count Points, Points, 0
IniRead, Employee4Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee4%\%thur%.ini, Count Points, Points, 0
IniRead, Employee5Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee5%\%thur%.ini, Count Points, Points, 0
IniRead, Employee6Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee6%\%thur%.ini, Count Points, Points, 0
IniRead, Employee7Thu, G:\Support\Public Staff Folders\Aaron\points\%Employee7%\%thur%.ini, Count Points, Points, 0

IniRead, Employee1Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee1%\%wed%.ini, Count Points, Points, 0
IniRead, Employee2Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee2%\%wed%.ini, Count Points, Points, 0
IniRead, Employee3Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee3%\%wed%.ini, Count Points, Points, 0
IniRead, Employee4Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee4%\%wed%.ini, Count Points, Points, 0
IniRead, Employee5Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee5%\%wed%.ini, Count Points, Points, 0
IniRead, Employee6Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee6%\%wed%.ini, Count Points, Points, 0
IniRead, Employee7Wed, G:\Support\Public Staff Folders\Aaron\points\%Employee7%\%wed%.ini, Count Points, Points, 0

IniRead, Employee1Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee1%\%tue%.ini, Count Points, Points, 0
IniRead, Employee2Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee2%\%tue%.ini, Count Points, Points, 0
IniRead, Employee3Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee3%\%tue%.ini, Count Points, Points, 0
IniRead, Employee4Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee4%\%tue%.ini, Count Points, Points, 0
IniRead, Employee5Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee5%\%tue%.ini, Count Points, Points, 0
IniRead, Employee6Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee6%\%tue%.ini, Count Points, Points, 0
IniRead, Employee7Tue, G:\Support\Public Staff Folders\Aaron\points\%Employee7%\%tue%.ini, Count Points, Points, 0

IniRead, Employee1Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee1%\%mon%.ini, Count Points, Points, 0
IniRead, Employee2Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee2%\%mon%.ini, Count Points, Points, 0
IniRead, Employee3Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee3%\%mon%.ini, Count Points, Points, 0
IniRead, Employee4Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee4%\%mon%.ini, Count Points, Points, 0
IniRead, Employee5Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee5%\%mon%.ini, Count Points, Points, 0
IniRead, Employee6Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee6%\%mon%.ini, Count Points, Points, 0
IniRead, Employee7Mon, G:\Support\Public Staff Folders\Aaron\points\%Employee7%\%mon%.ini, Count Points, Points, 0

Employee1Total 		:= Employee1Fri + Employee1Thu + Employee1Wed + Employee1Tue + Employee1Mon
Employee2Total 	    := Employee2Fri + Employee2Thu + Employee2Wed + Employee2Tue + Employee2Mon
Employee3Total 		:= Employee3Fri + Employee3Thu + Employee3Wed + Employee3Tue + Employee3Mon
Employee4Total 		:= Employee4Fri + Employee4Thu + Employee4Wed + Employee4Tue + Employee4Mon
Employee5Total 		:= Employee5Fri + Employee5Thu + Employee5Wed + Employee5Tue + Employee5Mon
Employee6Total 	    := Employee6Fri + Employee6Thu + Employee6Wed + Employee6Tue + Employee6Mon
Employee7Total 		:= Employee7Fri + Employee7Thu + Employee7Wed + Employee7Tue + Employee7Mon

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

XL.Range("A2").Value := Employee1
XL.Range("A3").Value := Employee2
XL.Range("A4").Value := Employee3
XL.Range("A5").Value := Employee4
XL.Range("A6").Value := Employee5
XL.Range("A7").Value := Employee6
XL.Range("A8").Value := Employee7

XL.Range("B1").Value := Points
XL.Range("B2").Value := Employee1Total
XL.Range("B3").Value := Employee2Total
XL.Range("B4").Value := Employee3Total
XL.Range("B5").Value := Employee4Total
XL.Range("B6").Value := Employee5Total
XL.Range("B7").Value := Employee6Total
XL.Range("B8").Value := Employee7Total

XL.Range("A1:B8").Select
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
XL.ActiveSheet.Shapes("Chart 1").ScaleWidth(1.09,0,0)  ;Magnified at 130%... use ".8" for 80% above
XL.ActiveSheet.Shapes("Chart 1").ScaleHeight(1,0,0) ;;Magnified at 130%..

XL.Worksheets("Sheet1").ChartObjects(1).Chart.Export("C:\AutoHotKey\Files\pic1.bmp")

XL.ActiveWorkbook.Close(0)
XL.Quit

Data_Source=
(
 -%Employee1%-%Employee2%-%Employee3%-%Employee4%-%Employee5%-%Employee6%-%Employee7%
Monday-%Employee1Mon%-%Employee2Mon%-%Employee3Mon%-%Employee4Mon%-%Employee5Mon%-%Employee6Mon%-%Employee7Mon%
Tuesday-%Employee1Tue%-%Employee2Tue%-%Employee3Tue%-%Employee4Tue%-%Employee5Tue%-%Employee6Tue%-%Employee7Tue%
Wednesday-%Employee1Wed%-%Employee2Wed%-%Employee3Wed%-%Employee4Wed%-%Employee5Wed%-%Employee6Wed%-%Employee7Wed%
Thursday-%Employee1Thu%-%Employee2Thu%-%Employee3Thu%-%Employee4Thu%-%Employee5Thu%-%Employee6Thu%-%Employee7Thu%
Friday-%Employee1Fri%-%Employee2Fri%-%Employee3Fri%-%Employee4Fri%-%Employee5Fri%-%Employee6Fri%-%Employee7Fri%
 - - - - - - - -
TOTAL-%Employee1Total%-%Employee2Total%-%Employee3Total%-%Employee4Total%-%Employee5Total%-%Employee6Total%-%Employee7Total%
)	
; Call the function 
LV_Table(Data_Source)
return

LV_Table(Data_Source){
IfNotInString,Data_Source,-
	FileRead, Data_Source, %Data_Source% ;Assume path and read into variabl

;***********parse the data******************* 
obj := Object() ;holder for header and rows
loop,parse,Data_Source,`n,`r
{
if (A_Index=1) ;~ IfEqual, A_Index,1,SetEnv,HEADERS,%A_LoopField%   ;~ IfEqual, A_Index,1,continue
	RowHeader:=StrSplit(A_LoopField, "-") ;~ splice row into object

rowData:= StrSplit(A_LoopField, "-") ;~ splice row into object
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
	Gui, Add, ListView, x10 y10 w499 h163 grid hwndHLV , % count%rows% SubStr(strHeader,2) ;define LIstview and headers- Remove firs Pipe
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
	;LV_ModifyCol(9, 60)

	;LV_Colors.Row(HLV, A_Index, 0xFFECB0, 0x000000)

   	LV_Modify( LV_GetCount(), "Vis" )

   GuiControl, +Redraw, MyListView  ; Re-enable redrawing (it was disabled above).
Gui, +Border -MaximizeBox %OnTopSetting%
;Gui, Add, Button, x10 y185 w100 h25 gExport2Excel, Export to Excel
Gui, Color, 000000
Gui, Add, Button, x408 y395 w100 h25 gClose, Close

IniRead, Gui_Cord, C:\AutoHotKey\settings.ini, window position, gui_position
Cords := StrSplit(Gui_Cord, A_Space, "x" "y" A_Space)
XPOS := Cords[1]
YPOS := Cords[2]
XPOS100 := (XPOS + 460)
YPOS100 := (YPOS + 140)

Gui, MyListView:Show, x%XPOS100% y%YPOS100% w520 h430, POINT COUNTER
}
return