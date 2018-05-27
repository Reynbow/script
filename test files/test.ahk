#SingleInstance, force
SetFormat, float, 0

    Gui, Margin, 16, 16
    Gui, Color, 1d1f21, 383D46, 282a2e
    ;Gui, -SysMenu -caption +Border +AlwaysOnTop
    Gui, Font, s11 cWhite, Segoe UI
	Gui, Add, Text, xm cc5c8c6 -E0x200 , ARMOUR
    Gui, Add, Edit, xp+110 w50 h20 cc5c8c6 -E0x200 vAR
	Gui, Add, Text, xm cc5c8c6 -E0x200 , MAGIC RESIST
    Gui, Add, Edit, xp+110 w50 h20 cc5c8c6 -E0x200 vMR
	Gui, Add, Text, xm cc5c8c6 -E0x200 , HEALTH
	Gui, Add, Text, xp+110 w50 vPreview, 
	Gui, Add, Button, xm w160 h25 cc5c8c6 -E0x200, Exit
    Gui, Show, x150 y150, HP CALC

loop
{
    Gui, Submit, NoHide

	if (!AR)
		{
			AR = AR
		}

	if (!MR)
		{
			MR = MR
		}

	HP := 1400 + 14 * (0.25 * AR + 0.75 * MR)

    msgText = %HP%

    if NOT (msgText == oldMsgText)
    {
       GuiControl, Text, Preview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

Return

ButtonExit:
ExitApp

F10::
Reload
Return
