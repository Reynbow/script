;===Auto-execute========================================================================
ChartData =
(
Mike	24
Jenny	22
Steve	27
Marry	23
)


Gui, 1:Add, Picture, x5 y5 w250 h120 BackgroundTrans 0xE vBarChartPic	; create picture control which must have 0xE option
BarChart(ChartData, "BarChartPic")										; create and set BarChart to picture control

	/*; Extra feature for AHK_L users - you can use handle of the control
	Gui, 1:Add, Picture, x5 y5 w250 h120 BackgroundTrans 0xE hwndhPic
	BarChart(ChartData, "hwnd" hPic)
	*/

Gui 1:Show, w260 h130													; show Gui
return


;===Subroutines=========================================================================
GuiClose:
ExitApp


;===Functions===========================================================================
#Include %A_ScriptDir%\Gdip.ahk			; by Tic
#Include %A_ScriptDir%\BarChart.ahk		; by Learning one
