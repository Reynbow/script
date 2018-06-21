
#SingleInstance, Force
;------------------------------------------------------------------------------
; Acc.ahk Standard Library
; by Sean
; Updated by jethrow:
; 	Modified ComObjEnwrap params from (9,pacc) --> (9,pacc,1)
; 	Changed ComObjUnwrap to ComObjValue in order to avoid AddRef (thanks fincs)
; 	Added Acc_GetRoleText & Acc_GetStateText
; 	Added additional functions - commented below
; 	Removed original Acc_Children function
; last updated 2/25/2010  ;  tweaked by Joe Glines
;------------------------------------------------------------------------------

Acc_Init()
{
	Static	h
	If Not	h
		h:=DllCall("LoadLibrary","Str","oleacc","Ptr")
}
Acc_ObjectFromEvent(ByRef _idChild_, hWnd, idObject, idChild)
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromEvent", "Ptr", hWnd, "UInt", idObject, "UInt", idChild, "Ptr*", pacc, "Ptr", VarSetCapacity(varChild,8+2*A_PtrSize,0)*0+&varChild)=0
	Return	ComObjEnwrap(9,pacc,1), _idChild_:=NumGet(varChild,8,"UInt")
}

Acc_ObjectFromPoint(ByRef _idChild_ = "", x = "", y = "")
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromPoint", "Int64", x==""||y==""?0*DllCall("GetCursorPos","Int64*",pt)+pt:x&0xFFFFFFFF|y<<32, "Ptr*", pacc, "Ptr", VarSetCapacity(varChild,8+2*A_PtrSize,0)*0+&varChild)=0
	Return	ComObjEnwrap(9,pacc,1), _idChild_:=NumGet(varChild,8,"UInt")
}

Acc_ObjectFromWindow(hWnd, idObject = -4)
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
	Return	ComObjEnwrap(9,pacc,1)
}

Acc_WindowFromObject(pacc)
{
	If	DllCall("oleacc\WindowFromAccessibleObject", "Ptr", IsObject(pacc)?ComObjValue(pacc):pacc, "Ptr*", hWnd)=0
	Return	hWnd
}

Acc_GetRoleText(nRole)
{
	nSize := DllCall("oleacc\GetRoleText", "Uint", nRole, "Ptr", 0, "Uint", 0)
	VarSetCapacity(sRole, (A_IsUnicode?2:1)*nSize)
	DllCall("oleacc\GetRoleText", "Uint", nRole, "str", sRole, "Uint", nSize+1)
	Return	sRole
}

Acc_GetStateText(nState)
{
	nSize := DllCall("oleacc\GetStateText", "Uint", nState, "Ptr", 0, "Uint", 0)
	VarSetCapacity(sState, (A_IsUnicode?2:1)*nSize)
	DllCall("oleacc\GetStateText", "Uint", nState, "str", sState, "Uint", nSize+1)
	Return	sState
}

Acc_SetWinEventHook(eventMin, eventMax, pCallback)
{
	Return	DllCall("SetWinEventHook", "Uint", eventMin, "Uint", eventMax, "Uint", 0, "Ptr", pCallback, "Uint", 0, "Uint", 0, "Uint", 0)
}

Acc_UnhookWinEvent(hHook)
{
	Return	DllCall("UnhookWinEvent", "Ptr", hHook)
}
/*	Win Events:

	pCallback := RegisterCallback("WinEventProc")
	WinEventProc(hHook, event, hWnd, idObject, idChild, eventThread, eventTime)
	{
		Critical
		Acc := Acc_ObjectFromEvent(_idChild_, hWnd, idObject, idChild)
		; Code Here:

	}
*/

