@ECHO OFF

REM Get the directory of the batch file
SET "TOOL_DIR=K:\GitHub\IV-MDK\Tools\Models\JMD-MTL-MissingTextures-Finder"
SET "MTL_DIR=%~dp0"

REM Find missing textures, create backup copies of the original MTL files, locate the largest versions, and update the MTL files
python "%TOOL_DIR%\mtl_texture_management.py" -i "%MTL_DIR%" -u -b -L

PAUSE
EXIT
