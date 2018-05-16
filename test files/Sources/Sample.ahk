#SingleInstance, Force
#NoEnv
SetBatchLines, -1
#Include Class_ImageButton.ahk
; ----------------------------------------------------------------------------------------------------------------------
;Gui, DummyGUI:Add, Pic, hwndHPIC, PIC1.jpg
;SendMessage, 0x0173, 0, 0, , ahk_id %HPIC% ; STM_GETIMAGE
;HPIC1 := ErrorLevel
; ----------------------------------------------------------------------------------------------------------------------
; Button states:
; PBS_NORMAL    = 1
; PBS_HOT       = 2
; PBS_PRESSED   = 3
; PBS_DISABLED  = 4
; PBS_DEFAULTED = 5
; PBS_STYLUSHOT = 6 <- used only on tablet computers
; ----------------------------------------------------------------------------------------------------------------------
;GuiColor := "Blue"
Gui, Margin, 50, 20
Gui, Font, s10
;Gui, Color, %GuiColor%
;ImageButton.SetGuiColor(GuiColor)
; Unicolored button rounded by half of its height with different colors for states normal, hot and defaulted -----------
Gui, Add, Button, vBT1 w120 h30 hwndHBT1, KNOCKBACK
Opt1 := [0, 0xfb016d   ,       ,            ,   ,   , "BLACK" , 2]         ; normal flat background & text color
Opt2 := [ , "BLACK"    ,       , 0xfb016d   ,   ,   , 0xfb016d, 1]                                          ; hot flat background color
Opt5 := [ ,             ,       ,"AQUA"]                                      ; defaulted text color -> animation
If !ImageButton.Create(HBT1, Opt1, Opt2, , , Opt5)
   MsgBox, 0, ImageButton Error Btn1, % ImageButton.LastError
Gui, Show, x50 y50 , Image Buttons
Return
; ----------------------------------------------------------------------------------------------------------------------
GuiClose:
GuiEscape:
ExitApp
