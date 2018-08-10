fullweeksummary:
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name

IniRead, Name, C:\AutoHotKey\settings.ini, UserName, Name
If Name = Aaron
{
InputBox, Name, Summary, , , 80, 105
}
If Name = Brodie
{
InputBox, Name, Summary, , , 80, 105
}
If (Name = "")
{
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
}

FormatTime, Day,, dddd

If Day = Friday
    {
    fri = %a_now%
    FormatTime, fri, %fri%, yyyyMMdd

    thur = %a_now%
    thur += -1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -2, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -3, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -4, days
    FormatTime, mon, %mon%, yyyyMMdd
    }


If Day = Thursday
    {

    fri = %a_now%
    fri += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    wed += -1, days
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -2, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -3, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Wednesday
    {

    fri = %a_now%
    fri += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    wed = %a_now%
    FormatTime, wed, %wed%, yyyyMMdd

    tue = %a_now%
    tue += -1, days
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -2, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Tuesday
    {

    fri = %a_now%
    fri += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    tue = %a_now%
    FormatTime, tue, %tue%, yyyyMMdd

    mon = %a_now%
    mon += -1, days
    FormatTime, mon, %mon%, yyyyMMdd
    }

If Day = Monday
    {

    fri = %a_now%
    fri += +4, days
    FormatTime, thur, %thur%, yyyyMMdd

    thur = %a_now%
    thur += +3, days
    FormatTime, thur, %thur%, yyyyMMdd

	wed = %a_now%
    wed += +2, days
    FormatTime, thur, %thur%, yyyyMMdd

	tue = %a_now%
    tue += +1, days
    FormatTime, thur, %thur%, yyyyMMdd

    mon = %a_now%
    FormatTime, mon, %mon%, yyyyMMdd
    }

Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Data Out.txt
{
   mon_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
{
   tue_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
{
   wed_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
{
   thur_lines = %A_Index%
}
Loop, Read, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
{
   fri_lines = %A_Index%
}

do_lines += mon_lines
do_lines += tue_lines
do_lines += wed_lines
do_lines += thur_lines
do_lines += fri_lines

;======================= MONDAY

IniRead, Weekly_Cord, C:\AutoHotKey\settings.ini, window position, weekly_position, x1 y1

Gui, 99P2: %OnTopSetting%
Gui, 99P2:Color, 1d1f21, 383D46
Gui, 99P2:Add, Button, x2000 y2000 w20 h20 , placehold
Gui, 99P2:font, bold s12 CWhite, Segoe UI
Gui, 99P2:Add, Text, x25 y15 BackGroundTrans , FULL WEEK SUMMARY
Gui, 99P2:Add, Text, x380 y15 BackGroundTrans , DATA OUTAGE = %do_lines%
Gui, 99P2:font,
Gui, 99P2:font, bold s6 , Segoe UI	
;Gui, 99P2:Add, Button, x545 y15 w50 h25 gFULLWEEKSAVEPOS, SAVE`nPOSITION
;Gui, 99P2:Add, Button, x505 y15 w80 h20,  SAVE POSITION
Gui, 99P2:font,
Gui, 99P2:font, bold s10 CWhite, Segoe UI	

;Gui, 99P2:Add, GroupBox, x15 y45 w100 h680, MONDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, mDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Data Out.txt
Gui, 99P2:Add, Button, x16 y75 w99 h20 Left gMONDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y95 w94 h110 readonly -tabstop -VScroll -E0x200, %mDOPoints%

;INSTALL COUNTER
FileRead, mINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y205 w99 h20 Left gMONIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y225 w94 h110 readonly -tabstop -VScroll -E0x200, %mINPoints%

;QA COUNTER
FileRead, mQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y335 w99 h20 Left gMONQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y355 w94 h110 readonly -tabstop -VScroll -E0x200, %mQAPoints%

;LOY IN
FileRead, mLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y465 w99 h20 Left gMONTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y485 w94 h110 readonly -tabstop -VScroll -E0x200, %mLoyInPoints%

;LOY CONFIG
FileRead, mCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x16 y595 w99 h20 Left gMONTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x20 y615 w94 h109 readonly -tabstop -VScroll -E0x200, %mCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= TUESDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

;Gui, 99P2:Add, GroupBox, x135 y45 w100 h680, TUESDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, tDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Data Out.txt
Gui, 99P2:Add, Button, x136 y75 w99 h20 Left gTUEDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y95 w94 h110 readonly -tabstop -VScroll -E0x200, %tDOPoints%

;INSTALL COUNTER
FileRead, tINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y205 w99 h20 Left gTUEIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y225 w94 h110 readonly -tabstop -VScroll -E0x200, %tINPoints%

;QA COUNTER
FileRead, tQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y335 w99 h20 Left gTUEQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y355 w94 h110 readonly -tabstop -VScroll -E0x200, %tQAPoints%

;LOY IN
FileRead, tLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y465 w99 h20 Left gTUETIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y485 w94 h110 readonly -tabstop -VScroll -E0x200, %tLoyInPoints%

;LOY CONFIG
FileRead, tCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x136 y595 w99 h20 Left gTUETC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x140 y615 w94 h109 readonly -tabstop -VScroll -E0x200, %tCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= WEDNESDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

;Gui, 99P2:Add, GroupBox, x255 y45 w100 h680, WEDNESDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, wDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Data Out.txt
Gui, 99P2:Add, Button, x256 y75 w99 h20 Left gWEDDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y95 w94 h110 readonly -tabstop -VScroll -E0x200, %wDOPoints%

;INSTALL COUNTER
FileRead, wINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y205 w99 h20 Left gWEDIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y225 w94 h110 readonly -tabstop -VScroll -E0x200, %wINPoints%

;QA COUNTER
FileRead, wQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y335 w99 h20 Left gWEDQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y355 w94 h110 readonly -tabstop -VScroll -E0x200, %wQAPoints%

;LOY IN
FileRead, wLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y465 w99 h20 Left gWEDTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y485 w94 h110 readonly -tabstop -VScroll -E0x200, %wLoyInPoints%

;LOY CONFIG
FileRead, wCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x256 y595 w99 h20 Left gWEDTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x260 y615 w94 h109 readonly -tabstop -VScroll -E0x200, %wCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= THURSDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

;Gui, 99P2:Add, GroupBox, x375 y45 w100 h680, THURSDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, thDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Data Out.txt
Gui, 99P2:Add, Button, x376 y75 w99 h20 Left gTHURDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y95 w94 h110 readonly -tabstop -VScroll -E0x200, %thDOPoints%

;INSTALL COUNTER
FileRead, thINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y205 w99 h20 Left gTHURIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y225 w94 h110 readonly -tabstop -VScroll -E0x200, %thINPoints%

;QA COUNTER
FileRead, thQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y335 w99 h20 Left gTHURQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y355 w94 h110 readonly -tabstop -VScroll -E0x200, %thQAPoints%

;LOY IN
FileRead, thLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y465 w99 h20 Left gTHURTIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y485 w94 h110 readonly -tabstop -VScroll -E0x200, %thLoyInPoints%

;LOY CONFIG
FileRead, thCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x376 y595 w99 h20 Left gTHURTC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x380 y615 w94 h109 readonly -tabstop -VScroll -E0x200, %thCONPoints%
Gui, 99P2:Show, %Weekly_Cord% w610 h762, FULL WEEK SUMMARY

;======================= FRIDAY

Gui, 99P2:font, bold s10 CWhite, Segoe UI	

;Gui, 99P2:Add, GroupBox, x495 y45 w100 h680, FRIDAY
;Gui, 99:Add, GroupBox, x15 y625 w180 h300 , Point Counter

;DATA OUT COUNTER
FileRead, fDOPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Data Out.txt
Gui, 99P2:Add, Button, x496 y75 w99 h20 Left gFRIDO, %A_Space%Data Out
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y95 w94 h110 readonly -tabstop -VScroll -E0x200, %fDOPoints%

;INSTALL COUNTER
FileRead, fINPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y205 w99 h20 Left gFRIIN, %A_Space%Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add,Edit, x500 y225 w94 h110 readonly -tabstop -VScroll -E0x200, %fINPoints%

;QA COUNTER
FileRead, fQAPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% QA.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y335 w99 h20 Left gFRIQA, %A_Space%QA
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y355 w94 h110 readonly -tabstop -VScroll -E0x200, %fQAPoints%

;LOY IN
FileRead, fLoyInPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Loy Install.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y465 w99 h20 Left gFRITIN, %A_Space%Till Install
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y485 w94 h110 readonly -tabstop -VScroll -E0x200, %fLoyInPoints%

;LOY CONFIG
FileRead, fCONPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri% Till Config.txt
Gui, 99P2:font, bold %FColour% s10, Segoe UI
Gui, 99P2:Add, Button, x496 y595 w99 h20 Left gFRITC, %A_Space%Till Config
Gui, 99P2:font,
Gui, 99P2:font, s10 CWhite, Segoe UI	
Gui, 99P2:Add, Edit, x500 y615 w94 h109 readonly -tabstop -VScroll -E0x200, %fCONPoints%



IniRead, mPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%mon%.ini, Count Points, Points,
IniRead, tPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%tue%.ini, Count Points, Points,
IniRead, wPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%wed%.ini, Count Points, Points,
IniRead, thPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%thur%.ini, Count Points, Points,
IniRead, fPoints, G:\Support\Public Staff Folders\Aaron\points\%Name%\%fri%.ini, Count Points, Points,

Gui, 99P2:Add, Button, x15 y732 w100 h20 , %mPoints%
Gui, 99P2:Add, Button, x135 y732 w100 h20 , %tPoints%
Gui, 99P2:Add, Button, x255 y732 w100 h20 , %wPoints%
Gui, 99P2:Add, Button, x375 y732 w100 h20 , %thPoints%
Gui, 99P2:Add, Button, x496 y732 w100 h20 , %fPoints%

totalPoints += mPoints
totalPoints += tPoints
totalPoints += wPoints
totalPoints += thPoints
totalPoints += fPoints

Gui, 99P2:font, 
Gui, 99P2:font, s8 CWhite bold, Segoe UI
;Gui, 99P2:Add, GroupBox, x255 y1 w100 h38 ,
;Gui, 99P2:Add, Text, x260 y1, Export Template
Gui, 99P2:font, bold s24 CWhite, Segoe UI
Gui, 99P2:Add, Text, Center x0 y6 w610 gExportPointTemplate , %totalPoints%/75
;Gui, 99P2:Add, Text, x285 y15 BackGroundTrans , %totalPoints%/75

Gui, 99P2:Show, %Weekly_Cord%w610 h762,FULL WEEK SUMMARY
return

ExportPointTemplate:
return
/*
IfNotExist, C:\AutoHotKey\Files\pointstemplate.xlsx
	{
		FileCopy, G:\Support\Public Staff Folders\Aaron\Update\files\pointstemplate.xlsx, C:\AutoHotKey\Files\pointstemplate.xlsx, 1
	}

FileCopy, C:\AutoHotKey\Files\pointstemplate.xlsx, C:\AutoHotKey\Files\%Name% - %mon% - WEEKLY POINTS.xlsx

FinalSheet = C:\AutoHotKey\Files\%Name% - %mon% - WEEKLY POINTS.xlsx

FormatTime, WeekStarting, dd/mm/yyyy

;============== MONDAY POINTS PER SITE

mDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Data Out.txt", "r" ).Read(), "`n" )
mINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Install.txt", "r" ).Read(), "`n" )
mQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " QA.txt", "r" ).Read(), "`n" )
mLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Loy Install.txt", "r" ).Read(), "`n" )
mCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" mon " Till Config.txt", "r" ).Read(), "`n" )

;============== TUESDAY POINTS PER SITE

tDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Data Out.txt", "r" ).Read(), "`n" )
tINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Install.txt", "r" ).Read(), "`n" )
tQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " QA.txt", "r" ).Read(), "`n" )
tLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Loy Install.txt", "r" ).Read(), "`n" )
tCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" tue " Till Config.txt", "r" ).Read(), "`n" )

;============== WEDNESDAY POINTS PER SITE

wDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Data Out.txt", "r" ).Read(), "`n" )
wINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Install.txt", "r" ).Read(), "`n" )
wQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " QA.txt", "r" ).Read(), "`n" )
wLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Loy Install.txt", "r" ).Read(), "`n" )
wCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" wed " Till Config.txt", "r" ).Read(), "`n" )

;============== THURSDAY POINTS PER SITE

thDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Data Out.txt", "r" ).Read(), "`n" )
thINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Install.txt", "r" ).Read(), "`n" )
thQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " QA.txt", "r" ).Read(), "`n" )
thLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Loy Install.txt", "r" ).Read(), "`n" )
thCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" thur " Till Config.txt", "r" ).Read(), "`n" )