; Written by jethrow
Acc_Role(Acc, ChildId=0) {
	try return ComObjType(Acc,"Name")="IAccessible"?Acc_GetRoleText(Acc.accRole(ChildId)):"invalid object"
}
Acc_State(Acc, ChildId=0) {
	try return ComObjType(Acc,"Name")="IAccessible"?Acc_GetStateText(Acc.accState(ChildId)):"invalid object"
}
Acc_Location(Acc, ChildId=0, byref Position="") { ; adapted from Sean's code
	try Acc.accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
	catch
		return
	Position := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
	return	{x:NumGet(x,0,"int"), y:NumGet(y,0,"int"), w:NumGet(w,0,"int"), h:NumGet(h,0,"int")}
}
Acc_Parent(Acc) {
	try parent:=Acc.accParent
	return parent?Acc_Query(parent):
}
Acc_Child(Acc, ChildId=0) {
	try child:=Acc.accChild(ChildId)
	return child?Acc_Query(child):
}
Acc_Query(Acc) { ; thanks Lexikos - www.autohotkey.com/forum/viewtopic.php?t=81731&p=509530#509530
	try return ComObj(9, ComObjQuery(Acc,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
Acc_Error(p="") {
	static setting:=0
	return p=""?setting:setting:=p
}
Acc_Children(Acc) {
	if ComObjType(Acc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren%
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?Acc_Query(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
			return Children.MaxIndex()?Children:
		} else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Acc_ChildrenByRole(Acc, Role) {
	if ComObjType(Acc,"Name")!="IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren% {
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i)
				if NumGet(varChildren,i-8)=9
					AccChild:=Acc_Query(child), ObjRelease(child), Acc_Role(AccChild)=Role?Children.Insert(AccChild):
				else
					Acc_Role(Acc, child)=Role?Children.Insert(child):
			}
			return Children.MaxIndex()?Children:, ErrorLevel:=0
		} else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Acc_Get(Cmd, ChildPath="", ChildID=0, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="") {
	static properties := {Action:"DefaultAction", DoAction:"DoDefaultAction", Keyboard:"KeyboardShortcut"}
	AccObj :=   IsObject(WinTitle)? WinTitle
			:   Acc_ObjectFromWindow( WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText), 0 )
	if ComObjType(AccObj, "Name") != "IAccessible"
		ErrorLevel := "Could not access an IAccessible Object"
	else {
		StringReplace, ChildPath, ChildPath, _, %A_Space%, All
		AccError:=Acc_Error(), Acc_Error(true)
		Loop Parse, ChildPath, ., %A_Space%
			try {
				if A_LoopField is digit
					Children:=Acc_Children(AccObj), m2:=A_LoopField ; mimic "m2" output in else-statement
				else
					RegExMatch(A_LoopField, "(\D*)(\d*)", m), Children:=Acc_ChildrenByRole(AccObj, m1), m2:=(m2?m2:1)
				if Not Children.HasKey(m2)
					throw
				AccObj := Children[m2]
			} catch {
				ErrorLevel:="Cannot access ChildPath Item #" A_Index " -> " A_LoopField, Acc_Error(AccError)
				if Acc_Error()
					throw Exception("Cannot access ChildPath Item", -1, "Item #" A_Index " -> " A_LoopField)
				return
			}
		Acc_Error(AccError)
		StringReplace, Cmd, Cmd, %A_Space%, , All
		properties.HasKey(Cmd)? Cmd:=properties[Cmd]:
		try {
			if (Cmd = "Location")
				AccObj.accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
			  , ret_val := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
			else if (Cmd = "Object")
				ret_val := AccObj
			else if Cmd in Role,State
				ret_val := Acc_%Cmd%(AccObj, ChildID+0)
			else if Cmd in ChildCount,Selection,Focus
				ret_val := AccObj["acc" Cmd]
			else
				ret_val := AccObj["acc" Cmd](ChildID+0)
		} catch {
			ErrorLevel := """" Cmd """ Cmd Not Implemented"
			if Acc_Error()
				throw Exception("Cmd Not Implemented", -1, Cmd)
			return
		}
		return ret_val, ErrorLevel:=0
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Anchor(i, a := "", r := false) {
    static c, cs := 12, cx := 255, cl := 0, g, gs := 8, gl := 0, gpi, gw, gh, z := 0, k := 0xffff, ptr
    if z = 0
        VarSetCapacity(g, gs * 99, 0), VarSetCapacity(c, cs * cx, 0), ptr := A_PtrSize ? "Ptr" : "UInt", z := true
    if !WinExist("ahk_id" . i) {
        GuiControlGet t, Hwnd, %i%
        if ErrorLevel = 0
            i := t
        else ControlGet i, Hwnd,, %i%
    }
    VarSetCapacity(gi, 68, 0), DllCall("GetWindowInfo", "UInt", gp := DllCall("GetParent", "UInt", i), ptr, &gi)
        , giw := NumGet(gi, 28, "Int") - NumGet(gi, 20, "Int"), gih := NumGet(gi, 32, "Int") - NumGet(gi, 24, "Int")
    if (gp != gpi) {
        gpi := gp
        loop %gl%
            if NumGet(g, cb := gs * (A_Index - 1), "UInt") == gp {
                gw := NumGet(g, cb + 4, "Short"), gh := NumGet(g, cb + 6, "Short"), gf := 1
                break
            }
        if !gf
            NumPut(gp, g, gl, "UInt"), NumPut(gw := giw, g, gl + 4, "Short"), NumPut(gh := gih, g, gl + 6, "Short"), gl += gs
    }
    ControlGetPos dx, dy, dw, dh,, ahk_id %i%
    loop %cl%
        if NumGet(c, cb := cs * (A_Index - 1), "UInt") == i {
            if (a = "") {
                cf := 1
                break
            }
            giw -= gw, gih -= gh, as := 1, dx := NumGet(c, cb + 4, "Short"), dy := NumGet(c, cb + 6, "Short")
                , cw := dw, dw := NumGet(c, cb + 8, "Short"), ch := dh, dh := NumGet(c, cb + 10, "Short")
            loop Parse, a, xywh
                if A_Index > 1
                    av := SubStr(a, as, 1), as += 1 + StrLen(A_LoopField)
                        , d%av% += (InStr("yh", av) ? gih : giw) * (A_LoopField + 0 ? A_LoopField : 1)
            DllCall("SetWindowPos", "UInt", i, "UInt", 0, "Int", dx, "Int", dy
                , "Int", InStr(a, "w") ? dw : cw, "Int", InStr(a, "h") ? dh : ch, "Int", 4)
            if r != 0
                DllCall("RedrawWindow", "UInt", i, "UInt", 0, "UInt", 0, "UInt", 0x0101) ; RDW_UPDATENOW | RDW_INVALIDATE
            return
        }
    if cf != 1
        cb := cl, cl += cs
    bx := NumGet(gi, 48, "UInt"), by := NumGet(gi, 16, "Int") - NumGet(gi, 8, "Int") - gih - NumGet(gi, 52, "UInt")
    if cf = 1
        dw -= giw - gw, dh -= gih - gh
    NumPut(i, c, cb, "UInt"), NumPut(dx - bx, c, cb + 4, "Short"), NumPut(dy - by, c, cb + 6, "Short")
        , NumPut(dw, c, cb + 8, "Short"), NumPut(dh, c, cb + 10, "Short")
    return true
}
; Dragable Cursor is now Drawn In, rather than using external images
; Text Insert Point will not stay on edit control when clicked (unless highlighted)
; Updated to use New Realease of Sean's ComUtils

; To Do: Allow Text/HTML Pop-out for Viewing
; To Do: Make ChildNodes a complete tree
; Considering: Change from Click-to-Copy to Right-Click>>Copy Data

{ ; CONSTANTS/PARAMETERS
	WM_ACTIVATE = 0x06
	WM_KILLFOCUS = 0x08
	WM_LBUTTONDOWN = 0x201
	WM_LBUTTONUP = 0x202
	Stored := object(	"AppName",		"iWB2 Learner"
					,	"TextLabel",	"InnerText"		) ; hold stored/global values throughout script
}
{ ; DIRECTIVES
	#NoEnv
	;~  #NoTrayIcon
	DetectHiddenWindows,on
	SetTitleMatchMode,slow
	SetTitleMatchMode,2
}
{ ; AUTOEXECglo
	ComObjError(false)
	OnMessage(WM_LBUTTONDOWN, "HandleMessage")
	OnExit, OnExitCleanup
	; Main GUI
	Menu, Main, Add, Show Parent Structure, ParentStructure
	Gui, Menu, Main
	Gui, Add, Checkbox, x400 y9 gChkBox
	Gui, Add, Edit, x61 y5 w330 h20 hwndTitleHwnd vTitle HWNDh1, ;Title
	Gui, Add, Edit, x100 y30 w305 h20 vEleClassName HWNDh2, ;class
	;~ Gui, Add, Edit, x36 y55 w50 h20 vEleIndex HWNDh3, ;Index number
	;~ Gui, Add, Edit, x120 y55 w90 h20 vEleName HWNDh4, ;Name
	Gui, Add, Text, x1 y57 w30 h21 +Center, Name ;name text moved to left
	Gui, Add, Edit, x36 y55 w180 h20 vEleName HWNDh4, ;Name

      Gui, Add, Text, x35 y7 w25 h20 +Center, Title
	Gui, Add, Text, x41 y33 w55 h20 +Center, className
	Gui, Add, Text, x220 y58 w13 h20 +Center, ID
	Gui, Add, Edit, x235 y55 w180 h20 vEleIDs HWNDh5, ;Element IDs

	;~ Gui, Add, ListView, x6 y82 w410 h60 -LV0x10 AltSubmit vVarListView gSubListView NoSortHdr, % "Frame.#|index|name|id|"
	Gui, Add, ListView, x6 y82 w410 h60 -LV0x10 AltSubmit vVarListView gSubListView NoSortHdr, % "Frame.#|name|id"
	;~ LV_ModifyCol(1, 65), LV_ModifyCol(2,49), LV_ModifyCol(3,120), LV_ModifyCol(4,160), LV_ModifyCol(2,"Center")
	LV_ModifyCol(1, 70),LV_ModifyCol(2,160), LV_ModifyCol(3,160) ;, LV_ModifyCol(2,"Center")
	gui, font, s12
      Gui, Add, Edit, x10 y164 w402 h70 vhtml_text HWNDh6, ;Inner text
	Gui, Add, Edit, x10 y258 w402 h190 vhtml_value HWNDh7, ;OuterHTML window
      ;~ gui, font, s10

	;~ Gui, Add, Text, x1 y56 w34 h20 +Center, Index
	;~ Gui, Add, Text, x89 y57 w30 h21 +Center, Name

	Gui, Add, GroupBox, x6 y142 w410 h90 vText, InnerText
	;~ Gui, Add, GroupBox, x6 y201 w310 h63 , OuterHTML
	Gui, Add, GroupBox, x6 y234 w410 h200 , OuterHTML

	; CrossHair Control
	Gui, Add, Text, x5 y3 w25 h26 Border gCrossHair ReadOnly HWNDh8 Border
	CColor(h8, "White")
	Gui, Add, Text, x5 y3 w25 h4 HWNDh9 Border
	CColor(h9, "0046D5")
	Gui, Add, Text, x8 y17 w19 h1 Border vHBar
	Gui, Add, Text, x17 y8 w1 h19 Border vVBar
	Gui, Font, S6
	Gui, Add, Text, x1 y32 w35 h26 +Center, DRAG CURSOR

	Gui, +AlwaysOnTop +Delimiter`n +hwndHWND
	;~ Gui, Show, Center  h270 w322, % Stored.AppName
	Gui, Show, % "x" A_ScreenWidth-530 " y" 0 " h" 458 " w" 422, % Stored.AppName ;Main gui
	Gui, +LastFoundExist
	WinSet, Redraw, , % "ahk_id" GuiWinHWND:=WinExist()
	ControlFocus, Static7, ahk_id %GuiWinHWND%
	Gui 96: -DPIScale
	Gui 97: -DPIScale
	Gui 98: -DPIScale
	Gui 99: -DPIScale
	; Parental Structure GUI
	Gui 2: +ToolWindow +AlwaysOnTop +Resize
	Gui 2: Add, TreeView, vTView R17
	Gui 2: Show, Hide, Parent Structure
	WinGetPos, , , 2GuiW, 2GuiH, % "ahk_id"
	. Stored.2GUIhwnd := WinExist("Parent Structure ahk_class AutoHotkeyGUI")
	Menu, RClickMenu, Add ; Ensure RClickMenu Exists

	outline := Outline() ; create "Outline" object
	Hotkey, ~LButton Up, Off ; "~LButton Up" Hotkey only active when LButton is pressed
	return
}
#IfWinActive, iWB2Learner ahk_class AutoHotkeyGUI
#s::
{ ; Speak the Text of the Element
	ComObjCreate("SAPI.SpVoice").Speak(Stored.textOfObj)
	return
}
#IfWinActive
~Lbutton Up::
{ ; Handle LButton Being Released
	Hotkey, ~LButton Up, Off
	Lbutton_Pressed := False
	if IsObject(Stored.BColor) ; Restore Element Background Color
		Stored.BColor := ""
	else if Not CH { ; Reset CrossHair
        GuiControl, Show, HBar
        GuiControl, Show, VBar
		CrossHair(CH:=true)
	}
	RemoveFocus()
	return
}

HandleMessage( p_w, p_l, p_m, p_hw ) { ; Handle LButton Being Pressed (for "WM_LBUTTONDOWN")
	Gui, Submit, NoHide
	if (A_GuiControl = "VarListView") { ; Get Column Number - if clicked on ListView
		global column_num ; http://www.autohotkey.com/forum/viewtopic.php?t=6414
		VarSetCapacity( htinfo, 20 )
		, DllCall( "RtlFillMemory", "uint", &htinfo, "uint", 1, "uchar", p_l & 0xFF )
		, DllCall( "RtlFillMemory", "uint", &htinfo+1, "uint", 1, "uchar", ( p_l >> 8 ) & 0xFF )
		, DllCall( "RtlFillMemory", "uint", &htinfo+4, "uint", 1, "uchar", ( p_l >> 16 ) & 0xFF )
		, DllCall( "RtlFillMemory", "uint", &htinfo+5, "uint", 1, "uchar", ( p_l >> 24 ) & 0xFF )
		SendMessage, 0x1000+57, 0, &htinfo,, ahk_id %p_hw%
		If ( ErrorLevel = -1 )
			Return
		column_num := ( *( &htinfo+8 ) & 1 ) ? False : 1+*( &htinfo+16 )
	}
	else if (%A_GuiControl% != "") {
			temp := clipboard := %A_GuiControl%
			ToolTip, % "clipboard= " (StrLen(temp) > 40 ? SubStr(temp,1,40) "..." : temp)
			SetTimer, RemoveToolTip, 1000
	}
	else if (A_GuiControl = "TView") { ; if clicked on TreeView (parent structure)
		Acc_ObjectFromPoint(child).accSelect(0x3, child)
		Hotkey, ~LButton Up, On
		global Stored
		if TV_GetParent(TVsel:=TV_GetSelection()) {
			TV_GetText(text, TVsel)
			RegExMatch(text, "\d+", child)
			clicked := Stored.pelt.childNodes[child]
		}
		else {
			clicked := Stored.pelt
			Loop, % TV_GetDiffCount(Stored.TVitem, TVsel)
				clicked := clicked.parentNode
		}
		Stored.BColor := BCobj(clicked, "silver")
	}
	RemoveFocus()
}
IE_HtmlElement() { ; get the parent windows & coord from the element
	IID_IWebBrowserApp := "{0002DF05-0000-0000-C000-000000000046}", IID_IHTMLWindow2 := "{332C4427-26CB-11D0-B483-00C04FD90119}", hCtl
	CoordMode, Mouse
	MouseGetPos, xpos, ypos,, hCtl, 3

	WinGetClass, sClass, ahk_id %hCtl%
	If Not sClass == "Internet Explorer_Server"
		|| Not pdoc := ComObject(9,ComObjQuery(Acc_ObjectFromWindow(hCtl), IID_IHTMLWindow2, IID_IHTMLWindow2),1).document ; document property will fail if no valie com object
			Return
if !(oDoc := ComObject(9,ComObjQuery(Acc_ObjectFromWindow(hCtl),IID_IHTMLWindow2,IID_IHTMLWindow2),1).document)
	Return

oWin := ComObject(9,ComObjQuery(oDoc,IID_IHTMLWindow2,IID_IHTMLWindow2),1)
oWB := ComObject(9,ComObjQuery(oWin,IID_IWebBrowserApp,IID_IWebBrowserApp),1)

vLogicalXDPI := oWB.document.parentWindow.screen.logicalXDPI
vDeviceXDPI := oWB.document.parentWindow.screen.deviceXDPI
IEZoom := Round(vDeviceXDPI / vLogicalXDPI, 2)
	xpos/=IEZoom, ypos/=IEZoom

	global outline, Stored, Frame := {} ; store frames & hold "Frame" Coords & stored values
	pwin := ComObject(9,ComObjQuery(pdoc, IID_IHTMLWindow2, IID_IHTMLWindow2),1)
	iWebBrowser2 := ComObject(9,ComObjQuery(pwin,IID_IWebBrowserApp,IID_IWebBrowserApp),1)

	if pelt := pwin.document.elementFromPoint( xpos-xorg:=pwin.screenLeft, ypos-yorg:=pwin.screenTop ) {
		Stored.LV := object() ; hold frame info for ListView
		while (type:=pelt.tagName)="IFRAME" || type="FRAME" {
			selt .=   A_Index ") **[sourceIndex]=" pelt.sourceindex " **[Name]= " pelt.name " **[ID]= " pelt.id "`n"
			, Stored.LV[A_Index, "C1"] := type "." A_Index
			;~ , Stored.LV[A_Index, "C2"] := pelt.sourceindex
			, Stored.LV[A_Index, "C2"] := pelt.name
			, Stored.LV[A_Index, "C3"] := pelt.id
			, Frame[A_Index] := pelt ; store frames
			, pwin :=	ComObject(9,ComObjQuery(pbrt:=pelt.contentWindow, IID_IHTMLWindow2, IID_IHTMLWindow2),1)
			, pdoc :=	pwin.document
			, Stored.LV[A_Index, "URL"] := pelt.className ;pdoc.url ;joe
			, pbrt :=	pdoc.elementFromPoint(	xpos-xorg+=pelt.getBoundingClientRect().left
											,	ypos-yorg+=pelt.getBoundingClientRect().top	)
			, pelt :=	pbrt
		}
		pbrt :=   pelt.getBoundingClientRect()
		, l  :=   pbrt.left
		, t  :=   pbrt.top
		, r  :=   pbrt.right
		, b  :=   pbrt.bottom

		if Not outline.visible ; if the element has changed
			|| (Stored.pelt.sourceIndex != pelt.sourceIndex) {
			; (Stored["x1"] <> l+xorg || Stored["y1"] <> t+yorg || Stored["x2"] <> r+xorg || Stored["y2"] <> b+yorg) {
			if selt ; if the element is in a frame, get frame dimensions
				Frect := Frame[Frame.maxIndex()].getBoundingClientRect() ; get the Frame Rectangle
				, Frame.x1 := xorg ; set the frame Coordinates
				, Frame.y1 := yorg
				, Frame.x2 := FRect.right+xorg
				, Frame.y2 := FRect.bottom+yorg
			else,
				Frame.x1:=Frame.y1:=Frame.x2:=Frame.y2:= "NA" ; if there isn't any frames, assign frame coords "NA"

			; Change outline display
			outline.transparent(true)
			, outline.hide()
			, coord := GetCoord(	Stored.x1 := (l+xorg)*IEZoom
								, 	Stored.y1 := (t+yorg)*IEZoom
								,	Stored.x2 := (r+xorg)*IEZoom
								,	Stored.y2 := (b+yorg)*IEZoom
								,	iWebBrowser2.HWND	)
			, outline.show(coord.x1, coord.y1, coord.x2, coord.y2, coord.sides)
			, outline.setAbove( iWebBrowser2.HWND )
			, outline.transparent( false )
		}

		Sleep, 1 ; make sure Controls Update
		if (Stored.selt != selt) {
			LV_Delete()
			Loop, % Stored.LV.MaxIndex()
				LV_Add(	""	,	Stored.LV[A_Index].C1
							,	Stored.LV[A_Index].C2
							,	Stored.LV[A_Index].C3
							,	Stored.LV[A_Index].C4	)
			Stored.selt := selt
		}
		Stored.pelt := pelt
		, Stored.LocationName := iWebBrowser2.LocationName
		, Stored.LocationURL := pelt.className ;iWebBrowser2.LocationURL ;joe
		GoSub, UpdateGuiControls
		Gui, Show, NA, % Stored.AppName " :: <" Stored.pelt.tagName ">"
	}
}

CrossHair:
{ ; allow dragable Cross-Hair when clicked
	if (A_GuiEvent = "Normal") {
		SetBatchLines, -1
		Hotkey, ~LButton Up, On
		{ ; Set CrossHair Cursor & Hide in GUI
			GuiControl, Hide, HBar
			GuiControl, Hide, VBar
			CrossHair(CH:=false)
		}
		Lbutton_Pressed := True
		while, Lbutton_Pressed
			IE_HtmlElement()
		outline.hide()
		if Stored.pelt.tagName != ""
			Gui, Show, NA, % Stored.AppName " :: <" Stored.pelt.tagName ">" ;stores tagname in appname
			;~  Gui, Show, NA, % Stored.AppName " :: <" Stored.pelt.tagName "> [" GetTagIndex(Stored.pelt) "]" ;stores tagname in appname
		;~  if Stored.pelt.className != ""
			;~  Gui, Show, NA, % Stored.AppName " :: <" Stored.pelt.className "> [" GetTagIndex(Stored.pelt) "]"
		if WinVisible("ahk_id" Stored.2GUIhwnd)
			GoSub, ParentStructure
		SetBatchLines, 10ms
	}
	return
}
OnExitCleanup:
{ ; Cleanup when the Script Exits
	CrossHair(true)
	GuiClose:
		ExitApp
}
UpdateGuiControls:
{ ; Update the Main GUI with the New Element Info
	SetBatchLines, -1
	Gui, 1: Default
	textOfObj := inpt(Stored.pelt)
	GuiControl, , Title, % Stored.LocationName
	;~  GuiControl, , URLL, % Stored.LocationURL ; Edit2
	GuiControl, , EleClassName, % Stored.pelt.classname ; Edit2
	GuiControl, , EleIndex, % Stored.pelt.sourceindex ; Edit3
	GuiControl, , EleName, % Stored.pelt.name ; Edit4
	GuiControl, , EleIDs, %	Stored.pelt.id ; Edit5
	if (Stored.textOfObj != textOfObj)
		GuiControl, , html_text, % Stored.textOfObj:=textOfObj ; Edit6
	if (Stored.outerHTML != (val:=Stored.pelt.outerHTML) )
		GuiControl, , html_value, % Stored.outerHTML:=val ; Edit7
	textOfObj:=val:=""
	RemoveFocus()
}
SubListView:
{ ; When the Frames ListView is clicked
	if (A_GuiEvent = "Normal") { ; if Right Clicked
		if (column_num = 1)
			LVselection := Stored.LV[A_EventInfo].url
		else,
			LV_GetText(LVselection, A_EventInfo, column_num)
		if LVselection { ; if listview item contains data
			clipboard := LVSelection
			ToolTip, % "clipboard= " (StrLen(LVSelection) > 40 ? SubStr(LVSelection,1,40) "..." : LVSelection)
			SetTimer, RemoveToolTip, 1000
		}
	}
	Return
}
RemoveToolTip:
{
	SetTimer, RemoveToolTip, off
	ToolTip
	return
}
ParentStructure:
{ ; "Parent Structure" Menu Item Labels
	{
		SetBatchLines, -1
		if Not Stored.pelt.className
			return
		nodes := object()
		elem := Stored.pelt
		Gui 2: Default
		TV_Delete()
		Loop {
			if A_Index != 1
				elem := elem.parentNode
			nodes.insert( 1, elem.tagName ;if change to classname, heiarchy built off classname
					.	(elem.id!=""? " id= """ elem.id """":"")
					.	(elem.name!=""? "  name= """ elem.name """":""))
				      ;~  .     (elem.classname!=""? "  class= """ elem.classname """":"")

		} Until, elem.tagName = "html"

		GuiControl, -Redraw, TView
		For, Each, item in nodes
			Stored.TVitem := TV_Add(item)

		nodes := Stored.pelt.childNodes
		Loop, % nodes.length {
			elem := nodes.item(A_Index-1)
			TV_Add("[" A_Index-1 "] " elem.tagName
				.	(elem.id!=""? " id= """ elem.id """":"")
				.	(elem.name!=""? "  name= """ elem.name """":"")
				.	(elem.class!=""? "  class= """ elem.class """":"")
			, Stored.TVitem	)
		}

		nodes:=elem:=""
		GuiControl, +Redraw, TView
		TV_Modify(Stored.TVitem, "Select Bold")
		if Not WinVisible("ahk_id" Stored.2GUIhwnd) {
			WinGetPos, x, y, w, , ahk_id %GuiWinHWND%
			WinMove, % "ahk_id" Stored.2GUIhwnd,
				, (x+w+2GuiW > A_ScreenWidth? x-2GuiW-5:x+w+5)
				, %y%, %2GuiW%, %2GuiH%
			WinShow, % "ahk_id" Stored.2GUIhwnd
			temp:=""
		}
		return
	}
	2GuiClose:
	{
		Gui 2: Hide
		Gui 1: Default
		Stored.TVitem := ""
		return
	}
	2GuiSize:
	{
		Anchor(TView, "wh")
		return
	}
	2GuiContextMenu:
	{
		if (A_GuiControl = "TView") {
			Acc_ObjectFromPoint(child).accSelect(0x3, child)
			Menu, RClickMenu, DeleteAll
			TV_GetText(text, TV_GetSelection())
			if RegExMatch(text, "id= ""\K[^""]+", ElemID)
				Menu, RClickMenu, Add, Copy ID, RClick
			if RegExMatch(text, "name= ""\K[^""]+", ElemName)
				Menu, RClickMenu, Add, Copy Name, RClick
		      if RegExMatch(text, "class= ""\K[^""]+", ElemName)
			      Menu, RClickMenu, Add, Copy class, RClick

		      Menu, RClickMenu, Add, Use Element, RClick
			Menu, RClickMenu, Show
		}
		return
	}
	RClick:
	{
		Gui, 2: +OwnDialogs
		if (A_ThisMenuItem = "Copy ID")
			clipboard := ElemID
		else if (A_ThisMenuItem = "Copy Name")
			clipboard := ElemName
		else if (A_ThisMenuItem = "Copy class")
			clipboard := ElemName
		else if (A_ThisMenuItem = "Use Element") {
			temp := Stored.pelt
			Gui, 2: Default
			if TV_GetParent(TVsel:=TV_GetSelection()) {
				TV_GetText(text, TVsel)
				RegExMatch(text, "\d+", child)
				Stored.pelt := Stored.pelt.childNodes[child]
			}
			else,
				Loop, % TV_GetDiffCount(Stored.TVitem, TVsel)
					Stored.pelt := Stored.pelt.parentNode
			if Not Stored.pelt.sourceIndex {
				MsgBox, 262160, Selection Error, Cannot access this element.
				Stored.pelt := temp
			}
			else {
				Gui, 1: Default
				Gui, Show, NA, % Stored.AppName " :: <" Stored.pelt.tagName ">"
					. (Stored.pelt.className="HTML"? "":" [" GetTagIndex(Stored.pelt) "]")
				GoSub, UpdateGuiControls
				if WinVisible("ahk_id" Stored.2GUIhwnd)
					GoSub, ParentStructure
			}
		}
		ElemName:=ElemID:=TVsel:=child:=temp:=""
		return
	}
}

{ ; OUTLINE OBJECT DEFINITION
Outline(color="blue") { ; uses GUI 95-99
	self := object(	"base",	object(	"show",			"Outline_Show"
								,	"hide",			"Outline_Hide"
								,	"setAbove",		"Outline_SetAbove"
								,	"transparent",	"Outline_Transparent"
								,	"color",		"Outline_Color"
								,	"destroy",		"Outline_Destroy"
								,	"__delete",		"Object_Delete"	)	)
	Loop, 4 {
		Gui, % A_Index+95 ": -Caption +ToolWindow"
		Gui, % A_Index+95 ": Color", %color%
		Gui, % A_Index+95 ": Show", NA h0 w0, outline%A_Index%
		self[A_Index] := WinExist("outline" A_Index " ahk_class AutoHotkeyGUI")
	}
	self.visible := false
	, self.color := color
	, self.top := self[1]
	, self.right := self[2]
	, self.bottom := self[3]
	, self.left := self[4]
	Return, self
}
	Outline_Show(self, x1, y1, x2, y2, sides="TRBL") { ; show outline at coords
		if InStr( sides, "T" )
			Gui, 96:Show, % "NA X" x1-2 " Y" y1-2 " W" (x2-x1+4) " H" 4,outline1
		Else, Gui, 96: Hide
		if InStr( sides, "R" )
			Gui, 97:Show, % "NA X" x2 " Y" y1 " W" 4 " H" y2-y1,outline2
		Else, Gui, 97: Hide
		if InStr( sides, "B" )
			Gui, 98:Show, % "NA X" x1-2 " Y" y2 " W" x2-x1+4 " H" 4,outline3
		Else, Gui, 98: Hide
		if InStr( sides, "L" )
			Gui, 99:Show, % "NA X" x1-2 " Y" y1 " W" 4 " H" y2-y1,outline4
		Else, Gui, 99: Hide
		self.visible := true
	}
	Outline_Hide(self) { ; hide outline
		Loop, 4
			Gui, % A_Index+95 ": Hide"
		self.visible := false
	}
	Outline_SetAbove(self, hwnd) { ; set Z-Order one above "hwnd"
		ABOVE := DllCall("GetWindow", "uint", hwnd, "uint", 0x3) ; get window directly above "hwnd"
		Loop, 4  ; set 4 "outline" GUI's directly below "hwnd_above"
			DllCall(	"SetWindowPos", "uint", self[ A_Index ], "uint", ABOVE
					,	"int", 0, "int", 0, "int", 0, "int", 0
					,	"uint", 0x1|0x2|0x10	) ; NOSIZE | NOMOVE | NOACTIVATE
	}
	Outline_Transparent(self, param) { ; set Transparent ( different from hiding )
		Loop, 4
			WinSet, Transparent, % param=1? 0:255, % "ahk_id" self[A_Index]
		self.visible := !param
	}
	Outline_Color(self, color) { ; set Color of Outline GUIs
		Loop, 4
			Gui, % A_Index+95 ": Color" , %color%
		self.color := color
	}
	Outline_Destroy(self) { ; Destroy Outline
		VarSetCapacity(self, 0)
	}
	Object_Delete() { ; Destroy "outline GUIs" when object is deleted
		Loop, 4
			Gui, % A_Index+95 ": Destroy"
	}
}

; OTHER FUNCTIONS
CrossHair(OnOff=1) {  ; Change Cursor to Cross-Hair
    ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
	static AndMask, XorMask, $, h_cursor, IDC_CROSS := 32515
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "") {      ; init when requested or at first call
        $ := "h"                                          ; active default cursors
        , VarSetCapacity( h_cursor,4444, 1 )
        , VarSetCapacity( AndMask, 32*4, 0xFF )
        , VarSetCapacity( XorMask, 32*4, 0 )
        , system_cursors := "32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650"
        StringSplit c, system_cursors, `,
        Loop, %c0%
            h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
            , h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
            , b%A_Index% := DllCall("LoadCursor", "Uint", "", "Int", IDC_CROSS, "Uint")
    }
    $ := (OnOff = 0 || OnOff = "Off" || $ = "h" && (OnOff < 0 || OnOff = "Toggle" || OnOff = "T")) ? "b" : "h"

    Loop, %c0%
        h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
        , DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
; http://www.autohotkey.com/docs/commands/DllCall.htm
; http://www.autohotkey.com/forum/topic4570.html#75609
}
inpt(i) { ; return the Text of the Element
	global Stored
	tag	:=	i.className
	if tag in BUTTON,INPUT,OPTION,SELECT,TEXTAREA
	{
		if (Stored.TextLabel = "InnerText")
			GuiControl, , Text, % Stored.TextLabel:="Value"
		return, i.value
	}
	if (Stored.TextLabel = "Value")
		GuiControl, , Text, % Stored.TextLabel:="InnerText"
	return, i.innerText
}

GetCoord( x1,y1,x2,y2, WinHWND ) { ; get the coordinates for the outline
	global Frame, outline
	WinGetPos, Wx, Wy, , , ahk_id %WinHWND%
	ControlGetPos, Cx1, Cy1, Cw, Ch, Internet Explorer_Server1, ahk_id %WinHWND%
	Cx1+=Wx  ; set "Internet Explorer_Server1" dimensions
	, Cy1+=Wy
	, Cx2:=Cx1+Cw
	, Cy2:=Cy1+Ch

	; Example return: object( "x1", 150, "y1", 200, "x2", 250, "y2", 300, "sides", "TRBL" )
	Return, object(	"x1",		Value( x1,Cx1,Frame["x1"], ">" )
				,	"y1",		Value( y1,Cy1,Frame["y1"], ">" )
				,	"x2",		Value( x2,Cx2,Frame["x2"], "<" )
				,	"y2",		Value( y2,Cy2,Frame["y2"], "<" )
				,	"sides",	( ElemCoord( y1,Cy1,Frame["y1"], ">" ) ? "T" : "" )
							.	( ElemCoord( x2,Cx2,Frame["x2"], "<" ) ? "R" : "" )
							.	( ElemCoord( y2,Cy2,Frame["y2"], "<" ) ? "B" : "" )
							.	( ElemCoord( x1,Cx1,Frame["x1"], ">" ) ? "L" : "" )	)
}
Value( E,C,F, option=">" ) { ; returns the value of the Greatest (or smallest) value
	return,	F+0=""? (option=">"? (E>=C? E:C) : (E<=C? E:C))
		:	(option=">"? (E>=C? (E>=F? E:F) : (C>=F? C:F)) : (E<=C? (E<=F? E:F) : (C<=F? C:F)))
}
ElemCoord( E,C,F, option=">" ) { ; returns true if the Element value is the Greatest (or smallest)
	return,	F+0=""? (option=">"? (E>=C? 1:0):(E<=C? 1:0))
		:	(option=">"? (E>=C && E>=F? 1:0):(E<=C && E<=F? 1:0))
}

GetTagIndex(element) { ; return the Index in the Tag Collection
	if IsMemberOf(element, "sourceIndex")
	and (index:=element.sourceIndex)
	and (tags:=element.ownerDocument.all.tags(element.class))
	and (top:=tags.length, bottom:=0)
		Loop {
			test := Floor( (top+bottom)/2 )
			i := tags[test].sourceIndex
			if (index < i)
				top := test
			else if (index > i)
				bottom := test
			else,
				return, test
		}
}
IsMemberOf(obj, name) { ; http://www.autohotkey.com/forum/topic63827.html
   return,  DllCall(NumGet(NumGet(1*p:=ComObjUnwrap(obj))+A_PtrSize*5)
        ,	"Ptr",  p
        ,	"Ptr",  VarSetCapacity(iid,16,0)*0+&iid
        ,	"Ptr*", &name
        ,	"UInt", 1
        ,	"UInt", 1024
        ,	"Int*", dispID)=0
        && dispID+1, ObjRelease(p)
}
TV_GetDiffCount(p1, p2) {
	count = 0
	while, p1 != p2
		p1 := TV_GetPrev(p1)
		, count++
	return, count
}
WinVisible(WinTitle) {
	temp := A_DetectHiddenWindows
	DetectHiddenWindows, Off
	out := WinExist(WinTitle)
	DetectHiddenWindows, %temp%
	return, out
}
BCobj(elem, color) { ; highlight Element Background
	static	base := object("__delete","BCobj_Delete")
	return,	object("elem",elem, "color",elem.style.backgroundColor, "base",base)
		,	elem.style.backgroundColor := color
}
BCobj_Delete(self) {
	self.elem.style.backgroundColor := self.color
}
RemoveFocus() { ; Handle LButton Being Release over Main GUI
	global GuiWinHWND
	ControlGetFocus, focus, ahk_id %GuiWinHWND%
	if (SubStr(focus,1,4) == "Edit") {
		ControlGet, text, Selected, , %focus%, ahk_id %GuiWinHWND%
		if Not text
			ControlFocus, Static7, ahk_id %GuiWinHWND%
	}
}

CColor(Hwnd, Background="", Foreground="") {
	; http://www.autohotkey.com/forum/viewtopic.php?t=39055
	return CColor_(Background, Foreground, "", Hwnd+0)
}
CColor_(Wp, Lp, Msg, Hwnd) {
	static
	static WM_CTLCOLOREDIT=0x0133, WM_CTLCOLORLISTBOX=0x134, WM_CTLCOLORSTATIC=0x0138
		,LVM_SETBKCOLOR=0x1001, LVM_SETTEXTCOLOR=0x1024, LVM_SETTEXTBKCOLOR=0x1026, TVM_SETTEXTCOLOR=0x111E, TVM_SETBKCOLOR=0x111D
		,BS_CHECKBOX=2, BS_RADIOBUTTON=8, ES_READONLY=0x800
		,CLR_NONE=-1, CSILVER=0xC0C0C0, CGRAY=0x808080, CWHITE=0xFFFFFF, CMAROON=0x80, CRED=0x0FF, CPURPLE=0x800080, CFUCHSIA=0xFF00FF,CGREEN=0x8000, CLIME=0xFF00, COLIVE=0x8080, CYELLOW=0xFFFF, CNAVY=0x800000, CBLUE=0xFF0000, CTEAL=0x808000, CAQUA=0xFFFF00
		,CLASSES := "Button,ComboBox,Edit,ListBox,Static,RICHEDIT50W,SysListView32,SysTreeView32"

	If (Msg = "") {
		if !adrSetTextColor
			adrSetTextColor   := DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetTextColor")
			,adrSetBkColor   := DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetBkColor")
			,adrSetBkMode   := DllCall("GetProcAddress", "uint", DllCall("GetModuleHandle", "str", "Gdi32.dll"), "str", "SetBkMode")

		;Set the colors (RGB -> BGR)
		BG := !Wp ? "" : C%Wp% != "" ? C%Wp% : "0x" SubStr(WP,5,2) SubStr(WP,3,2) SubStr(WP,1,2)
		FG := !Lp ? "" : C%Lp% != "" ? C%Lp% : "0x" SubStr(LP,5,2) SubStr(LP,3,2) SubStr(LP,1,2)

		;Activate message handling with OnMessage() on the first call for a class
		WinGetClass, class, ahk_id %Hwnd%
		If class not in %CLASSES%
			return A_ThisFunc "> Unsupported control class: " class

		ControlGet, style, Style, , , ahk_id %Hwnd%
		if (class = "Edit") && (Style & ES_READONLY)
			class := "Static"

		if (class = "Button")
			if (style & BS_RADIOBUTTON) || (style & BS_CHECKBOX)
				class := "Static"
			else return A_ThisFunc "> Unsupported control class: " class

		if (class = "ComboBox") {
			VarSetCapacity(CBBINFO, 52, 0), NumPut(52, CBBINFO), DllCall("GetComboBoxInfo", "UInt", Hwnd, "UInt", &CBBINFO)
			hwnd := NumGet(CBBINFO, 48)      ;hwndList
			%hwnd%BG := BG, %hwnd%FG := FG, %hwnd% := BG ? DllCall("CreateSolidBrush", "UInt", BG) : -1

			IfEqual, CTLCOLORLISTBOX,,SetEnv, CTLCOLORLISTBOX, % OnMessage(WM_CTLCOLORLISTBOX, A_ThisFunc)

			If NumGet(CBBINFO,44)   ;hwndEdit
				Hwnd :=  Numget(CBBINFO,44), class := "Edit"
		}

		if class in SysListView32,SysTreeView32
		{
			 m := class="SysListView32" ? "LVM" : "TVM"
			 SendMessage, %m%_SETBKCOLOR, ,BG, ,ahk_id %Hwnd%
			 SendMessage, %m%_SETTEXTCOLOR, ,FG, ,ahk_id %Hwnd%
			 SendMessage, %m%_SETTEXTBKCOLOR, ,CLR_NONE, ,ahk_id %Hwnd%
			 return
		}

		if (class = "RICHEDIT50W")
			return f := "RichEdit_SetBgColor", %f%(Hwnd, -BG)

		if (!CTLCOLOR%Class%)
			CTLCOLOR%Class% := OnMessage(WM_CTLCOLOR%Class%, A_ThisFunc)

		return %Hwnd% := BG ? DllCall("CreateSolidBrush", "UInt", BG) : CLR_NONE,  %Hwnd%BG := BG,  %Hwnd%FG := FG
	}

	; Message handler
	critical               ;its OK, always in new thread.

	Hwnd := Lp + 0, hDC := Wp + 0
	If (%Hwnd%) {
	DllCall(adrSetBkMode, "uint", hDC, "int", 1)
	if (%Hwnd%FG)
		DllCall(adrSetTextColor, "UInt", hDC, "UInt", %Hwnd%FG)
	if (%Hwnd%BG)
		DllCall(adrSetBkColor, "UInt", hDC, "UInt", %Hwnd%BG)
	return (%Hwnd%)
	}
}

ChkBox:
if !chkBox
	WinSet, Transparent, 191, ahk_id %HWND%
else
	WinSet, Transparent, off, ahk_id %HWND%
chkBox:=!chkBox ; alternative to vChkBox variable avoids triggering "copy to clipboard"
return

Browser_Forward::Reload