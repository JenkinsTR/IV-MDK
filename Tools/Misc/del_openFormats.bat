@ECHO OFF

@SETLOCAL enableextensions
@CD /d "%~dp0"

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

DEL /s /F %EXT1%
DEL /s /F %EXT2%
DEL /s /F %EXT3%
DEL /s /F %EXT4%
DEL /s /F %EXT5%
DEL /s /F %EXT6%
DEL /s /F %EXT7%
DEL /s /F %EXT8%
DEL /s /F %EXT9%
DEL /s /F %EXT10%
DEL /s /F %EXT11%
DEL /s /F %EXT12%
DEL /s /F %EXT13%
DEL /s /F %EXT14%
DEL /s /F %EXT15%
DEL /s /F %EXT16%

PAUSE