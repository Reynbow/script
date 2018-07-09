    ;I use these three lines for every single script.
    #Persistent                 ;This keeps the script running even if it finishes running all its code (afaik)
    #SingleInstance Force       ;This makes it so if you run the script a second time, it'll close the old version and open the new instance
    #NoEnv                      ;Just makes the script not check empty variables, I dunno, I just always use it

;Writtn By: Hellbent aka CivReborn
;Written for: CivReborn Youtube Channel- https://www.youtube.com/user/CivReborn
;Date Written: Nov 26th, 2017
;Paste: https://pastebin.com/HxgmZVXF
#SingleInstance,Force
global StopWatch_State:=0,Pauseit:=0,Sound_Setting:=1,Tx:=600,Ty:=100,myHour:=A_Hour,Alarm_Off:=0,colour_List:= ["Lime","Yellow","Red"],lnum:=1
FormatTime, Time1,h , h tt
StringRight,time2,time1,2
myHour>=13?myHour-=12:myHour<1?myHour+=12
Clock_Gui()
SetTimer,Main_Clock,1000
return
Turn_Off_Alarm:
	Alarm_Off:=1
	return
Watch_Alarm:
	New_Second:=(A_TickCount-Alarm_Tick)//1000
	if(New_Second>Last_Second){
		Last_Second:=New_Second
		GuiControl,1:,Alarm_Progress,% Last_Second
		update_edit3_1:=(Alarm_Seconds-Last_Second)//60,update_edit3_2:=(Alarm_Seconds-Last_Second)-(update_edit3_1*60),update_Edit3_1<10?update_edit3_1:="0" update_edit3_1,update_Edit3_2<10?update_edit3_2:="0" update_edit3_2
		GuiControl,3:,edit3,% update_edit3_1 " : " update_edit3_2
	}
	if(Last_Second>=Alarm_Seconds){
		if(Sound_Setting=1){
			SetTimer,Watch_Alarm,Off
			Gui,1:Show
			Gui,4:Destroy
			while(!GetKeyState("RButton"))
				SoundBeep,850,500
			GuiControl,1:,Alarm_Progress,0
		}else if(Sound_Setting=2){
				SetTimer,Watch_Alarm,Off
				Gui,1:Show
				Gui,4:Destroy
				Flashing()
				while(Alarm_Off=0){
					Gui,5:Color,% colour_List[lnum]
					lnum++
					(lnum=4)?(lnum:=1)
					sleep,500
				}
			GuiControl,1:,Alarm_Progress,0
			Gui,5:Destroy
		}else if(Sound_Setting=3){
			SetTimer,Watch_Alarm,Off
			Gui,1:Show
			Gui,4:Destroy
			Flashing()
			while(Alarm_Off=0&&!GetKeyState("RButton")){
				Gui,5:Color,% colour_List[lnum]
				lnum++
				(lnum=4)?(lnum:=1)
				SoundBeep,850,500
			}
			GuiControl,1:,Alarm_Progress,0
			Gui,5:Destroy
		}
	}
	return
Set_Alarm_Time:
	if(Time_Radio=1)
		Alarm_Seconds:=3600
	else if(Time_Radio=2)
		Alarm_Seconds:=(Min_Slide*60)+Sec_Slide
	GuiControl,1:+Range0-%Alarm_Seconds%,Alarm_Progress
	GuiControl,1:,Alarm_Progress,0
	Last_Second:=0,Alarm_Tick:=A_TickCount,Alarm_Off:=0
	SetTimer,Watch_Alarm,333
	Gui,3:Destroy
	return
Cancel:
	Gui,3:Destroy
	return
Submit_All:
	Gui,3:Submit,NoHide
	GuiControl,3:,edit1,% Min_Slide
	GuiControl,3:,edit2,% Sec_Slide
	if(Time_Radio=1)
		GuiControl,3:,edit3,60 : 00
	else
		GuiControl,3:,edit3,% Min_Slide " : " Sec_Slide
	return
Reset:
	Gui,3:Destroy
	SetTimer,Watch_Alarm,Off
	GuiControl,1:,Alarm_Progress,0
	return
set_Alarm:
	Gui,3:Destroy
	Gui,3:+AlwaysOnTop -Caption +Owner1 +Border
	Gui,3:Color,0x72B4B1
	Gui_Control_Types := ["Radio","Radio","Groupbox","Text","Slider","Edit","Groupbox","Text","Slider","Edit","Groupbox","Edit","Groupbox","Button","Button","Button"]
	Control_Text:= ["1 Hour","Set Amount",Fake_Value,"Mins:",Fake_Value,Fake_Value,Fake_Value,"Secs:",Fake_Value,Fake_Value,Fake_Value,"60 : 00",Fake_Value,"Set","Reset","Back"],Fake_Value:=""
	for k, v in ["x10 y10 Checked vTime_Radio gSubmit_All","x100 y10 gSubmit_All","x10 y30 w200 h60 Section","xs+10 ys+20 w30,Mins:","x+10 w100 Range0-59 AltSubmit vMin_Slide gSubmit_All","x+10 w30 Center ReadOnly -E0x200 vedit1","x10 y100 w200 h60 Section","xs+10 ys+20 w30","x+10 w100 Range0-59 AltSubmit vSec_Slide gSubmit_All","x+10 w30 Center ReadOnly -E0x200 vedit2","x10 y160 w200 h40 Section","xs+10 ys+13 w180 h20 ReadOnly Center -E0x200 vedit3","x10 y200 w200 h40 Section","xs+10 ys+13 w50 h20 gSet_Alarm_Time","x+15 ys+13 w50 h20 gReset","x+15 ys+13 w50 h20 gCancel"]
		Gui,3:Add,% Gui_Control_Types[A_Index],% v ,% Control_Text[A_Index]
	gosub,Submit_All
	Gui,3:Show,AutoSize ,Alarm Setup
	return
