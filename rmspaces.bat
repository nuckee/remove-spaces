@echo off

setlocal enabledelayedexpansion

set filename=%1

echo File: %filename%


if "%filename%"=="" (
  echo 파일 이름을 지정해야 합니다.
  exit /b
)

if not exist "%filename%" (
  echo 파일이 존재하지 않습니다.
  exit /b
)

> output.txt (
  for /f "usebackq delims=" %%a in ("%filename%") do (
    set "line=%%a"
    set "line=!line: =!"
    set "line=!line:	=!"
    echo !line!
  )
)
move /y output.txt "output_%filename%"

echo 공백이 제거된 파일이 생성되었습니다.


echo Script execution complete.

exit /b 0


