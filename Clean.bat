@echo off
cls

echo Please wait...

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
