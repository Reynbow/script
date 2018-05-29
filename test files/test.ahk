#NoEnv
Gui, Margin, 10, 10
GuiAddBorder("Black", 1, "x0 y0 w400 h200")
Gui, Add, Text, xp yp wp hp Center +0x0200 BackgroundTrans, Border Example ; 0x0200 centers single-line text vertically
Gui, Show, w400 h200 , Border Example
Return
GuiClose:
ExitApp
; ==================================================================================================================================
; Adds a border-like text control to the current default GUI
; ==================================================================================================================================
GuiAddBorder(Color, Width, PosAndSize) {
   ; -------------------------------------------------------------------------------------------------------------------------------
   ; Color        -  border color as used with the 'Gui, Color, ...' command, must be a "string"
   ; Width        -  the width of the border in pixels
   ; PosAndSize   -  a string defining the position and size like Gui commands, e.g. "xm ym w400 h200".
   ;                 You should not pass other control options!
   ; -------------------------------------------------------------------------------------------------------------------------------
   LFW := WinExist() ; save the last-found window, if any
   DefGui := A_DefaultGui ; save the current default GUI
   Gui, Add, Text, %PosAndSize% +hwndHTXT
   GuiControlGet, T, Pos, %HTXT%
   Gui, New, +Parent%HTXT% +LastFound -Caption ; create a unique child Gui for the text control
   Gui, Color, %Color%
   X1 := Width, X2 := TW - Width, Y1 := Width, Y2 := TH - Width
   WinSet, Region, 0-0 %TW%-0 %TW%-%TH% 0-%TH% 0-0   %X1%-%Y1% %X2%-%Y1% %X2%-%Y2% %X1%-%Y2% %X1%-%Y1%
   Gui, Show, x0 y0 w%TW% h%TH%
   Gui, %DefGui%:Default ; restore the default Gui
   If (LFW) ; restore the last-found window, if any
      WinExist(LFW)
}