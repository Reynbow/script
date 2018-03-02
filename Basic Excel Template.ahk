; Anything after a semi-colon on the same line isn't read by the code "commented out"'
; Will force the script to only be able to run once, opening again will just refresh the script
#SingleInstance, Force

;======== THE GUI BUILD STARTS HERE =========

Gui,+AlwaysOnTop ;-sysmenu
Gui, font, s12 bold, Helvetica ; s=size
Gui, Add, Text, center x1 y14 w286 h30 , Form Header ;centers the font according to the width you set (I make it the same as the width of the GUI)
Gui, font, ; resets the font style for all font bellow
Gui, Add, Text, x30 y60 w140 h20 , Entry One    ;x and y values are literally just the cords you want it at
Gui, Add, Edit, x150 y60 w110 h20 vBox1,        ;the "vBox1" is a variable named "Box1", can name it anything you want but I'm a basic bitch so it's just "Box1"
Gui, Add, Text, x30 y100 w160 h20 , Entry Two
Gui, Add, Edit, x150 y100 w110 h20 vBox2, 
Gui, Add, Button, x40 y140 w200 h30 , &Confirm ;The ampisand just means you can press the letter after it to press the button in the GUI instead of clicking it
Gui, Add, Button, x40 y180 w200 h30 , &Exit
Gui, Show, x150 y150 w286 h230, Window Name ;This is the name of the window title bar
return

;======== THE GUI BUILD ENDS HERE (note the return function) =========

ButtonConfirm: ;Button is the function and the colon confirms it. The Button name in the GUI can have spaces, just remove the spaces here.
gui, submit ;gui, submit "submits" any information you've entered and stores the variables

WorkBookPath        := "C:\AutoHotKey\Files\test.xlsx"          ; store the path to the workbook (example is test.xlsx)
objExcel			:= ComObjCreate("Excel.Application")        ; create a handle to a new excel application
objWorkBook		    := objExcel.Workbooks.Open(WorkBookPath)    ; opens the existing excel table
objExcel.Visible	:= FALSE                                    ; make excel visible/invisible

objExcel.Range("A1").Value := Box1  ;here's the variables from the GUI. Note the lack of "v"
objExcel.Range("A2").Value := Box2

objExcel.Range("A1").Font.Bold := 1     ;formatting
objExcel.Range("A1").ColumnWidth := 20  ;also formatting

objWorkBook.Save    ;saves
objExcel.Quit()     ;quits
objExcel 	:= ""   ;clears object
ExitApp    ;closes the script once it's done


ButtonExit:
ExitApp