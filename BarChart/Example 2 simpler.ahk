;===Auto-execute========================================================================
AgeChart =
(
Mike	24
Steve	27
Chris	25

Jenny	22
Marry	23
)

SalaryChart =
(
Mike	900
Steve	700
Chris	1000

Jenny	1300
Marry	800
)

Skin := "ClassicBlue"

Loop, 50
	Text .= "some text "
Gui, 1: Font, q5 c666666
Gui, 1:Add, Text, x5 y200 w505 h70 Center, %Text%

Gui, 1:Add, Picture, x5 y5 w250 h190 BackgroundTrans 0xE vAgePic
Gui, 1:Add, Picture, x260 y5 w250 h190 BackgroundTrans 0xE vSalaryPic

pToken := Gdip_Startup()
BarChart(AgeChart, "AgePic", 1, "Age", Skin)
BarChart(SalaryChart, "SalaryPic", 1, "Salary", Skin, "ValuesSuffix: $")
Gdip_Shutdown(pToken)

Gui 1:Show, w515 h275, Employees
return


;===Subroutines=========================================================================
GuiClose:
ExitApp


;===Functions===========================================================================
#Include %A_ScriptDir%\Gdip.ahk			; by Tic
#Include %A_ScriptDir%\BarChart.ahk		; by Learning one