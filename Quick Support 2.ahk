FileInstall, IntellipharmQS.exe, IntellipharmQS.exe, 1
WinGet, userTVPath, ProcessPath, ahk_exe teamviewer.exe
Process, Close, teamviewer.exe
Sleep, 2000
Run, %A_WorkingDir%/IntellipharmQS.exe
sleep 3600000
Process, Close, teamviewer.exe
Sleep, 2000
Run, % userTVPath
ExitApp