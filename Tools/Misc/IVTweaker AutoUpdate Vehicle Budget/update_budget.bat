@ECHO OFF
@SetLocal EnableDelayedExpansion

REM Paths to files
SET "GTAIV=U:\SteamLibrary\steamapps\common\Grand Theft Auto IV\GTAIV"
SET "INI_FILE=%GTAIV%\IVTweaker.ini"
SET "FILE1_PATH=%GTAIV%\modloader\ausmod\vehicles.img"
SET "FILE2_PATH=%GTAIV%\pc\models\cdimages\vehicles.img"

REM Get the sizes of the vehicles.img files
FOR %%F IN ("%FILE1_PATH%" "%FILE2_PATH%") DO (
    FOR /F "usebackq" %%A IN ('%%~zF') DO (
        SET "SIZE=%%A"
        SET "FORMATTED_SIZE=!SIZE:,=!"
        ECHO Size of "%%~F": !FORMATTED_SIZE!
        SET /A "TOTAL_SIZE+=SIZE"
    )
)

REM PowerShell script path
SET "PS_SCRIPT=%GTAIV%\modloader\UpdateVehicleBudget.ps1"

REM Backup INI file
SET "INI_BACKUP=!INI_FILE!.bak"
COPY /Y "!INI_FILE!" "!INI_BACKUP!" >NUL

REM Call the PowerShell script to update the VehicleBudget value and pass the values as arguments
powershell.exe -ExecutionPolicy Bypass -File "%PS_SCRIPT%" -iniFile "%INI_FILE%" -file1Path "%FILE1_PATH%" -file2Path "%FILE2_PATH%" -newVehicleBudget "%TOTAL_SIZE%"

REM Display the updated VehicleBudget value
ECHO Updated VehicleBudget value: %TOTAL_SIZE%

ENDLOCAL
PAUSE
EXIT
