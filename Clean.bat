@echo off
cls

echo Please wait...

NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script needs to be run with administrator privileges.
    echo Please right-click on the script and select "Run as administrator".
    pause
    exit
)

set "keyword=B_B_Q_"

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\" (
        cd /d "%%d:\"
        for /r %%f in (*%keyword%*) do (
            del "%%f" /q
        )
    )
)

echo Done!
