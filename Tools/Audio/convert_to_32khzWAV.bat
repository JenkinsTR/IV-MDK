@echo off
set FFmpegPath="K:\GitHub\IV-MDK\Tools\Audio\ffmpeg.exe"

if "%~1"=="" (
    echo No file specified.
    pause
    exit /b
)

if not exist %FFmpegPath% (
    echo FFmpeg not found at %FFmpegPath%.
    pause
    exit /b
)

echo Converting %~nx1 to 32kHz, L R, 16-bit signed PCM...

%FFmpegPath% -i "%~1" -ar 32000 -ac 2 -sample_fmt s16 "%~dpn1_converted.wav"

echo Conversion complete.
pause
exit /b