Show_StopWatch:
	GuiControl,1:Hide,Main_Clock_Time
	GuiControl,1:Show,Stop_Watch
	Loop 6
		GuiControl,1:Show,SW%A_Index%
	Loop 3
		GuiControl,2:Show,% "SW" A_Index+6
	return
Show_Clock:
	GuiControl,1:Hide,Stop_Watch
	Loop 6
		GuiControl,1:Hide,SW%A_Index%
	Loop 3
		GuiControl,2:Hide,% "SW" A_Index+6
	GuiControl,1:Show,Main_Clock_Time	
	return	
Start_StopWatch:
	if(StopWatch_State=0){
		StopWatch_State:=1,Pauseit:=0,Start_Tick:=A_TickCount
		SetTimer,StopWatch_Timer,10
	}
	return
Pause_StopWatch:
	if(StopWatch_State=1)
		Pauseit:=!Pauseit,Start_Tick:=A_TickCount-Start_Tick
	return
Reset_StopWatch:
	StopWatch_State:=0
	Pauseit:=0
	SetTimer,StopWatch_Timer,Off
	GuiControl,1:,Stop_Watch, 000 : 00 : 00 : 000
	return
StopWatch_Timer:
	Stop_Hour:=((A_TickCount-Start_Tick)//3600000) 
	Stop_Min:=(((A_TickCount-Start_Tick)-(Stop_Hour*3600000))//60000) 
	Stop_Sec:=(((A_TickCount-Start_Tick)-(Stop_Hour*3600000)-(Stop_Min*60000))//1000) 
	Stop_MS:=(((A_TickCount-Start_Tick)-(Stop_Hour*3600000)-(Stop_Min*60000)-(Stop_Sec*1000)))
	Stop_Hour<10?Stop_Hour:="00" Stop_Hour
	Stop_Min<10?Stop_Min:="0" Stop_Min
	Stop_Sec<10?Stop_Sec:="0" Stop_Sec
	Stop_MS<100?Stop_MS:="0" Stop_MS
	if(Pauseit=0)
	GuiControl,1:,Stop_Watch,% Stop_Hour " : " Stop_Min " : " Stop_Sec " : " Stop_Ms 
	return
GuiClose:
	ExitApp
Sounds:
	Sound_Setting++
	Sound_Setting>=4?Sound_Setting:=1
	(Sound_Setting=1)?(HList:=["1:Show","1:Show","1:Show","1:Show","1:Hide","1:Hide","1:Hide"])
	:(Sound_Setting=2)?(HList:=["1:Hide","1:Hide","1:Hide","1:Hide","1:Show","1:Show","1:Hide"])
	:(Sound_Setting=3)?(HList:=["1:Hide","1:Hide","1:Hide","1:Hide","1:Show","1:Hide","1:Show"])
	for,k,v in HList
		GuiControl,% v,SG%A_Index%	
	return
Move_Window:
	PostMessage,0xA1,2
	While(GetKeyState("LButton"))
		sleep 10
	WinGetPos,wx,wy,,,Hellbents StopWatch/Alarm TL
	Gui,1:Show,x%wx% y%wy%
	return
Minimize_Window:
	Gui,1:Minimize
	return
Move_Tab:
	PostMessage,0xA1,2
	While(GetKeyState("LButton"))
		sleep,10
	WinGetPos,Tx,Ty,,,StopWatch Tab
	return
4Guicontextmenu:
	Gui,1:Show
	Gui,4:Destroy
	return
2Guicontextmenu:
	Gui,1:Minimize
	Gui,4:Destroy
	Gui,3:Destroy
	Gui,4:+AlwaysOnTop -Caption +Border +Owner1
	Gui,4:Color,0x72B4B1
	Gui,4:Font,cBlack s8 Bold Q5,Segoe UI	
	Gui,4:Add,Text,x0 y3 w40 h20 Center gMove_Tab,HBSW
	Gui,4:Show,x%Tx% y%Ty% w40 h20,StopWatch Tab
	return
Main_Clock:
	myHour:=A_Hour
	myHour>=13?myHour-=12:myHour<1?myHour+=12
	FormatTime, Time1,h , h tt
	StringRight,time2,time1,2
	GuiControl,1:,Main_Clock_Time,% MyHour " : " A_Min " : " A_Sec  "   " Time2 
	return
Flashing(){
	Gui,5:Destroy
	Gui,5:+AlwaysOnTop -Caption +Border +Owner1
	Gui,5:Color,Red
	Gui,5:Font,s12 Bold Q5,Segoe UI
	Gui,5:Add,Button,x120 y270 w60 h25 gTurn_Off_Alarm,Ok
	Gui,5:Show,w300 h300
}
Clock_Gui(){
	global
	Gui,1:+AlwaysOnTop -Caption 
	Gui,2:+AlwaysOnTop -Caption +Owner1 +LastFound
	WinSet,Transparent,1
	Gui,2:Color,Blue
	Gui,1:Color,Black,0x72B4B1
	Gui,1:Add,Edit,x-100 y0 w10 h10
	Gui,1:Add,Progress,x0 y0 w300 h65 BackgroundBlack c0x72B4B1,100
	Gui,1:Font,cBlack s12 underline Bold Q5 ,Nirmala UI
	Gui,1:Add,Text,x25 y0  r1 Backgroundtrans ,Hellbents StopWatch
	For k,v in ["x5 y15 w2 h5 Backgroundaa8800 vSG1","x+1 y11 w2 h9 Backgroundaaff00 vSG2","x+1 y7 w2 h13 Background00ff00 vSG3","x+1 y4 w2 h16 Background00ff00 vSG4"]
		Gui,1:Add,Progress,% v
	Gui,1:Font
	Gui,1:Font,cLime s9 Bold Q5 ,Nirmala UI
	Gui,1:Add,Progress,x5 y5 w15 h15 BackgroundBlack c555555 Hidden vSG5,100
	Gui,1:Add,Text,x5 y5 w15 r1 Center BackgroundTrans Hidden vSG6,M
	Gui,1:Font
	Gui,1:Font,cLime s12 Bold Q5 ,Nirmala UI
	Gui,1:Add,Text,x5 y0 w15 r1 Center BackgroundTrans Hidden vSG7,+
	Gui,1:Font
	Gui,1:Font,cYellow s9 Bold Q5 ,Nirmala UI
	For k,v in ["x200 y5 w15 h15 BackgroundBlack c555555","x220 y5 w15 h15 BackgroundBlack c555555","x240 y5 w15 h15 BackgroundBlack c555555","x260 y5 w15 h15 BackgroundBlack c555555","x280 y5 w15 h15 BackgroundBlack c555555"]
		Gui,1:Add,Progress,% v ,100
	Button_Text1 := ["C","A","S","-","X"]
	For k,v in ["x200 y5 w15 r1 Center BackgroundTrans","x220 y5 w15 r1 Center BackgroundTrans","x240 y5 w15 r1 Center BackgroundTrans","x260 y5 w15 r1 Center BackgroundTrans","x280 y5 w15 r1 Center BackgroundTrans"]
		Gui,1:Add,Text,% v ,% Button_Text1[A_Index]
	Gui,1:Font
	Gui,1:Font,cBlack s14  Bold Q5 ,Nirmala UI
	Gui,1:Add,Edit, x2 y25 w296 h20 Center -E0x200 BackgroundTrans vMain_Clock_Time ,% MyHour " : " A_Min " : " A_Sec  "   " Time2
	Gui,1:Add,Edit,x10 y25 w180 h20  BackgroundTrans -E0x200 Hidden vStop_Watch,000 : 00 : 00 : 000
	For,k,v in ["x192 y27 w22 h22 BackgroundBlack csilver Hidden vSW1","x229 y27 w22 h22 BackgroundBlack csilver Hidden vSW3","x266 y27 w22 h22 BackgroundBlack csilver Hidden vSW5"]
		Gui,1:Add,Progress,% v ,100
	NL1:= ["S","P","R"]	
	for,k,v in ["x192 y25 w22 r1 Center Backgroundtrans Hidden vSW2","x229 y25 w22 r1 Center Backgroundtrans Hidden vSW4","x266 y25 w22 r1 Center Backgroundtrans Hidden vSW6"]
		Gui,1:Add,Text,% v,% NL1[A_Index]
	Gui,1:Add,Progress,x10 y53 w280 h10 BackgroundBlack cred vAlarm_Progress range0-1000,
	for,k,v in ["x1 y0 w20 h23 Border gSounds","x25 y0 w170 h20 Border gMove_Window","x200 y5 w15 h15 Border gShow_Clock","x220 y5 w15 h15 Border gSet_Alarm","x240 y5 w15 h15 Border gShow_StopWatch","x260 y5 w15 h15 Border gMinimize_Window","x280 y5 w15 h15 Border gGuiClose","x192 y27 w22 h22 Border Hidden vSW7 gStart_StopWatch","x229 y27 w22 h22 Border Hidden vSW8 gPause_StopWatch","x266 y27 w22 h22 Border Hidden vSW9 gReset_StopWatch"]
		Gui,2:Add,Text,% v
	Gui,1:Show,x900 y50 w300 h65 ,Hellbents StopWatch/Alarm BL
	Gui,2:Show,x900 y50 w300 h65 ,Hellbents StopWatch/Alarm TL
}