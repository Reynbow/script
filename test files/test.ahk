Gui Add, Picture, HwndMyImageHwnd w100 h-1, H:\User\My Pictures\Test.GIF
Gui Show

OnMessage(0x201, "ImgClic")

ImgClic(wParam, lParam, msg, hwnd) {
global MyImageHwnd
If (hwnd := MyImageHwnd)
	Msgbox Congrats you made a clickable image in 2sec !
}