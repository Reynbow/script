#SingleInstance, Force

Inputbox, name, What's the pharmacy name?

If !FileExist("C:\Users\Aaron.Beecham\Documents\sanaccts.csv")
	FileAppend, 
	(LTrim
	%name%
	), C:\Users\Aaron.Beecham\Documents\sanaccts.csv
	
MsgBox % ClipBoard := 2find(name)
MsgBox % ClipBoard := 2get("A3")

2find(cellContent) {
	Loop, Read, C:\Users\Aaron.Beecham\Documents\sanaccts.csv
	
	{
		array := StrSplit(A_LoopReadLine,",")
 		lNo := A_Index
		Loop % array.Length() {
			If (array[A_Index] = cellContent)
				Return Chr(lNo+64) ":" A_Index
			}
		}	
	}

2get(cell) {
	rowNo := Asc(SubStr(cell,1,1))-64
	colNo := SubStr(cell,2)
	Loop, Read, C:\Users\Aaron.Beecham\Documents\sanaccts.csv
	{
		If (A_Index = rowNo) {
			array := StrSplit(A_LoopReadLine,",")
			Return array[colNo]
			}
	}	
}

F10::Reload