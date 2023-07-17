@echo off
setlocal enabledelayedexpansion

REM Replace with your ImageMagick installation path
set "IMAGEMAGICK_PATH=C:\Program Files\ImageMagick-7.1.0-Q16-HDRI"

REM Get the directory where the batch file was launched from
set "SOURCE_FOLDER=%~dp0"

cd /d "%SOURCE_FOLDER%"

set "totalFiles=0"
for /r %%f in (*.dds) do (
  set /a totalFiles+=1
)

setlocal enabledelayedexpansion
set "progress=0"
set "skippedFiles=0"
set "clearCount=0"
set "clearThreshold=1000"

for /r %%f in (*.dds) do (
  set /a progress+=1
  call :ProgressBar !progress! !totalFiles!

  echo Processing file !progress! of !totalFiles!...
  title Processing: !progress! / !totalFiles!

  set "inputFile=%%f"
  set "outputFile=%%~dpnf.tga"

  if exist "!outputFile!" (
    echo Output file already exists. Skipping.
    set /a skippedFiles+=1
  ) else (
    echo Converting "%%f"...
    "%IMAGEMAGICK_PATH%\magick.exe" "!inputFile!" -format tga "!outputFile!"
  )

  set /a clearCount+=1
  if !clearCount! equ !clearThreshold! (
    cls
    set "clearCount=0"
  )
)

echo Conversion complete.
echo Skipped files: !skippedFiles!
pause
exit /b

:ProgressBar
setlocal
set /a percent=%1 * 100 / %2
set /a barWidth=50
set /a completedChars=(%1 * %barWidth + %2 / 2) / %2
set /a remainingChars=%barWidth - %completedChars

set "completedBar="
for /L %%a in (1, 1, %completedChars%) do set "completedBar=!completedBar!#"

set "remainingBar="
for /L %%a in (1, 1, %remainingChars%) do set "remainingBar=!remainingBar!."

echo Processing: [!completedBar!!remainingBar!] %percent%%%
endlocal
exit /b
