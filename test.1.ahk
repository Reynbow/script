; L-system: http://en.wikipedia.org/wiki/L-system
#SingleInstance, Off
#NoEnv

Mem() ; include library

	setbatchlines -1
	process, priority, , high

	pToken := Gdip_Startup()
	OnExit, Cleanup

	;*** ;90deg Koch curve
	Koch90Iter  := 5
	Koch90Rules := "F>F+F-F-F+F"
	Koch90Start := "F"
	Koch90Cmds  := "F+-"
	Koch90Cmds2 := "draw 5,angle -90,angle +90"
	;*
	
	;*** ;Koch snowflake
	KochSnowFlakeIter  := 4
	KochSnowFlakeRules := "F>F-F++F-F"
	KochSnowFlakeStart := "F++F++F"
	KochSnowFlakeCmds  := "F+-"
	KochSnowFlakeCmds2 := "draw 5,angle -60,angle +60"
	;*

	;*** ;Sierpinski triangle
	SierpinskiIter  := 10
	SierpinskiRules := "A>B-A-B,B>A+B+A"
	SierpinskiStart := "A"
	SierpinskiCmds  := "AB+-"
	SierpinskiCmds2 := "draw 2,draw 2,angle -60,angle +60"
	;*

	;*** ;Dragon curve
	DragonCurveIter  := 15
	DragonCurveRules := "X>X+YF,Y>FX-Y"
	DragonCurveStart := "FX"
	DragonCurveCmds  := "F+-"
	DragonCurveCmds2 := "draw 3,angle -90,angle +90"
	;*

	;*** ;Penrose tiling
	PenroseP3Iter := 7
	PenroseP3Rules = 
	(LTrim Join,
		6 > 81++91----71[-81----61]++
		7 > +81--91[---61--71]+
		8 > -61++71[+++81++91]-
		9 > --81++++61[+91++++71]--71
		1 >
	)
	PenroseP3Start := "[7]++[7]++[7]++[7]++[7]"
	PenroseP3Cmds  := "1+-[]"
	PenroseP3Cmds2 := "draw 10,angle -36,angle +36,save,restore"
	;*

	;*** ;Fractal plant
	FractalPlantIter  := 7
	FractalPlantRules := "X>F-[[X]+X]+F[+FX]-X,F>FF"
	FractalPlantStart := "&X"
	FractalPlantCmds  := "F+-[]&"
	FractalPlantCmds2 := "draw 3,angle -25,angle +25,save,restore,angle -60"
	;*

	;*** ; triangles
	trianglesIter  := 7
	trianglesRules := "F>F+F-F"
	trianglesStart := "F-F-F"
	trianglesCmds  := "+-F"
	trianglesCmds2 := "angle -120,angle +120,draw 6" 
	;*

	;*** ; squares1
	squares1Iter  := 720
	squares1Rules := "A>A+B,B>2B"
	squares1Start := "A"
	squares1Cmds  := "12345+"
	squares1Cmds2 := "draw 1,draw 2,draw 3,draw 4,draw 5,angle +91"
	;*

	;*** ; squares2
	squares2Iter  := 90
	squares2Rules := "A>A+B,B>2B,2>21"
	squares2Start := "A"
	squares2Cmds  := "12345+"
	squares2Cmds2 := "draw .25,draw .5,draw .75,draw 1,draw 1.25,angle +91"
	;*

	; ----- choose the style from option below -----
	;	name = triangles
	;	name = KochSnowFlake
	;	name = Sierpinski
	;	name = DragonCurve
	;	name = PenroseP3
		name = FractalPlant
	;	name = triangles
	;	name = squares1
	;	name = squares2

	linecount := DispLSystem( %name%Iter, %name%Rules, %name%Start, %name%Cmds, %name%Cmds2, 0 )

	MsgBox % "Done!`nThere are " linecount " lines in this L-System.`nCreated in " errorlevel " seconds.`nThis is an average of " (linecount / errorlevel) " lines per second."
return

Esc::ExitApp

GuiClose:
Cleanup:
	Gdip_Shutdown(pToken)
	ExitApp

DispLSystem( iter, rules, start, names, commands, live = 0 ) {
	DllCall("QueryPerformanceFrequency", "int64*", qpcf), DllCall("QueryPerformanceCounter", "int64*", qpcs)
	
	turtle := LSystem( iter, rules, start )
	cnt := LSys2Lines( turtle, names, commands, lines, w, h )
	
	MakeLayeredWindow( hwnd, hdc, hbm, obm, gfx, w, h )
;	UpdateLayeredWindow(hwnd, hdc)
	DrawLinesToLayeredWindow( lines, cnt, hwnd, hdc, gfx, live )
	UpdateLayeredWindow(hwnd, hdc)
	CleanupLayeredWindow( hwnd, hdc, hbm, obm, gfx )
	
	DllCall("QueryPerformanceCounter", "int64*", qpce)
	return cnt, ErrorLevel := (qpce - qpcs) / qpcf
}

