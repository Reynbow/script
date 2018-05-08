;===Auto-execute========================================================================
ChartData =
(
354
523
411
311
601
345
550
487
390
511
413
386
354
523
411
311
601
345
550
487
)

Gui, 1: Font, s12 q5 c666666
Gui, 1:Color, White
Gui, 1:Add, Picture, x5 y5 w505 h200 BackgroundTrans 0xE vPic
Gui, 1:Add, Text, x5 y210 w505 h25 Center, [improvisation] rotated BarChart = ColumnChart

pToken := Gdip_Startup()
pBitmap := BarChart(ChartData, 200, 505)
pRotatedBitmap := Gdip_RotateBitmap(pBitmap, -90) ; rotates bitmap for -90 degrees. Disposes of pBitmap.
SetBitmap2Pic(pRotatedBitmap,"Pic")
Gdip_DisposeImage(pRotatedBitmap)
Gdip_Shutdown(pToken)

Gui 1:Show, w515 h240, [improvisation] ColumnChart
return


;===Subroutines=========================================================================
GuiClose:
ExitApp


;===Functions===========================================================================
#Include %A_ScriptDir%\Gdip.ahk			; by Tic
#Include %A_ScriptDir%\BarChart.ahk		; by Learning one

SetBitmap2Pic(pBitmap,ControlID,GuiNum=1) {	; sets pBitmap to picture control (which must have 0xE option and should have BackgroundTrans option). By Learning one.
	GuiControlGet, hControl, %GuiNum%:hwnd, %ControlID%
	hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap), SetImage(hControl, hBitmap), DeleteObject(hBitmap)	
	GuiControl, %GuiNum%:MoveDraw, %ControlID%	; repaints the region of the GUI window occupied by the control
}

Gdip_RotateBitmap(pBitmap, Angle, Dispose=1) {	; returns rotated bitmap. By Learning one.
	Gdip_GetImageDimensions(pBitmap, Width, Height)
	Gdip_GetRotatedDimensions(Width, Height, Angle, RWidth, RHeight)
	Gdip_GetRotatedTranslation(Width, Height, Angle, xTranslation, yTranslation)
	
	pBitmap2 := Gdip_CreateBitmap(RWidth, RHeight)
	G2 := Gdip_GraphicsFromImage(pBitmap2), Gdip_SetSmoothingMode(G2, 4), Gdip_SetInterpolationMode(G2, 7)
	Gdip_TranslateWorldTransform(G2, xTranslation, yTranslation)
	Gdip_RotateWorldTransform(G2, Angle)
	Gdip_DrawImage(G2, pBitmap, 0, 0, Width, Height)
	
	Gdip_ResetWorldTransform(G2)
	Gdip_DeleteGraphics(G2)
	if Dispose
		Gdip_DisposeImage(pBitmap)
	return pBitmap2
}