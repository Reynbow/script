SplashTextOn, , , Displays only a title bar.
Sleep, 2000
SplashTextOn, 400, 300, Clipboard, The clipboard contains:`n%clipboard%
WinMove, Clipboard, , 0, 0  ; Move the splash window to the top left corner.
MsgBox, Press OK to dismiss the SplashText
SplashTextOff