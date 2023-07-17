@ECHO OFF
REM Frequently changed
SET TYP=DECOMPILED
SET EXT1=*.child
SET EXT2=*.dds
SET EXT3=*.light
SET EXT4=*.mesh
SET EXT5=*.oad
SET EXT6=*.obd
SET EXT7=*.obn
SET EXT8=*.odd
SET EXT9=*.odr
SET EXT10=*.oft
SET EXT11=*.onim
SET EXT12=*.opl
SET EXT13=*.otd
SET EXT14=*.skel
SET EXT15=*.onv
SET EXT16=*.oxt

REM Perma
SET TTL=Copy Utility [%TYP%]
SET DIR=..\_%TYP%
SET CPR=© 2008-2023 JMDigital. All Rights Reserved.
TITLE %TTL%

REM Make the Target directory
MKDIR %DIR%

REM Do the (x)copy
XCOPY "%EXT1%" %DIR% /S
XCOPY "%EXT2%" %DIR% /S
XCOPY "%EXT3%" %DIR% /S
XCOPY "%EXT4%" %DIR% /S
XCOPY "%EXT5%" %DIR% /S
XCOPY "%EXT6%" %DIR% /S
XCOPY "%EXT7%" %DIR% /S
XCOPY "%EXT8%" %DIR% /S
XCOPY "%EXT9%" %DIR% /S
XCOPY "%EXT10%" %DIR% /S
XCOPY "%EXT11%" %DIR% /S
XCOPY "%EXT12%" %DIR% /S
XCOPY "%EXT13%" %DIR% /S
XCOPY "%EXT14%" %DIR% /S
XCOPY "%EXT15%" %DIR% /S
XCOPY "%EXT16%" %DIR% /S

REM Delete source files (CAUTION! - READ BELOW)
DEL /s %EXT1%
DEL /s %EXT2%
DEL /s %EXT3%
DEL /s %EXT4%
DEL /s %EXT5%
DEL /s %EXT6%
DEL /s %EXT7%
DEL /s %EXT8%
DEL /s %EXT9%
DEL /s %EXT10%
DEL /s %EXT11%
DEL /s %EXT12%
DEL /s %EXT13%
DEL /s %EXT14%
DEL /s %EXT15%
DEL /s %EXT16%

REM Move Target dir back to Source dir (MUST COME AFTER DEL COMMAND !!!)
REM MOVE "%DIR%" "%~dp0"

REM Done
ECHO ------------------------
ECHO %TTL% %CPR%
ECHO ------------------------
ECHO Grab Completed at %TIME% - %DATE%
PAUSE
EXIT