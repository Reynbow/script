#Persistent
#SingleInstance Force
#NoEnv

F1::
Loop {
ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\Aaron.Beecham\Pictures\icons\icon-new.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% Left, 1
Sleep, 4000
ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\Aaron.Beecham\Pictures\icons\icon-new.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% Left, 1
Sleep, 4000
ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\Aaron.Beecham\Pictures\icons\icon-new.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% right, 1
Sleep, 4000
ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\Aaron.Beecham\Pictures\icons\icon-new.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% Left, 1
Sleep, 4000
ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\Aaron.Beecham\Pictures\icons\icon-new.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% Left, 1
Sleep, 4000
}

Return

Esc::ExitApp