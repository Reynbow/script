    #NoEnv
    #SingleInstance Force

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
CraigTotal 	:= CraigFri + CraigThu + CraigWed + CraigTue + CraigMon
BrodieTotal 	:= BrodieFri + BrodieThu + BrodieWed + BrodieTue + BrodieMon
JimTotal 		:= JimFri + JimThu + JimWed + JimTue + JimMon
JoelTotal 		:= JoelFri + JoelThu + JoelWed + JoelTue + JoelMon
JoshTotal 		:= JoshFri + JoshThu + JoshWed + JoshTue + JoshMon
RenaeTotal 		:= RenaeFri + RenaeThu + RenaeWed + RenaeTue + RenaeMon
RickTotal 		:= RickFri + RickThu + RickWed + RickTue + RickMon

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
;XL.ActiveChart.ChartTitle.Text := "Column"

XL.ActiveSheet.ChartObjects("Chart 1").Activate
XL.ActiveSheet.Shapes("Chart 1").ScaleWidth(1,0,0)  ;Magnified at 130%... use ".8" for 80% above
XL.ActiveSheet.Shapes("Chart 1").ScaleHeight(0.8,0,0) ;;Magnified at 130%..

XL.Worksheets("Sheet1").ChartObjects(1).Chart.Export("C:\Users\Aaron.Beecham\Pictures\pic1.bmp")

XL.ActiveWorkbook.Close(0)
XL.Quit

Gui, Add, Picture, , C:\Users\Aaron.Beecham\Pictures\pic1.bmp
Gui, Show
return