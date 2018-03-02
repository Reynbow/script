if not A_IsAdmin
{
	try
	{
		Run *RunAs "%A_ScriptFullPath%"
	}
	ExitApp
}

; Open system properties to tab 3 - "Advanced"
$sys_advanced = sysdm.cpl,,3
Run control %$sys_advanced%
WinWaitActive, System Properties

; Click Settings
ControlClick, Button2
WinWaitActive, Performance Options

; Click Adjust for Best Performance
ControlClick, Button3
WinWaitActive, Performance Options

; Click OK
ControlClick, Button5
WinWaitActive, System Properties

; Click OK Agian
ControlClick, Button8

; Done