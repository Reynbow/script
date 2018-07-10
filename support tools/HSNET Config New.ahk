;-- Credit: The idea for this example from TheGood.  Thanks!
;   Post:   http://www.autohotkey.com/board/topic/52441-append-text-to-an-edit-control/

#NoEnv
#SingleInstance Force
ListLines Off

FileCreateDir, C:\INTPHARM\Inthelp\
FileInstall, C:\INTPHARM\Inthelp\intlogo.ico, C:\INTPHARM\Inthelp\intlogo.ico, 1
IfNotExist, C:\INTPHARM\DISPX\sitecode.txt
{
FileRead, STORE, C:\INTPHARM\POSX\PRG\sitecode.txt
}
Else FileRead, STORE, C:\INTPHARM\DISPX\sitecode.txt



;-- Build/Show GUI
Gui, -SysMenu -caption +Border
Gui, Color, 1d1f21, 383D46, 282a2e
Gui, Font, cc5c8c6, Segoe UI
gui Add,Edit,-E0x200 readonly hwndhEdit w420 r15
gui Font

SplitPath A_ScriptName,,,,$ScriptTitle
gui Show,,%$ScriptTitle%

;-- Launch text
FormatTime, TimeString, A_Now, dd/MM/yyyy - HH:mm:ss
Edit_SetText(hEdit, TimeString "`r`n--------------------------------------`r`nRunning HSNET Config`r`n--------------------------------------`r`n")

;-- Append stuff once per second
SetTimer Append,1
return


GUIClose:
GUIEscape:
ExitApp


Append:

;-- Position the caret to the last position + 1
Edit_SetSel(hEdit,Edit_GetTextLength(hEdit))

;-- Insert new line
Random RandomNumber,100000,999999
Edit_ReplaceSel(hEdit,A_Now . ": " . RandomNumber . "`r`n")
return


;*******************
;*                 *
;*    Functions    *
;*                 *
;*******************
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\support tools\Edit\_Functions\Edit.ahk
#include C:\Users\Aaron.Beecham\Documents\AutoHotkey\tools\source\gitstuff\script\support tools\Edit\_Functions\Fnt.ahk