;============== FRIDAY POINTS PER SITE

fDOPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Data Out.txt", "r" ).Read(), "`n" )
fINPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Install.txt", "r" ).Read(), "`n" )
fQAPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " QA.txt", "r" ).Read(), "`n" )
fLoyInPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Loy Install.txt", "r" ).Read(), "`n" )
fCONPoints := StrSplit( FileOpen( "G:\Support\Public Staff Folders\Aaron\points\" Name "\" fri " Till Config.txt", "r" ).Read(), "`n" )

WorkBookPath		:= FinalSheet
objExcel			:= ComObjCreate("Excel.Application")
objWorkBook			:= objExcel.Workbooks.Open(WorkBookPath)
objExcel.Visible	:= FALSE

objExcel.Range("B1").Value := Name
objExcel.Range("B2").Value := WeekStarting

;====== FILL SHEET MONDAY

objExcel.Sheets("Monday").Select

objExcel.Range("A7").Value := mDOPoints[1]
objExcel.Range("A8").Value := mDOPoints[2]
objExcel.Range("A9").Value := mDOPoints[3]
objExcel.Range("A10").Value := mDOPoints[4]
objExcel.Range("A11").Value := mDOPoints[5]
objExcel.Range("A12").Value := mDOPoints[6]
objExcel.Range("A13").Value := mDOPoints[7]
objExcel.Range("A14").Value := mDOPoints[8]