LSystem( cn, Vr, st ) {
;
; cn: iterations
; Vr: list of variables and their rules
;    (V>Result)[,...]
;    Where
;      V: Any single-character variable (must be valid as an AHK variable)
;          a-z 1-9 _ (case insensitive)
;      Result: The rule that this variable results in when replaced
;          [All characters except for comma] (must not start with a quote char: ")
;          OR
;          "[All characters]" (starts and ends with quote char. any literal quote chars inside must be duplicated)
; st : start string
;
; Any non-variable character is treated as a constant
; 
	it := 1
	while it := RegExMatch(Vr, "\s*(\w)\s*>\s*(?:(?!"")([^,]*)|""((?:[^""]|"""")*)"")\s*(?:,|$)", __, it + StrLen(__))
		%__1% := __2 RegExReplace(__3, """""", """"), Vl .= __1 ;parse Variables+Rules
	loop % cn
	{
		tp := "" st, st := ""
		loop, parse, tp
			st .= InStr(Vl, A_LoopField) ? %A_LoopField% : A_LoopField
	}
	return st
}
LSys2Lines( ls, chars, commands, byref lines, byref w, byref h ) { ;based on l-system
	l := 0
	, st%l%x := 0
	, st%l%y := 0
	, st%l%a := 0
	, i := 0
	lines_cap := VarSetCapacity(lines, strlen(ls) * 8)
	maxx := maxy := minx := miny := 0
	loop, parse, commands, `,, %A_Space%%A_Tab%
		cmd%A_Index% := A_LoopField
	loop, parse, ls
	{
		if !p := InStr(chars, A_LoopField)
			continue
		else if inStr(cmd%p%, "save")
			ol := l++
			, st%l%x := st%ol%x
			, st%l%y := st%ol%y
			, st%l%a := st%ol%a
		else if inStr(cmd%p%, "restore")
			l--
		else if inStr(cmd%p%, "angle")
			st%l%a += substr(cmd%p%, 6)
		else if inStr(cmd%p%, "draw")
		{
			d  := SubStr(cmd%p%, 5) + 0     ;distance (in pixels)
			AddLine( lines, i
				, Round(st%l%x)
				, Round(st%l%y)                           
				, Round(st%l%x += cos(st%l%a/57.2957795) * d)
				, Round(st%l%y += sin(st%l%a/57.2957795) * d) )
			, maxx := maxx > st%l%x ? maxx : st%l%x
			, maxy := maxy > st%l%y ? maxy : st%l%y
			, minx := minx < st%l%x ? minx : st%l%x
			, miny := miny < st%l%y ? miny : st%l%y
		}
	}
	xoff := round(abs(minx)) + 5
	yoff := round(abs(miny)) + 5
	w := round(maxx) + xoff + 5
	h := round(maxy) + yoff + 5
	
	OffsetPoints(lines, i, xoff, yoff)
	return i//4
}

AddLine( ByRef lines, ByRef i, x1, y1, x2, y2 ) {
	static lines_sz = 0
	if (i = 0 || lines_sz = 0)
		lines_sz := VarSetCapacity(lines)
	if (lines_sz < i * 4 + 16)
		MemPreAlloc(lines, lines_sz, i + 16), lines_sz := VarSetCapacity(lines) 
	  NumPut(x1, lines, 4 * i++, "int")
	, NumPut(y1, lines, 4 * i++, "int")
	, NumPut(x2, lines, 4 * i++, "int")
	, NumPut(y2, lines, 4 * i++, "int")
}

OffsetPoints( ByRef lines, cnt, xoff, yoff ) {
	i := 0
	while i < cnt
		NumPut(NumGet(lines, i * 4, "int") + (i & 1 ? yoff : xoff), lines, 4 * i++, "int")
}

DrawLinesToLayeredWindow( ByRef lines, cnt, hwnd, hdc, gfx, live = 0, color = 0xFF009900, lnw = 1 ) {
	cnt *= 4
	i := 0
	pPen := Gdip_CreatePen(color, 1)
	while i < cnt
	{
		Gdip_DrawLine(gfx, pPen
			, NumGet(lines, 4 * i++, "int")
			, NumGet(lines, 4 * i++, "int")
			, NumGet(lines, 4 * i++, "int")
			, NumGet(lines, 4 * i++, "int"))
	;	if live && !Mod(A_Index, live)
	;		UpdateLayeredWindow(hwnd, hdc)
	}
	Gdip_DeletePen(pPen)
}



; Display functions
MakeLayeredWindow( ByRef hwnd, ByRef hdc, ByRef hbm, ByRef obm, ByRef gfx, w, h, bg = 0xFFCCccCC, guiNum = 5 ) {
	w += 1, h += 1
	Gui, %guiNum%:+LastFound +AlwaysOnTop +Owner +E0x80000 -Caption
	Gui, %guiNum%:Show, w%w% h%h%
	OnMessage(0x201, "WM_LBUTTONDOWN")

	;gdi
	hwnd := WinExist()
	hdc  := CreateCompatibleDC()
	hbm  := CreateDIBSection(w, h) ;needs to be the same size as gui
	obm  := SelectObject(hdc, hbm)
	gfx  := Gdip_GraphicsFromHDC(hdc)

	;background
	pBr := Gdip_BrushCreateSolid(bg)
	Gdip_FillRoundedRectangle(gfx, pBr, 0, 0, w, h, 3)
	Gdip_DeleteBrush(pBr)
}
CleanupLayeredWindow( ByRef hwnd, ByRef hdc, ByRef hbm, ByRef obm, ByRef gfx ) {
	SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
	, Gdip_DeleteGraphics(gfx)
}
WM_LBUTTONDOWN() { ;for dragging the gui
		static mx, my, wx, wy, hwnd
		hwnd := WinExist()
		CoordMode, Mouse, Screen
		mousegetpos, mx, my
		WinGetPos, wx, wy
		settimer, GuiDrag, 10
	return

	GuiDrag:
		CoordMode, Mouse, Screen
		setwindelay, -1
		if !GetKeyState( "LButton", "P" )
			settimer, %A_ThisLabel%, Off
		else
		{
			MouseGetPos, nmx, nmy
			WinMove, ahk_id %hwnd%, , wx + (nmx - mx), wy + (nmy - my)
		}
	return
}


; CX( a, len ) { ;change in x for an angle and length
; 	return cos(a/57.2957795) * len
; }
; CY( a, len ) { ;change in y for an angle and length
; 	return sin(a/57.2957795) * len
; }

; memory functions
; by infogulch

;*** ; testing
;	text := "the quick brown fox jumps over the lazy dog"
;	a := " aaa "
;	VarSetCapacity(text2, StrLen(text), 0)
;	
;	MemMove(&text2, &text, StrLen(text)+1)
;	VarSetCapacity(text2, -1)
;	MsgBox % "_" text "_`n_" text2 "_"
;	
;	While 0 != p := MemChr(&text2, Asc( " " ), len:=StrLen(text2))
;		MemDel(text2, len, p-&text2, 1)
;	VarSetCapacity(text2, -1)
;	MsgBox % "_" text2 "_"
;	
;	MemAdd(text, StrLen(text), a, StrLen(a))
;	VarSetCapacity(text, -1)
;	MsgBox % "_" text "_"
;
;	MemIns(text, StrLen(text), a, StrLen(a), 4)
;	VarSetCapacity(text, -1)
;	MsgBox % "_" text "_"
;*   ;

Mem() {
}

MemDel( ByRef var, varlen, off, b = 1 ) {
	; may need to call VarSetCapacity(var, -1) afterwards for display
	MemMove( &var+off, &var+off+b, varlen-off)
}
MemIns( ByRef var, varlen, ByRef add, addlen, off ) {
	; may need to call VarSetCapacity(var, -1) afterwards for display
	len := varlen + addlen
	VarSetCapacity(tp, len, 0)       ; create tp
	MemMove( &tp, &var, off )        ; copy beginning of var to tp
	MemMove( &tp+off, &add, addlen ) ; copy add into tp at off
	MemMove( &tp+off+addlen, &var+off, varlen-off) ; copy remaining var to tp
	VarSetCapacity(var, len, 0)      ; resize var
	MemMove( &var, &tp, len )        ; copy finished tp back to var
}
MemAdd( ByRef var, varlen, ByRef add, addlen ) {
	; may need to call VarSetCapacity(var, -1) afterwards for display
	len := varlen + addlen
	VarSetCapacity(tp, len, 0)          ; setup tp var
	MemMove(&tp, &var, varlen)          ; copy var into tp
	MemMove(&tp + varlen, &add, addlen) ; copy add to end of tp
	VarSetCapacity(var, len, 0)         ; resize var
	MemMove(&var, &tp, len)             ; copy finished tp back to var
}

MemPreAlloc( ByRef var, len, add, fillbyte = 0 ) {
	VarSetCapacity(t, len+add, fillbyte)
	MemMove(&t, &var, len)
	VarSetCapacity(var, len+add, 0)
	MemMove(&var, &t, len+add)
}

MemChr( ptr, chr, len ) { ;finds chr from ptr through len (char as ascii value)
	; returns pointer
	return DllCall( "msvcrt\memchr", "UInt", ptr+0, "Int", chr & 0xFF, "Int", len, "Cdecl UInt")
}
MemMove( dest, src, len ) {
	; may need to call VarSetCapacity(var, -1) afterwards for display
	DllCall( "msvcrt\memmove", "UInt", dest+0, "UInt", src+0, "Int", len, "Cdecl int" )
}