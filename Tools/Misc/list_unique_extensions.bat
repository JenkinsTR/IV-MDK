@echo off
setlocal enabledelayedexpansion

set "folder=%~dp0"
set "output_file=%~dp0\ext_list.txt"

for /r "%folder%" %%F in (*) do (
    set "filename=%%~nxF"
    set "extension=%%~xF"
	echo Found extension: %%~xF
    if defined extension (
        set "extension=!extension:~1!"
        set "extensions[!extension!]=1"
    )
)

echo Unique file extensions in %folder% and its subfolders:
(for /f "tokens=2 delims=[]" %%E in ('set extensions[') do echo %%E) > "%output_file%"

endlocal