objExcel.Range("B7").Value := mINPoints[1]
objExcel.Range("B8").Value := mINPoints[2]
objExcel.Range("B9").Value := mINPoints[3]
objExcel.Range("B10").Value := mINPoints[4]
objExcel.Range("B11").Value := mINPoints[5]
objExcel.Range("B12").Value := mINPoints[6]
objExcel.Range("B13").Value := mINPoints[7]
objExcel.Range("B14").Value := mINPoints[8]

objExcel.Range("C7").Value := mQAPoints[1]
objExcel.Range("C8").Value := mQAPoints[2]
objExcel.Range("C9").Value := mQAPoints[3]
objExcel.Range("C10").Value := mQAPoints[4]
objExcel.Range("C11").Value := mQAPoints[5]
objExcel.Range("C12").Value := mQAPoints[6]
objExcel.Range("C13").Value := mQAPoints[7]
objExcel.Range("C14").Value := mQAPoints[8]
objExcel.Range("C15").Value := mQAPoints[9]
objExcel.Range("C16").Value := mQAPoints1[0]

objExcel.Range("D7").Value := mLoyInPoints[1]
objExcel.Range("D8").Value := mLoyInPoints[2]
objExcel.Range("D9").Value := mLoyInPoints[3]
objExcel.Range("D10").Value := mLoyInPoints[4]
objExcel.Range("D11").Value := mLoyInPoints[5]
objExcel.Range("D12").Value := mLoyInPoints[6]
objExcel.Range("D13").Value := mLoyInPoints[7]
objExcel.Range("D14").Value := mLoyInPoints[8]

