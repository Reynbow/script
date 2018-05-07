#NoEnv
#SingleInstance Force
SendMode Input


F1::
Send ^a
FileReadLine, store, %A_Desktop%\array.txt, %line%
Send % store
line++
return


F2::
Reload
return

F3::
Send, @greencrosshealth.co.nz
return