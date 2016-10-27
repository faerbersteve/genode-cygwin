cls
@echo off

SET CYGWIN_ARCH = x32
SET "DOWNLOADURL=http://cygwin.com/setup-x86.exe"
SET "SETUPFILENAME=%~dp0\cygwin-setup-x86.exe"
SET "ROOTDIR=C:\cygwin"

SET /P ANSWER=Do you want to use cygwin x64 (Y/N)? 


if /i {%ANSWER%}=={y} (

@echo Start downloading cygwin64

SET "ROOTDIR=C:\cygwin64"
SET CYGWIN_ARCH = x64
SET "DOWNLOADURL=http://cygwin.com/setup-x86_64.exe"
SET "SETUPFILENAME=%~dp0\cygwin-setup-x86_64.exe"

goto :startdownload
) 

if /i {%ANSWER%}=={n} (goto :download32bit) 

@echo "No valid answer"
pause
goto :end

:download32bit
@echo Start downloading cygwin

SET "DOWNLOADURL=http://cygwin.com/setup-x86.exe"
SET "SETUPFILENAME=%~dp0\cygwin-setup-x86.exe"

:startdownload

if not exist "%SETUPFILENAME%" (
@echo off
bitsadmin /transfer "Cygwin" /download /priority normal "%DOWNLOADURL%" "%SETUPFILENAME%" > bits.log
@echo on
)

@echo Start installing cygwin


"%SETUPFILENAME%" -s "http://cygwin.mirror.constant.com" -R "%ROOTDIR%" -l "%ROOTDIR%\CYGWINPACKAGES" -P wget -q -B > cygwin_installlog.txt

@echo Cygwin installed

"Prepare-Cygwin.bat" "%ROOTDIR%"

:end