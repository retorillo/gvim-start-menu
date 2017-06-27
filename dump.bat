@echo off
set esc=
set hiveroot=HKEY_CLASSES_ROOT\Directory\Background\shell\vim
if "%1"=="install" goto install
if "%1"=="uninstall" goto uninstall
echo %esc%[101;93mInvalid parameter: %1%esc%[0m >&2
pause
goto exit
:install
  for %%I in (gvim.exe) do set gvimpath=%%~$PATH:I
  if "%gvimpath%"=="" (
    echo %esc%[101;93mgvim.exe is not found on this machine%esc%[0m >&2
    exit /b 1
  )
  set gvimpath=%gvimpath:\=\\%
  echo Windows Registry Editor Version 5.00
  echo.
  echo [%hiveroot%]
  echo @="&Vim"
  echo "Icon"="%gvimpath%"
  echo.
  echo [%hiveroot%\command]
  echo @="%gvimpath%"
  goto exit
:uninstall
  echo Windows Registry Editor Version 5.00
  echo.
  echo [-%hiveroot%]
  echo.
  echo [-%hiveroot%\command]
:exit
