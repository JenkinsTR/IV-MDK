@ECHO OFF
REM Frequently changed
SET TYP=DDS
SET EXT1=*.dds

REM Perma
SET TTL=Copy Utility [%TYP%]
SET DIR=..\%TYP%
SET CPR=© 2008-2023 JMDigital. All Rights Reserved.
TITLE %TTL%

REM Make the Target directory
MKDIR %DIR%

REM Do the (x)copy
XCOPY "%EXT1%" %DIR% /S

REM Delete source files (CAUTION! - READ BELOW)
DEL /s %EXT1%

REM Move Target dir back to Source dir (MUST COME AFTER DEL COMMAND !!!)
REM MOVE "%DIR%" "%~dp0"

REM Done
ECHO ------------------------
ECHO %TTL% %CPR%
ECHO ------------------------
ECHO Grab Completed at %TIME% - %DATE%
PAUSE
EXIT