objExcel.Range("E7").Value := mCONPoints[1]
objExcel.Range("E8").Value := mCONPoints[2]
objExcel.Range("E9").Value := mCONPoints[3]
objExcel.Range("E10").Value := mCONPoints[4]
objExcel.Range("E11").Value := mCONPoints[5]
objExcel.Range("E12").Value := mCONPoints[6]
objExcel.Range("E13").Value := mCONPoints[7]
objExcel.Range("E14").Value := mCONPoints[8]

;====== FILL SHEET TUESDAY

objExcel.Sheets("Tuesday").Select

objExcel.Range("A7").Value := tDOPoints[1]
objExcel.Range("A8").Value := tDOPoints[2]
objExcel.Range("A9").Value := tDOPoints[3]
objExcel.Range("A10").Value := tDOPoints[4]
objExcel.Range("A11").Value := tDOPoints[5]
objExcel.Range("A12").Value := tDOPoints[6]
objExcel.Range("A13").Value := tDOPoints[7]
objExcel.Range("A14").Value := tDOPoints[8]

objExcel.Range("B7").Value := tINPoints[1]
objExcel.Range("B8").Value := tINPoints[2]
objExcel.Range("B9").Value := tINPoints[3]
objExcel.Range("B10").Value := tINPoints[4]
objExcel.Range("B11").Value := tINPoints[5]
objExcel.Range("B12").Value := tINPoints[6]
objExcel.Range("B13").Value := tINPoints[7]
objExcel.Range("B14").Value := tINPoints[8]

