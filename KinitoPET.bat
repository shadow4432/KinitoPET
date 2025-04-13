@echo off
setlocal enabledelayedexpansion

:: Prompt the user
echo Can I see your face? (yes/no)
set /p input=

:: Convert input to lowercase for consistency
if /I "%input%"=="yes" goto OpenCamera
if /I "%input%"=="no" goto OpenCamera

:: If input is invalid, exit
echo Invalid response. Exiting...
exit

:OpenCamera
start microsoft.windows.camera:
timeout /t 2 /nobreak >nul

:: Play the MP3 file using Windows Media Player
start wmplayer "C:\Users\daymi\Desktop\Kinito\audio.mp3"

:: Wait for 12 seconds before closing both applications
timeout /t 12 /nobreak >nul

:: Close Windows Camera and Windows Media Player
taskkill /IM WindowsCamera.exe /F
taskkill /IM wmplayer.exe /F

exit
