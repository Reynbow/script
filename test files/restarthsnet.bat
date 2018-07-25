@echo off
c:
cd \intpharm

IF EXIST \intpharm\Hsnet\hsnet.exe GOTO HSNETRESTART

:HSNETRESTART
echo Restarting Intellipharm's HSNET.exe
taskkill /F /IM HSNET.EXE > NUL 2>NUL
net stop HSNET 2>NUL
taskkill /F /IM HSNET9.EXE 2>NUL
net stop HSNET9 2>NUL
ping -n 5 localhost >NUL
cd \intpharm\Hsnet\
START hsnet.exe

cls
goto END

:END
EXIT