objExcel.Range("C7").Value := tQAPoints[1]
objExcel.Range("C8").Value := tQAPoints[2]
objExcel.Range("C9").Value := tQAPoints[3]
objExcel.Range("C10").Value := tQAPoints[4]
objExcel.Range("C11").Value := tQAPoints[5]
objExcel.Range("C12").Value := tQAPoints[6]
objExcel.Range("C13").Value := tQAPoints[7]
objExcel.Range("C14").Value := tQAPoints[8]
objExcel.Range("C15").Value := tQAPoints[9]
objExcel.Range("C16").Value := tQAPoints1[0]

objExcel.Range("D7").Value := tLoyInPoints[1]
objExcel.Range("D8").Value := tLoyInPoints[2]
objExcel.Range("D9").Value := tLoyInPoints[3]
objExcel.Range("D10").Value := tLoyInPoints[4]
objExcel.Range("D11").Value := tLoyInPoints[5]
objExcel.Range("D12").Value := tLoyInPoints[6]
objExcel.Range("D13").Value := tLoyInPoints[7]
objExcel.Range("D14").Value := tLoyInPoints[8]

objExcel.Range("E7").Value := tCONPoints[1]
objExcel.Range("E8").Value := tCONPoints[2]
objExcel.Range("E9").Value := tCONPoints[3]
objExcel.Range("E10").Value := tCONPoints[4]
objExcel.Range("E11").Value := tCONPoints[5]
objExcel.Range("E12").Value := tCONPoints[6]
objExcel.Range("E13").Value := tCONPoints[7]
objExcel.Range("E14").Value := tCONPoints[8]

;====== FILL SHEET WEDNESDAY

objExcel.Sheets("Wednesday").Select

objExcel.Range("A7").Value := wDOPoints[1]
objExcel.Range("A8").Value := wDOPoints[2]
objExcel.Range("A9").Value := wDOPoints[3]
objExcel.Range("A10").Value := wDOPoints[4]
objExcel.Range("A11").Value := wDOPoints[5]
objExcel.Range("A12").Value := wDOPoints[6]
objExcel.Range("A13").Value := wDOPoints[7]
objExcel.Range("A14").Value := wDOPoints[8]

objExcel.Range("B7").Value := wINPoints[1]
objExcel.Range("B8").Value := wINPoints[2]
objExcel.Range("B9").Value := wINPoints[3]
objExcel.Range("B10").Value :=twINPoints[4]
objExcel.Range("B11").Value := wINPoints[5]
objExcel.Range("B12").Value := wINPoints[6]
objExcel.Range("B13").Value := wINPoints[7]
objExcel.Range("B14").Value := wINPoints[8]

