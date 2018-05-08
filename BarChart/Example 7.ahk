;===Auto-execute========================================================================
ChartData =
(
Moscow - Berlin	4032
Madrid - Paris	5340
London - Oslo	5131
Zagreb - Sarajevo	3043
Dubrovnik - Rome	4402
Split - Ljubljana	2543
)

Gui, 1:Add, Picture, x5 y5 w380 h210 BackgroundTrans 0xE vBarChartPic
BarChart(ChartData, "BarChartPic", 1,"","OutlinesWhite", "BarTextColor:ff000011, BarColorHeightDiv:20, ChartBackColorA:0, ChartBackColorB:0, BarColorA:ccffffff, BarColorB:ffffffff, BarHeightFactor:1.8, BackgroundImage:" A_ScriptDir "\DarkSky.jpg")
Gui 1:Show, w390 h220, With background image
return


;===Subroutines=========================================================================
GuiClose:
ExitApp

;===Functions===========================================================================
#Include %A_ScriptDir%\Gdip.ahk			; by Tic
#Include %A_ScriptDir%\BarChart.ahk		; by Learning one
