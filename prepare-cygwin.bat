@echo off

IF [%1]==[] (

@echo "Parameter Cygwin Path needed"
pause
goto :end
)
if not exist %1 (

@echo "Cygwin Path INVALID"
pause
goto :end
)

:: For debug
start

SET CYGWINROOT=%1

@echo Preparing cygwin for genode
@echo Using root %CYGWINROOT%
@echo Copy scripts to cygwin

xcopy /s /y "%~dp0Scripts" "%CYGWINROOT%\CygwinPrepare\"

::copy Config
copy  /y "%~dp0config.txt" "%CYGWINROOT%\CygwinPrepare\config"

@echo Apply patches to cygwin

xcopy /s /y "%~dp0Patches" "%CYGWINROOT%\"



@echo Starting cygwin prepare script



C:
chdir "%CYGWINROOT%\bin"


::Time to go to cygwin bash ;-)
bash --login -c "/CygwinPrepare/cygwin-prepare.sh"


:end