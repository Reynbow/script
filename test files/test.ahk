; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force

global ClrFailure := "FF0033|FF0033"
global ClrWarning := "FFFF66|FFFF66"
global ClrOk      := "00CC33|00CC33"
global GuiW       := 500
global GuiH       := 400

; GUI ===========================================================================================================================

Gui, +LastFound +hwndhMain
Gui, Margin, 0, 0

Gui, Add, Pic, % "xm ym+" GuiH-4 " w" GuiW " h4 0x4E hwndHPIC1"
CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)

Gui, Show, w%GuiW% h%GuiH%, % "GUI Concept"

SetTimer, ChangeBorder
return

ChangeBorder:
	CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)
	sleep 1000
	CreateDIB(HPIC1, ClrWarning, 1, 1, 5, 5)
	sleep 1000
	CreateDIB(HPIC1, ClrFailure, 1, 1, 5, 5)
	sleep 1000
	CreateDIB(HPIC1, ClrWarning, 1, 1, 5, 5)
	sleep 1000
	CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)
return

; FUNCTIONS =====================================================================================================================

CreateDIB(hWnd, PixelData, W, H, ResizeW := 0, ResizeH := 0, Gradient := 1) ; by SKAN | modified by jNizM (SendMessage included & added DeletObject)
{
    WB := Ceil((W * 3) / 2) * 2, VarSetCapacity(BMBITS, WB * H + 1, 0), P := &BMBITS
    loop, parse, PixelData, |
        P := Numput("0x" A_LoopField, P+0, 0, "UInt") - (W & 1 && Mod(A_Index * 3, W * 3) = 0 ? 0 : 1)

    hBitmap := DllCall("gdi32.dll\CreateBitmap", "Int", W, "Int", H, "UInt", 1, "UInt", 24, "Ptr", 0, "Ptr")
    hBM := DllCall("user32.dll\CopyImage", "Ptr", hBitmap, "UInt", 0, "Int", 0, "Int", 0, "UInt", 0x2008, "Ptr")
    DllCall("gdi32.dll\SetBitmapBits", "Ptr", hBM, "UInt", WB * H, "Ptr", &BMBITS)

    if !(Gradient + 0)
        hBM := DllCall("user32.dll\CopyImage", "Ptr", hBM, "UInt", 0, "Int", 0, "Int", 0, "UInt", 0x0008, "Ptr")
    hBM := DllCall("user32.dll\CopyImage", "Ptr", hBM, "Int", 0, "Int", ResizeW, "Int", ResizeH, "Int", 0x200C, "Ptr")

    DllCall("user32.dll\SendMessage", "Ptr", hWnd, "UInt", 0x0172, "Ptr", 0, "Ptr", hBM, "Ptr")
    return True, DllCall("gdi32.dll\DeleteObject", "Ptr", hBitmap)
}