objExcel.Range("C7").Value := wQAPoints[1]
objExcel.Range("C8").Value := wQAPoints[2]
objExcel.Range("C9").Value := wQAPoints[3]
objExcel.Range("C10").Value := wQAPoints[4]
objExcel.Range("C11").Value := wQAPoints[5]
objExcel.Range("C12").Value := wQAPoints[6]
objExcel.Range("C13").Value := wQAPoints[7]
objExcel.Range("C14").Value := wQAPoints[8]
objExcel.Range("C15").Value := wQAPoints[9]
objExcel.Range("C16").Value := wQAPoints1[0]

objExcel.Range("D7").Value := wLoyInPoints[1]
objExcel.Range("D8").Value := wLoyInPoints[2]
objExcel.Range("D9").Value := wLoyInPoints[3]
objExcel.Range("D10").Value := wLoyInPoints[4]
objExcel.Range("D11").Value := wLoyInPoints[5]
objExcel.Range("D12").Value := wLoyInPoints[6]
objExcel.Range("D13").Value := wLoyInPoints[7]
objExcel.Range("D14").Value := wLoyInPoints[8]

objExcel.Range("E7").Value := wCONPoints[1]
objExcel.Range("E8").Value := wCONPoints[2]
objExcel.Range("E9").Value := wCONPoints[3]
objExcel.Range("E10").Value := wCONPoints[4]
objExcel.Range("E11").Value := wCONPoints[5]
objExcel.Range("E12").Value := wCONPoints[6]
objExcel.Range("E13").Value := wCONPoints[7]
objExcel.Range("E14").Value := wCONPoints[8]

;====== FILL SHEET THURSDAY

objExcel.Sheets("Thursday").Select

objExcel.Range("A7").Value := thDOPoints[1]
objExcel.Range("A8").Value := thDOPoints[2]
objExcel.Range("A9").Value := thDOPoints[3]
objExcel.Range("A10").Value := thDOPoints[4]
objExcel.Range("A11").Value := thDOPoints[5]
objExcel.Range("A12").Value := thDOPoints[6]
objExcel.Range("A13").Value := thDOPoints[7]
objExcel.Range("A14").Value := thDOPoints[8]

objExcel.Range("B7").Value := thINPoints[1]
objExcel.Range("B8").Value := thINPoints[2]
objExcel.Range("B9").Value := thINPoints[3]
objExcel.Range("B10").Value := thINPoints[4]
objExcel.Range("B11").Value := thINPoints[5]
objExcel.Range("B12").Value := thINPoints[6]
objExcel.Range("B13").Value := thINPoints[7]
objExcel.Range("B14").Value := thINPointstt[h]

objExcel.Range("C7").Value := thQAPoints[1]
objExcel.Range("C8").Value := thQAPoints[2]
objExcel.Range("C9").Value := thQAPoints[3]
objExcel.Range("C10").Value := thQAPoints[4]
objExcel.Range("C11").Value := thQAPoints[5]
objExcel.Range("C12").Value := thQAPoints[6]
objExcel.Range("C13").Value := thQAPoints[7]
objExcel.Range("C14").Value := thQAPoints[8]
objExcel.Range("C15").Value := thQAPoints[9]
objExcel.Range("C16").Value := thQAPoints1[0]

objExcel.Range("D7").Value := thLoyInPoints[1]
objExcel.Range("D8").Value := thLoyInPoints[2]
objExcel.Range("D9").Value := thLoyInPoints[3]
objExcel.Range("D10").Value := thLoyInPoints[4]
objExcel.Range("D11").Value := thLoyInPoints[5]
objExcel.Range("D12").Value := thLoyInPoints[6]
objExcel.Range("D13").Value := thLoyInPoints[7]
objExcel.Range("D14").Value := thLoyInPoints[8]

objExcel.Range("E7").Value := thCONPoints[1]
objExcel.Range("E8").Value := thCONPoints[2]
objExcel.Range("E9").Value := thCONPoints[3]
objExcel.Range("E10").Value := thCONPoints[4]
objExcel.Range("E11").Value := thCONPoints[5]
objExcel.Range("E12").Value := thCONPoints[6]
objExcel.Range("E13").Value := thCONPoints[7]
objExcel.Range("E14").Value := thCONPoints[8]

