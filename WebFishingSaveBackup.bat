@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
color 0a
title WebFishing Save Backup Script by LostSystems
:noinput
cls
echo Do you want to backup your save or restore it?
set /p backuprestore=(Backup or Restore):
if "%backuprestore%" == "Backup" goto Backup
if "%backuprestore%" == "Restore" goto Restore
goto noinput
cls
:Backup
cls
echo Backing up webfishing_2_newver folder contents to the root of your C: drive in WebFishingSaveBackup....
echo.
echo.
echo.
mkdir C:\WebFishingSaveBackup
xcopy "%APPDATA%\Godot\app_userdata\webfishing_2_newver" C:\WebFishingSaveBackup /E
echo.
echo.
echo Review the copied files to make sure webfishing_migrated_data.save and webfishing_migrated_data_backup.save
echo were copied over. Pressing any key will end the script
pause
exit
:Restore
cls
echo Restoring the save files from WebFishingSaveBackup to webfishing_2_newver....
echo (Which will either ask you to overwrite them or will copy them over directly)
echo.
echo.
echo.
xcopy C:\WebFishingSaveBackup "%APPDATA%\Godot\app_userdata\webfishing_2_newver"
echo.
echo.
pause
exit