;====== FILL SHEET FRIDAY

objExcel.Sheets("Friday").Select

objExcel.Range("A7").Value := fDOPoints[1]
objExcel.Range("A8").Value := fDOPoints[2]
objExcel.Range("A9").Value := fDOPoints[3]
objExcel.Range("A10").Value := fDOPoints[4]
objExcel.Range("A11").Value := fDOPoints[5]
objExcel.Range("A12").Value := fDOPoints[6]
objExcel.Range("A13").Value := fDOPoints[7]
objExcel.Range("A14").Value := fDOPoints[8]

objExcel.Range("B7").Value := fINPoints[1]
objExcel.Range("B8").Value := fINPoints[2]
objExcel.Range("B9").Value := fINPoints[3]
objExcel.Range("B10").Value :=tfINPoints[4]
objExcel.Range("B11").Value := fINPoints[5]
objExcel.Range("B12").Value := fINPoints[6]
objExcel.Range("B13").Value := fINPoints[7]
objExcel.Range("B14").Value := fINPoints[8]

objExcel.Range("C7").Value := fQAPoints[1]
objExcel.Range("C8").Value := fQAPoints[2]
objExcel.Range("C9").Value := fQAPoints[3]
objExcel.Range("C10").Value := fQAPoints[4]
objExcel.Range("C11").Value := fQAPoints[5]
objExcel.Range("C12").Value := fQAPoints[6]
objExcel.Range("C13").Value := fQAPoints[7]
objExcel.Range("C14").Value := fQAPoints[8]
objExcel.Range("C15").Value := fQAPoints[9]
objExcel.Range("C16").Value := fQAPoints1[0]

objExcel.Range("D7").Value := fLoyInPoints[1]
objExcel.Range("D8").Value := fLoyInPoints[2]
objExcel.Range("D9").Value := fLoyInPoints[3]
objExcel.Range("D10").Value := fLoyInPoints[4]
objExcel.Range("D11").Value := fLoyInPoints[5]
objExcel.Range("D12").Value := fLoyInPoints[6]
objExcel.Range("D13").Value := fLoyInPoints[7]
objExcel.Range("D14").Value := fLoyInPoints[8]

objExcel.Range("E7").Value := fCONPoints[1]
objExcel.Range("E8").Value := fCONPoints[2]
objExcel.Range("E9").Value := fCONPoints[3]
objExcel.Range("E10").Value := fCONPoints[4]
objExcel.Range("E11").Value := fCONPoints[5]
objExcel.Range("E12").Value := fCONPoints[6]
objExcel.Range("E13").Value := fCONPoints[7]
objExcel.Range("E14").Value := fCONPoints[8]

objExcel.Sheets("Overall").Select

objWorkBook.Save
objExcel.Quit()
objExcel 	:= ""

gosub, EmailDavePoints

EmailDavePoints:
attach			:= FinalSheet

email 			:= ComObjActive("Outlook.Application").CreateItem(0) ;0 is email, can use other stuff
email.To 		:= "dhobden@intellipharm.com.au"
email.Subject 	:= Name " - " mon " - WEEKLY POINTS LIST "
email.Body 		:=
email.Attachments.add(attach)

email.Display

reload
return

FULLWEEKSAVEPOS:
Gui, Destroy
Gui, 99Pos:Color, 1d1f21, 383D46
Gui, 99Pos:font, Bold cE8EBF5 s18, Segoe UI
Gui, 99Pos:Add, Text, Center x1 y20 w610, SET POSITION AND CLICK SAVE
Gui, 99Pos:font,
Gui, 99Pos:font, Bold cE8EBF5 s12, Segoe UI
Gui, 99Pos:Add, Button, x232 y100 w120 h40 gWEEKLYSAVE, SAVE
Gui, 99Pos:Show, x0 y0 w610 h762, Set Position
return
*/